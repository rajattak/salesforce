@isTest
public class AccountListControllerTest {
    /*
     * This method is testing the AccountListController class.
     */
    @isTest
    public static void accountController(){
        List<Account> accountList=new List<Account>();
        List<Account> controllerList=new List<Account>();
        
        String name='Account';
        String phone='9877867696';
        
        for(integer i=0;i<10;i++){
            Account a=new Account();
            a.Name=name+i;
            a.Phone=phone;
            accountList.add(a);
        }
        
        Test.startTest();
        insert accountList;
        Test.stopTest();
        
        controllerList=AccountListController.accountList();
        
        System.assertEquals(10,controllerList.size());
    }
}