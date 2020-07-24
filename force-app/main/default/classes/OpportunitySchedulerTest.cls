/*
 * This test class is created by: rajat.tak on 05/21/2020.
 * This test class is testing OpportunityScheduler class.
 */
@isTest(SeeAllData=true)
public class OpportunitySchedulerTest {
    /*
     * This method is verifying the status.
     */
    @isTest
    public static void opportunitySchedulerTest(){
        OpportunityScheduler opportunitySchedule=new OpportunityScheduler();
        
        Test.startTest();
        String jobId=Database.executeBatch(opportunitySchedule);
        Test.stopTest();
        
        AsyncApexJob job=[select Status from AsyncApexJob where Id=:jobId];
        System.assertEquals('Completed',job.Status);
    }
}