public class AccountCreationUsingUrl {
    @AuraEnabled
    public static void accountInsert(String name){
        Account a=new Account();
        a.Name=name;
        insert a;
    }
}