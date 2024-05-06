import { LightningElement,api,track } from 'lwc';
import getForm from '@salesforce/apex/Lcc_PageLayoutFromFieldsetController.getForm';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { OmniscriptBaseMixin } from "omnistudio/omniscriptBaseMixin";

export default class Os_PageLayoutFromFieldsetComponent extends OmniscriptBaseMixin(LightningElement) {
    @api objectName;
    @api recordId;
    @api fieldSet;
    @api sectionName;
    @api tabDescription;
    @track fields;
    showspinner =true;
    showEditField=false;
    fieldswithdata={};
    isCalledFromOS = false;

    connectedCallback()
    {   
        if(this.omniJsonDataStr){
            this.isCalledFromOS = true;
        }
        if(this.tabDescription !== undefined && this.tabDescription !== null && this.tabDescription.trim() !== '')
        {
            this.showDescription=true;
        }
        getForm({ recordId: this.recordId,objectName:this.objectName, fieldSetName:this.fieldSet})
        .then(result => {
            if (result) {
                let flds =JSON.parse(JSON.stringify(result.Fields));
                flds.forEach(function(each){
                    each.editfield=false;                    
                });
                this.fields = flds;
                this.error = undefined;
            }
        }) .catch(error => {
            this.error = error;
            console.error(error);
        }); 
    }
    handleLoad(){
       this.showspinner=false; 
    }

    validateFields(event) {
        const fields = event.detail.fields;
        this.fieldswithdata = fields;
        return [...this.template.querySelectorAll("lightning-input-field")].reduce((validSoFar, field) => {
            return (validSoFar && field.reportValidity());
        }, true);
    }
    handleSuccess()
    {
        this.showMessage('Record Saved Successfully','success');
        let flds =JSON.parse(JSON.stringify(this.fields));
            flds.forEach(function(each){
                each.editfield=false;
                
            });
        this.fields = flds;
        this.showspinner=false;
        this.showEditField=false;
        if(this.isCalledFromOS){
            let data={};
            data['changedFieldsWithValue'] =  this.fieldswithdata;
            this.omniApplyCallResp(data);
        }
    }
    handleError(e)
    {
        this.template.querySelector('[data-id="message"]').setError(e.detail.detail);
        e.preventDefault();
    }

    showMessage(message,variant)
    {
        const event = new ShowToastEvent({
            title: 'Record Save',
            variant: variant,
            mode: 'dismissable',
            message: message
        });
        //this.dispatchEvent(event);
    }
    //handle edit
    handleEdit(event){
        let flds =JSON.parse(JSON.stringify(this.fields));
            flds.forEach(function(each){
                if(each.APIName === event.currentTarget.dataset.id && each.editable === true){
                    each.editfield=true;
                   
                }
            });
        this.fields = flds;
        this.showEditField=true;
    }
    //handle cancel
    handleCancel(){
        let flds =JSON.parse(JSON.stringify(this.fields));
            flds.forEach(function(each){
                each.editfield=false;
            });
        this.fields = flds;
        this.showEditField=false;
    }
    handleSectionToggle(event) {
        const openSections = event.detail.openSections;

        if (openSections.length === 0) {
            this.activeSectionsMessage = 'All sections are closed';
        } else {
            this.activeSectionsMessage =
                'Open sections: ' + openSections.join(', ');
        }
    }

   
}