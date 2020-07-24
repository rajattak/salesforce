/*
 * Created by: rajat.tak on 06/08/2020.
 * This class works as server side controller for AccountComponent component.
 */
public class AccountInsert {
    /*
     * This method is used to create account.
     */
    @AuraEnabled
    public static Account accountCreate(String name,Date accountDate,String active,Boolean accept){
        Account a=new Account();
        a.Date__c=accountDate;
        a.Name=name;
        a.Active__c=active;
        a.Accept__c=accept;
        
        insert a;
        
        return a;
    }
}