/*
 * Created by: rajat.tak on 06/25/2020.
 * This class works as controller for SearchBox component.
 */
public class SearchController {
    /*
     * This method searches the account,contact and lead with the searchkey.
     */
    @AuraEnabled
    public static List<List<sObject>> searchAccount(String searchKey){
        String s=searchKey+'%';
        
        /*This list contains list of sObject.*/
        List<List<sObject>> allObject=new List<List<sObject>>();
        /*This list contains account.*/
        List<Account> accountList=new List<Account>();
        /*This list contains contact.*/
        List<Contact> contactList=new List<Contact>();
        /*This list contains lead.*/
        List<Lead> leadList=new List<Lead>();
        
        accountList=[select Name from Account where Name Like:s];
        allObject.add(accountList);
        contactList=[select Name from Contact where Name Like:s];
        allObject.add(contactList);
        leadList=[select Name from Lead where Name Like:s];
        allObject.add(leadList);
        
        return allObject;
    }
    
}