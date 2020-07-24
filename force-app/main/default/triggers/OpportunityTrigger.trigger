/*
 * This trigger is created by: rajat.tak on 05/22/2020.
 * It will update the CloseDate of Opportunity whose Stage is updated to 'Closed Won' or 'Closed Lost'.
 */ 
trigger OpportunityTrigger on Opportunity (after update) {
    public static final String won='Closed Won';
    public static final String lost='Closed Lost';
    /* This list contains the opportunity.*/
    List<Opportunity> opportunityList=new List<Opportunity>();
    /* This list contains the opportunity after update.*/
    List<Opportunity> opportunityAfterList=new List<Opportunity>();
    
    for(Opportunity opportunityUpdate:trigger.new){
        if(opportunityUpdate.StageName!=trigger.oldMap.get(opportunityUpdate.Id).StageName){
            if(opportunityUpdate.StageName.equals(won)||opportunityUpdate.StageName.equals(lost)){
                opportunityUpdate.CloseDate=System.today();
                opportunityAfterList.add(opportunityUpdate);
            }
        }
    }
    if(opportunityAfterList.size()!=0){
        update opportunityAfterList;
    }
}