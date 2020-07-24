/*
 * This class is created by: rajat.tak on 05/20/2020.
 * It has a method which is updating contactIds field of account.
 */
public class ContactRelatedToAccount {
    /*
     * This method updates the contactIds field of account.
     */
    public static void contactRelationToAccount(Id contactId){
        
        /* This list contains accounts.*/
        List<Account> accountList=new List<Account>();
        /* This list contains contacts.*/
        List<Contact> contactList=new List<Contact>();
        /* This list contains contact Id after split from string.*/
        List<String> contactIdsAfterSplit=new List<String>();
        /* This list contains contact Id if it is present in contactIdsAfterSplit list.*/
        List<String> idPresentList=new List<String>();
        /* This list contains the accounts to be update.*/
        List<Account> accountUpdateList=new List<Account>();
        
        string idString;
        string idBeforeSplit;
        string idAfterSplit;
       
        Map<Id,List<Contact>> accountContactMap=new Map<Id,List<Contact>>();
        accountList=[select Name,Id,ContactIds__c,(select Name,Id from Contacts) from Account];
        for(Account accountForId:accountList){
            accountContactMap.put(accountForId.Id,accountForId.Contacts);
        }
        for(Account a:accountList){
            if(a.ContactIds__c==null){
                /* This list contains the contact Id.*/
                List<String> contactIds=new List<String>();
                contactList=accountContactMap.get(a.Id);
                
                //contactList=[select Name,Id from Contact where AccountId=:a.Id];
                for(Contact contactIdToAdd:contactList){
                    contactIds.add(contactIdToAdd.Id);
                }
                /* This will convert list of Id to string of Id seperated by ',' seperator.*/
                idString=String.join(contactIds,',');
                a.ContactIds__c=idString;
                accountUpdateList.add(a);
            }
            else{
                idBeforeSplit=a.ContactIds__c;
                /* This will split the string by ',' seperator and returns a list.*/
                contactIdsAfterSplit=idBeforeSplit.split(',');
                if(!contactIdsAfterSplit.contains(a.Id)){
                contactIdsAfterSplit.add(contactId);
                idAfterSplit=string.join(contactIdsAfterSplit,',');
                a.ContactIds__c=idAfterSplit;
                accountUpdateList.add(a);
                }
            }    
        }
        update accountUpdateList;
    }
}