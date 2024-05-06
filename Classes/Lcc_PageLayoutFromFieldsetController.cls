{\rtf1\ansi\ansicpg1252\cocoartf2761
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red15\green112\blue1;\red255\green255\blue254;\red0\green0\blue0;
\red0\green0\blue255;\red14\green110\blue109;\red109\green109\blue109;\red144\green1\blue18;}
{\*\expandedcolortbl;;\cssrgb\c0\c50196\c0;\cssrgb\c100000\c100000\c99608;\cssrgb\c0\c0\c0;
\cssrgb\c0\c0\c100000;\cssrgb\c0\c50196\c50196;\cssrgb\c50196\c50196\c50196;\cssrgb\c63922\c8235\c8235;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs24 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 /*\cf0 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 * Author       :Baibhav kumar\cf0 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 * Purpose      : This apex class is used to call Lcc_PageLayoutFromFieldsetController         \cf0 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 */\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf5 \cb3 \strokec5 public\cf0 \strokec4  without sharing \cf5 \strokec5 class\cf0 \strokec4  \cf6 \cb3 \strokec6 Lcc_PageLayoutFromFieldsetController\cf0 \cb3 \strokec4  \{\cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf0 \cb3 \strokec4     \cf5 \strokec5 public\cf0 \strokec4  \cf5 \strokec5 static\cf0 \strokec4  \cf6 \cb3 \strokec6 DescribeSObjectResult\cf0 \cb3 \strokec4  objResult;\cb1 \strokec4 \
\cb3 \strokec4     \cf5 \strokec5 public\cf0 \strokec4  \cf5 \strokec5 static\cf0 \strokec4  \cf5 \strokec5 Map\cf0 \strokec4 <\cf6 \cb3 \strokec6 String\cf0 \cb3 \strokec4 , \cf6 \cb3 \strokec6 Schema\cf0 \cb3 \strokec4 .\cf6 \cb3 \strokec6 SObjectField\cf0 \cb3 \strokec4 > fsMap;\cb1 \strokec4 \
\cb3 \strokec4     \cf7 \strokec7 @AuraEnabled\cf0 \cb1 \strokec4 \
\cb3 \strokec4     \cf5 \strokec5 public\cf0 \strokec4  \cf5 \strokec5 static\cf0 \strokec4  \cf6 \cb3 \strokec6 FieldSetForm\cf0 \cb3 \strokec4  getForm(\cf6 \cb3 \strokec6 Id\cf0 \cb3 \strokec4  recordId, \cf6 \cb3 \strokec6 String\cf0 \cb3 \strokec4  objectName, \cf6 \cb3 \strokec6 String\cf0 \cb3 \strokec4  fieldSetName) \{\cb1 \strokec4 \
\cb3 \strokec4         \cf2 \strokec2 // Get the describe for the object\cf0 \cb1 \strokec4 \
\cb3 \strokec4         objResult = \cf6 \cb3 \strokec6 Schema\cf0 \cb3 \strokec4 .getGlobalDescribe().\cf5 \strokec5 get\cf0 \strokec4 (objectName).getDescribe();\cb1 \strokec4 \
\cb3 \strokec4         fsMap = objResult.fields.getMap();\cb1 \strokec4 \
\cb3 \strokec4         \cf6 \cb3 \strokec6 FieldSetForm\cf0 \cb3 \strokec4  form = \cf5 \strokec5 new\cf0 \strokec4  \cf6 \cb3 \strokec6 FieldSetForm\cf0 \cb3 \strokec4 ();        \cb1 \strokec4 \
\cb3 \strokec4         form.\cf6 \cb3 \strokec6 Fields\cf0 \cb3 \strokec4  = getFields(recordId, objectName, fieldSetName);\cb1 \strokec4 \
\cb3 \strokec4         \cb1 \strokec4 \
\cb3 \strokec4         \cf5 \strokec5 return\cf0 \strokec4  form;\cb1 \strokec4 \
\cb3 \strokec4     \}\cb1 \strokec4 \
\cb3 \strokec4     \cb1 \strokec4 \
\cb3 \strokec4     \cf5 \strokec5 private\cf0 \strokec4  \cf5 \strokec5 static\cf0 \strokec4  \cf5 \strokec5 List\cf0 \strokec4 <\cf6 \cb3 \strokec6 FormField\cf0 \cb3 \strokec4 > getFields(\cf6 \cb3 \strokec6 Id\cf0 \cb3 \strokec4  recordId, \cf6 \cb3 \strokec6 String\cf0 \cb3 \strokec4  objectName, \cf6 \cb3 \strokec6 String\cf0 \cb3 \strokec4  fieldSetName) \{\cb1 \strokec4 \
\cb3 \strokec4         \cf6 \cb3 \strokec6 Schema\cf0 \cb3 \strokec4 .\cf6 \cb3 \strokec6 SObjectType\cf0 \cb3 \strokec4  objectType = \cf5 \strokec5 null\cf0 \strokec4 ;\cb1 \strokec4 \
\cb3 \strokec4         \cb1 \strokec4 \
\cb3 \strokec4         \cf5 \strokec5 if\cf0 \strokec4  (recordId != \cf5 \strokec5 null\cf0 \strokec4 ) \{\cb1 \strokec4 \
\cb3 \strokec4             objectType = recordId.getSobjectType();\cb1 \strokec4 \
\cb3 \strokec4         \}\cb1 \strokec4 \
\cb3 \strokec4         \cf5 \strokec5 else\cf0 \strokec4  \cf5 \strokec5 if\cf0 \strokec4  (\cf6 \cb3 \strokec6 String\cf0 \cb3 \strokec4 .isNotBlank(objectName)) \{\cb1 \strokec4 \
\cb3 \strokec4             objectType = \cf6 \cb3 \strokec6 Schema\cf0 \cb3 \strokec4 .getGlobalDescribe().\cf5 \strokec5 get\cf0 \strokec4 (objectName);\cb1 \strokec4 \
\cb3 \strokec4         \}\cb1 \strokec4 \
\cb3 \strokec4         \cb1 \strokec4 \
\cb3 \strokec4         \cf6 \cb3 \strokec6 Schema\cf0 \cb3 \strokec4 .\cf6 \cb3 \strokec6 DescribeSObjectResult\cf0 \cb3 \strokec4  objectDescribe = objectType.getDescribe();\cb1 \strokec4 \
\cb3 \strokec4         \cf5 \strokec5 Map\cf0 \strokec4 <\cf6 \cb3 \strokec6 String\cf0 \cb3 \strokec4 , \cf6 \cb3 \strokec6 Schema\cf0 \cb3 \strokec4 .\cf6 \cb3 \strokec6 FieldSet\cf0 \cb3 \strokec4 > fieldSetMap = objectDescribe.fieldSets.getMap();\cb1 \strokec4 \
\cb3 \strokec4         \cf6 \cb3 \strokec6 Schema\cf0 \cb3 \strokec4 .\cf6 \cb3 \strokec6 FieldSet\cf0 \cb3 \strokec4  fieldSet = fieldSetMap.\cf5 \strokec5 get\cf0 \strokec4 (fieldSetName);\cb1 \strokec4 \
\cb3 \strokec4         \cf5 \strokec5 List\cf0 \strokec4 <\cf6 \cb3 \strokec6 Schema\cf0 \cb3 \strokec4 .\cf6 \cb3 \strokec6 FieldSetMember\cf0 \cb3 \strokec4 > fieldSetMembers = fieldSet.getFields();\cb1 \strokec4 \
\cb3 \strokec4         \cb1 \strokec4 \
\cb3 \strokec4         \cf5 \strokec5 List\cf0 \strokec4 <\cf6 \cb3 \strokec6 FormField\cf0 \cb3 \strokec4 > fields = \cf5 \strokec5 new\cf0 \strokec4  \cf5 \strokec5 List\cf0 \strokec4 <\cf6 \cb3 \strokec6 FormField\cf0 \cb3 \strokec4 >();\cb1 \strokec4 \
\cb3 \strokec4         \cf5 \strokec5 for\cf0 \strokec4  (\cf6 \cb3 \strokec6 Schema\cf0 \cb3 \strokec4 .\cf6 \cb3 \strokec6 FieldSetMember\cf0 \cb3 \strokec4  fsm : fieldSetMembers) \{\cb1 \strokec4 \
\cb3 \strokec4             \cf6 \cb3 \strokec6 FormField\cf0 \cb3 \strokec4  f = \cf5 \strokec5 new\cf0 \strokec4  \cf6 \cb3 \strokec6 FormField\cf0 \cb3 \strokec4 (fsm);\cb1 \strokec4 \
\cb3 \strokec4             fields.add(f);\cb1 \strokec4 \
\cb3 \strokec4         \}\cb1 \strokec4 \
\cb3 \strokec4         \cf5 \strokec5 System\cf0 \strokec4 .debug(\cf8 \strokec8 '****'\cf0 \strokec4 +fields);\cb1 \strokec4 \
\cb3 \strokec4         \cb1 \strokec4 \
\cb3 \strokec4         \cf5 \strokec5 return\cf0 \strokec4  fields;\cb1 \strokec4 \
\cb3 \strokec4     \}\cb1 \strokec4 \
\cb3 \strokec4     \cb1 \strokec4 \
\cb3 \strokec4     \cf5 \strokec5 public\cf0 \strokec4  \cf5 \strokec5 class\cf0 \strokec4  \cf6 \cb3 \strokec6 FieldSetForm\cf0 \cb3 \strokec4  \{\cb1 \strokec4 \
\cb3 \strokec4         \cf7 \strokec7 @AuraEnabled\cf0 \cb1 \strokec4 \
\cb3 \strokec4         \cf5 \strokec5 public\cf0 \strokec4  \cf5 \strokec5 List\cf0 \strokec4 <\cf6 \cb3 \strokec6 FormField\cf0 \cb3 \strokec4 > \cf6 \cb3 \strokec6 Fields\cf0 \cb3 \strokec4  \{ \cf5 \strokec5 get\cf0 \strokec4 ; \cf5 \strokec5 set\cf0 \strokec4 ; \}\cb1 \strokec4 \
\cb3 \strokec4         \cb1 \strokec4 \
\cb3 \strokec4         \cf5 \strokec5 public\cf0 \strokec4  \cf6 \cb3 \strokec6 FieldSetForm\cf0 \cb3 \strokec4 () \{\cb1 \strokec4 \
\cb3 \strokec4             \cf6 \cb3 \strokec6 Fields\cf0 \cb3 \strokec4  = \cf5 \strokec5 new\cf0 \strokec4  \cf5 \strokec5 List\cf0 \strokec4 <\cf6 \cb3 \strokec6 FormField\cf0 \cb3 \strokec4 >();\cb1 \strokec4 \
\cb3 \strokec4         \}\cb1 \strokec4 \
\cb3 \strokec4     \}\cb1 \strokec4 \
\cb3 \strokec4     \cf5 \strokec5 public\cf0 \strokec4  \cf5 \strokec5 class\cf0 \strokec4  \cf6 \cb3 \strokec6 FormField\cf0 \cb3 \strokec4  \{\cb1 \strokec4 \
\cb3 \strokec4         \cf7 \strokec7 @AuraEnabled\cf0 \cb1 \strokec4 \
\cb3 \strokec4         \cf5 \strokec5 public\cf0 \strokec4  \cf6 \cb3 \strokec6 String\cf0 \cb3 \strokec4  \cf6 \cb3 \strokec6 APIName\cf0 \cb3 \strokec4   \{ \cf5 \strokec5 get\cf0 \strokec4 ; \cf5 \strokec5 set\cf0 \strokec4 ; \}\cb1 \strokec4 \
\cb3 \strokec4         \cf7 \strokec7 @AuraEnabled\cf0 \cb1 \strokec4 \
\cb3 \strokec4         \cf5 \strokec5 public\cf0 \strokec4  \cf5 \strokec5 Boolean\cf0 \strokec4  editable  \{ \cf5 \strokec5 get\cf0 \strokec4 ; \cf5 \strokec5 set\cf0 \strokec4 ; \}\cb1 \strokec4 \
\cb3 \strokec4         \cf7 \strokec7 @AuraEnabled\cf0 \cb1 \strokec4 \
\cb3 \strokec4         \cf5 \strokec5 public\cf0 \strokec4  \cf5 \strokec5 Boolean\cf0 \strokec4  readable  \{ \cf5 \strokec5 get\cf0 \strokec4 ; \cf5 \strokec5 set\cf0 \strokec4 ; \}\cb1 \strokec4 \
\cb3 \strokec4         \cb1 \strokec4 \
\cb3 \strokec4         \cf6 \cb3 \strokec6 FormField\cf0 \cb3 \strokec4 (\cf6 \cb3 \strokec6 Schema\cf0 \cb3 \strokec4 .\cf6 \cb3 \strokec6 FieldSetMember\cf0 \cb3 \strokec4  fsm)\{\cb1 \strokec4 \
\cb3 \strokec4             \cf5 \strokec5 system\cf0 \strokec4 .debug(\cf8 \strokec8 'fsm:'\cf0 \strokec4 +fsMap.\cf5 \strokec5 get\cf0 \strokec4 (fsm.getFieldPath()).getDescribe().isUpdateable());\cb1 \strokec4 \
\cb3 \strokec4             \cf6 \cb3 \strokec6 DescribeFieldResult\cf0 \cb3 \strokec4  fld = fsMap.\cf5 \strokec5 get\cf0 \strokec4 (fsm.getFieldPath()).getDescribe();\cb1 \strokec4 \
\cb3 \strokec4             \cf5 \strokec5 if\cf0 \strokec4 (fld.isUpdateable())\{\cb1 \strokec4 \
\cb3 \strokec4                 \cf5 \strokec5 this\cf0 \strokec4 .editable=\cf5 \strokec5 true\cf0 \strokec4 ;\cb1 \strokec4 \
\cb3 \strokec4             \}\cf5 \strokec5 else\cf0 \strokec4 \{\cb1 \strokec4 \
\cb3 \strokec4                 \cf5 \strokec5 this\cf0 \strokec4 .editable=\cf5 \strokec5 false\cf0 \strokec4 ;\cb1 \strokec4 \
\cb3 \strokec4             \}\cb1 \strokec4 \
\cb3 \strokec4             \cf5 \strokec5 if\cf0 \strokec4 (fld.isCalculated())\{\cb1 \strokec4 \
\cb3 \strokec4                 \cf5 \strokec5 this\cf0 \strokec4 .editable=\cf5 \strokec5 false\cf0 \strokec4 ;\cb1 \strokec4 \
\cb3 \strokec4             \}\cb1 \strokec4 \
\cb3 \strokec4             \cf5 \strokec5 if\cf0 \strokec4 (fld.isAccessible())\{\cb1 \strokec4 \
\cb3 \strokec4                 \cf5 \strokec5 this\cf0 \strokec4 .readable=\cf5 \strokec5 true\cf0 \strokec4 ;\cb1 \strokec4 \
\cb3 \strokec4             \}\cf5 \strokec5 else\cf0 \strokec4 \{\cb1 \strokec4 \
\cb3 \strokec4                  \cf5 \strokec5 this\cf0 \strokec4 .readable=\cf5 \strokec5 false\cf0 \strokec4 ;\cb1 \strokec4 \
\cb3 \strokec4             \}\cb1 \strokec4 \
\cb3 \strokec4             \cf5 \strokec5 this\cf0 \strokec4 .\cf6 \cb3 \strokec6 APIName\cf0 \cb3 \strokec4 =fsm.getFieldPath();\cb1 \strokec4 \
\cb3 \strokec4         \}\cb1 \strokec4 \
\cb3 \strokec4         \cb1 \strokec4 \
\cb3 \strokec4     \}\cb1 \strokec4 \
\cb3 \strokec4 \}\cb1 \strokec4 \
}