/*
 * Created by:rajat.tak on 06/10/2020.
 * This class works as server side controller for AccountListWithPagination component.
 */
public class AccountListForPagination {
    /*
     * This method is used to return the list of account.
     */
    @AuraEnabled
    public static List<Account> accountList(){
        List<Account> accountForControllerList=new List<Account>();
        accountForControllerList=[select Name,Date__c,Active__c from Account order by CreatedDate desc Limit 100];
        return accountForControllerList;
    }
    
    /*
     * This method is used to return list of contact.
     */
    @AuraEnabled
    public static List<Contact> contactList(Id a){
        List<Contact> contactForControllerList=new List<Contact>();
        contactForControllerList=[select FirstName,LastName from Contact where AccountId=:a];
        return contactForControllerList;
    }
    
    /*
     * This method is used to create the contact.
     */
    @AuraEnabled
    public static Id createContact(Contact contact,Id accountId){
        Contact a=new Contact();
        a.FirstName=contact.FirstName;
        a.LastName=contact.LastName;
        a.AccountId=accountId;
        insert a;
        return a.Id;
    }
}