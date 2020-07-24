/*
 * This trigger is created by: rajat.tak on 05/22/2020.
 * It will give a error message when a class is delete and have more than one female student.
 */
trigger ClassTrigger on Class__c (before delete) {
    public static final String studentSex='Female';
    /* This list contains the class having more than one female student.*/
    List<Class__c> classList=new List<Class__c>();
    /* This map contains Id and Class__c.*/
    Map<Id,Class__c> classMapToDelete=trigger.oldMap;
    /* This map contains the Id and Class__c having female student.*/
    Map<Id,Class__c> classMap=new Map<Id,Class__c>([select Name,(select Name,Sex__c from Students__r where Sex__c='Female') from Class__c where Id IN:trigger.oldMap.keySet()]);
    integer i=0;
    
    for(Class__c c:classMap.values()){
        for(Student__c s:c.Students__r){
            if(s.Sex__c==studentSex){
                i=i+1;
            }
            if(i>1){
                classList.add(c);
            }
        }
    }
    for(Class__c classToDelete:classList){
        classMapToDelete.get(classToDelete.Id).addError(System.label.ClassBeforeDelete);
    }
    }