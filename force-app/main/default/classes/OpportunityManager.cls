/*
 * This class is created by: rajat.tak on 05/20/2020.
 * It updates the opportunity.
 */
public class OpportunityManager {
    /*
     * This method manager feild of all opportunities in the listOfOpportunities.
     */
    public static void assignManagerToOpportunity(List<Opportunity> listOfOpportunities){
        /* This method contains the list of opportunities.*/
        List<Opportunity> opportunityList=new List<Opportunity>();
        for(Opportunity oppt:listOfOpportunities){
            if(oppt.BillToContact__c!=null){
                if(oppt.Manager__c==null){
                    oppt.Manager__c=oppt.AccountId;
                    opportunityList.add(oppt);
                }
            }
        }
        update opportunityList;
    }
}