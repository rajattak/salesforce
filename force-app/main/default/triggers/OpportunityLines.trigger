/*
 * This trigger is created by: rajat.tak on 05/22/2020.
 * It will delete the opportunitylineitem of opportunity when Custom_Status__c is update to 'Reset'.
 */
trigger OpportunityLines on Opportunity (after Update) {
    /* This list contains the opportunity.*/
    List<Opportunity> opportunityList=new List<Opportunity>();
    /* This list contains the opportunitylineitem.*/
    List<OpportunityLineItem> oliList=new List<OpportunityLineItem>();
    /* This list contains the Id of opportunity after update.*/
    List<Id> afterUpdateList=new List<Id>();
    
    for(Opportunity opportunityUpdate:trigger.new){
        if(opportunityUpdate.Custom_Status__c!=trigger.oldMap.get(opportunityUpdate.Id).Custom_Status__c && opportunityUpdate.Custom_Status__c.equals('Reset')){
            afterUpdateList.add(opportunityUpdate.Id);
        }
    }
    
    OpportunityLineItem oli=new OpportunityLineItem();
    oliList=[select Id from OpportunityLineItem where OpportunityId In:afterUpdateList];
    if(oliList.size()!=0){
        delete oliList;
    }
}