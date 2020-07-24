/*
 * This class is created by: rajjat.tak on 05/20/2020.
 * It will send mail to all opportunity owner whose opportunity are not modified for last 30 days.
 */
global class OpportunityScheduler implements Database.Batchable<sObject> {
    /* This string contains the query to fetch all all opportunities that are not modified for last 30 days.*/
    global final string query='select Id,OwnerId from Opportunity where LastModifiedDate=LAST_N_DAYS:30';
    
    /*
     * This method returns all records that are used for processing.
     */
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(query);
    }
    
    /*
     * This method sends email to all opportunity owner whose opportunity are not modifird for last 30 days.
     */
    global void execute(Database.BatchableContext bc,List<Opportunity> scope){
        /* This list contains the email Id of to which we have to email.*/
        List<String> emailList=new List<String>();
        /* This list contains the owner of opportunities.*/
        List<Id> ownerIdList=new List<Id>();
        /* This list contains the user who created opportunities.*/
        List<User> userList=new List<User>();
        /* This list contains the email to be send to all opportunity owners.*/
        List<Messaging.Email> emailToSendList=new List<Messaging.Email>();
        
        for(Opportunity opportunityToEmail:scope){
            ownerIdList.add(opportunityToEmail.OwnerId);
        }
        
        /* This will create a email of type SingleEmailMessage.*/
        Messaging.SingleEmailMessage opportunityEmail=new Messaging.SingleEmailMessage();
        opportunityEmail.setSubject('Opportunity is not modifies for last 30 days');
        opportunityEmail.setPlainTextBody('Please Update your opportunity.');
        
        userList=[select Email from User where Id IN:ownerIdList];
        for(User u:userList){
            emailList.add(u.Email);
        }
        system.debug(scope.size());
        opportunityEmail.setToAddresses(emailList);
        emailToSendList.add(opportunityEmail);
        Messaging.sendEmail(emailToSendList);
    }
    
    global void finish(Database.BatchableContext bc){
        
    }
}