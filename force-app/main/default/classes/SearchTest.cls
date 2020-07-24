/*
 * Created by: rajat.tak on 06/25/2020.
 * This class is testing methods of SearchController class.
 */
@isTest
public class SearchTest {
    /*
     * This method contains the records for the test methods.
     */
    @testSetup
    public static void setupMethod(){
        Account a=new Account();
        a.Name='Account';
        insert a;
        Contact contact=new Contact();
        contact.LastName='Account';
        insert contact;
        Lead lead=new Lead();
        lead.LastName='Account';
        lead.Company='Account';
        lead.Status='Open';
        insert lead;
    }
    
    /*
     * This method is testing the searchAccount method of SearchController class.
     */
    @isTest
    public static void controllerTest(){
        List<List<sObject>> allObject=new List<List<sObject>>();
        allObject=SearchController.searchAccount('Account');
        System.assertEquals(3,allObject.size());
    }
}