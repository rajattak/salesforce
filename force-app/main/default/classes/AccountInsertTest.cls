/*
 * Created by: rajat.tak on 06/08/2020.
 * This test class is testing createAccount method of AccountInsert class.
 */
@isTest
public class AccountInsertTest {
    /*
     * This method is testing the account which is insert through component.
     */
    @isTest
    public static void accountTest(){
        Account a=new Account();
        
        Test.startTest();
        AccountInsert.accountCreate('Aura Account','Yes',true);
        Test.stopTest();
        
        a=[select Name,Active__c,Accept__c from Account];
        
        System.assertEquals('Aura Account',a.Name);
        System.assertEquals('Yes',a.Active__c);
        System.assertEquals(true,a.Accept__c);
    }
}