/*
 * This trigger is created by: rajat.tak on 05/22/2020.
 */
trigger StudentTrigger on Student__c (before insert,after insert,after delete) {
    if(trigger.isInsert){
        if(trigger.isBefore){
            /* This map contains the Id and Class__c*/
            Map<Id,Class__c> classmap=new Map<Id,Class__c>([select Id,NumberOfStudents__c,MaxSize__c from Class__c]);
            
            for(Student__c s:trigger.new){
                if(classMap.get(s.Class__c).NumberOfStudents__c==classMap.get(s.Class__c).MaxSize__c){
                    /* This error message is displayed when the maximum size of class is reached.*/
                    s.addError(System.label.StudentBeforeInsert);
                }
            }
        }
        
        if(trigger.isAfter){
            /* This list contains the students after insert.*/
            List<Student__c> studentList=new List<Student__c>();
            /* This list contains the class of the students after insert.*/
            List<Class__c> classList=new List<Class__c>();
            /* This list contains the Id of class.*/
            List<Id> classId=new List<Id>();
            /* This list contains the class after the MyCount__c update.*/
            List<Class__c> updateClass=new List<Class__c>();
            
            studentList=[select Name,Class__c from Student__c where Id In:trigger.newMap.keySet()];
            for(Student__c s:studentList){
                classId.add(s.Class__c);
            }
     
            classList=[select Name,MyCount__c,NumberOfStudents__c from Class__c where Id In:classId];
            for(Class__c c:classList){
                c.MyCount__c=c.NumberOfStudents__c+1;
                updateClass.add(c);
            }
            update updateClass;
        }
    }
    
    if(trigger.isDelete){
        if(trigger.isAfter){
            /* This list contains the class whose students are delete.*/
            List<Class__c> classList=new List<Class__c>();
            /* This list contains the Id of class whose students are delete.*/
            List<Id> classId=new List<Id>();
            /* This list contains the after the MyCount__c is update.*/
            List<Class__c> updateClass=new List<Class__c>();
            
            for(Student__c s:trigger.old){
                classId.add(s.Class__c);
            }
            
            classList=[select Name,MyCount__c,NumberOfStudents__c from Class__c where Id In:classId];
            for(Class__c c:classList){
                c.MyCount__c=c.NumberOfStudents__c-1;
                updateClass.add(c);
            }
            update updateClass;
        }
    }

}