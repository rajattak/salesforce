({
	doInit : function(component, event, helper) {
        helper.fetchAccounts(component,event,helper);
	},
    handleEvent:function(component,event,helper){
        var accountParameter=event.getParam('account');
        var accounts=component.get("v.accountList");
        accounts.push(accountParameter);
        component.set("v.accountList",accounts);
        var a=component.get('c.doInit');
        $A.enqueueAction(a);
    }
})