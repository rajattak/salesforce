/*
 * Created by: rajat.tak on 06/01/2020.
 * This class works as controller class for AccountList component.
 */
public class AccountListController {
    /*
     * This method returns the List of ten accounts to AccountListController.
     */
    @AuraEnabled
    public static List<Account> accountList(){
        List<Account> accountForControllerList=new List<Account>();
        accountForControllerList=[select Name,Industry,Phone from Account order by CreatedDate desc Limit 10];
        return accountForControllerList;
    }
}