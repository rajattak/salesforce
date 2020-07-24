/*
 * Created by:rajat.tak on 06/12/2020.
 * This class is testing AccountListForPagination controller.
 */
@isTest
public class AccountListPaginationTest {
    /*
     * This method is creating account records for test.
     */
    @testSetup
    public static void accountSetup(){
        List<Account> accountList=new List<Account>();
        for(integer i=0;i<200;i++){
            Account a=new Account();
            a.Name='Account'+i;
            a.Date__c=System.today()+1;
            a.Active__c='Yes';
            accountList.add(a);
        }
        insert accountList;
    }
    
    /*
     * This method is testing accountList method of AccountListForPagination controller.
     */
    @isTest
    public static void accountListForPagination(){
        List<Account> accountController=new List<Account>();
        Test.startTest();
        accountController=AccountListForPagination.accountList();
        Test.stopTest();
        System.assertEquals(100,accountController.size());
    }
    
    /*
     * This method is testing contactList method of AccountListForPagination controller.
     */
    @isTest
    public static void contactListForAccount(){
        Account a=new Account();
        a.Name='Account';
        insert a;
        Contact contact=new Contact();
        contact.LastName='Account';
        contact.AccountId=a.Id;
        insert contact;
        List<Contact> contactList=new List<Contact>();
        Test.startTest();
        contactList=AccountListForPagination.contactList(a.Id);
        Test.stopTest();
        System.assertEquals(1,contactList.size());
    }
    
    /*
     * This method is testing createContact method of AccountListForPagination controller.
     */
    @isTest
    public static void createContactForAccount(){
        Account a=new Account();
        a.Name='Account';
        insert a;
        Contact contact=new Contact();
        contact.FirstName='Account';
        contact.LastName='Account';
        List<Contact> contactList=new List<Contact>();
        Test.startTest();
        AccountListForPagination.createContact(contact,a.Id);
        Test.stopTest();
        contactList=[select Id from Contact where AccountId=:a.Id];
        System.assertEquals(1,contactList.size());
    }
}