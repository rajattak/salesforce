/*
 * This test class is created by: rajat.tak on 05/21/2020.
 * This class is testing ContactRelatedToAccount class.
 */
@isTest
public class ContactStudentRelationTest {
    /*
     * This method is verifing wether the ContactIds__c feild is updating or not.
     */
    @isTest
    public static void accountContactRelationTest(){
        Account a=new Account(Name='Fresh Account');
        insert a;
        Contact firstContact=new Contact(LastName='Fresh Account',AccountId=a.Id);
        insert firstContact;
        Contact secondContact=new Contact(LastName='FreshAccount');
        insert secondContact;
        
        Account accountUpdated=new Account();
        String s=firstContact.Id;
        
        Test.startTest();
        ContactRelatedToAccount.contactRelationToAccount(secondContact.Id);
        Test.stopTest();
        
        accountUpdated=[select Name,ContactIds__c from Account];
        System.assertEquals(s,accountUpdated.ContactIds__c);
    }
}