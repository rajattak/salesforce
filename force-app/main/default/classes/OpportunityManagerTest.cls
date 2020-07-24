/*
 * This test class is created by: rajat.tak on 05/21/2020.
 * This test class is testing the OpportunityManager class.
 */
@isTest
public class OpportunityManagerTest {
    /*
     * This method is verifying that Manager__c field is updated.
     */
    @isTest
    public static void assignManagerToOpportunityTest(){
        Account a=new Account(Name='Fresh Account');
        insert a;
        Contact c=new Contact(LastName='Fresh Account');
        insert c;
        Opportunity opportunityToUpdate=new Opportunity(Name='Fresh Account',AccountId=a.Id,BillToContact__c=c.Id,CloseDate=System.today(),StageName='Closed Won');
        insert opportunityToUpdate;
        
        List<Opportunity> opportunityList=new List<Opportunity>();
        opportunityList.add(opportunityToUpdate);
        Opportunity opportunityUpdated=new Opportunity();
        
        Test.startTest();
        OpportunityManager.assignManagerToOpportunity(opportunityList);
        Test.stopTest();
        
        opportunityUpdated=[select Name,Manager__c,AccountId from Opportunity];
        System.assertEquals(a.Id,opportunityUpdated.AccountId);
    }
}