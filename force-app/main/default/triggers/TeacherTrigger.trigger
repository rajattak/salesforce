/*
 * This trigger is created by: rajat.tak on 05/22/2020.
 * It will show a error message if a teacher is insert or update with subject 'Hindi'.
 */
trigger TeacherTrigger on Contact (before insert, before update) {
    public static final String subject='Hindi';
    if(trigger.isInsert && trigger.isBefore){
        for(Contact contact:trigger.new){
            if(contact.Subjects__c==subject){
                contact.addError(System.label.TeacherBeforeInsert);
            }
        }
    }
    if(trigger.isUpdate && trigger.isBefore){
        for(Contact contact:trigger.new){
            if(contact.Subjects__c==subject){
                contact.addError(System.label.TeacherBeforeUpdate);
            }
        }
    }
}