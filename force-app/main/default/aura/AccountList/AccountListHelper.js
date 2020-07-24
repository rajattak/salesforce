({
	fetchAccounts : function(component,event,helper) {
		component.set('v.accountColumns',[
            {label:'Account Name',fieldName:'Name',type:'text'},
            {label:'Industry',fieldName:'Industry',type:'text'},
            {label:'Phone',fieldName:'Phone',type:'text'}
        ]);
        var action=component.get("c.accountList");
        
        action.setCallback(this,function(response){
            var state=response.getState();
        
            if(state=='SUCCESS'){
            component.set('v.accountList',response.getReturnValue());
        }
        });
        
        $A.enqueueAction(action);
	}
})