/*
 * This class is created by: rajat.tak on 05/20/2020.
 * It will execute the batch class OpportunityScheduler.
 */
global class ScheduleOpportunity implements Schedulable{
    /*
     * This method execute the OpportunityScheduler batch class.
     */
    global void execute(SchedulableContext sc){
        OpportunityScheduler opportunitySchedule=new OpportunityScheduler();
        Database.executeBatch(opportunitySchedule);
    }
}