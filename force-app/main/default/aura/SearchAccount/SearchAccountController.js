({
	doInit : function(component, event, helper) {
		component.set('v.columns',{label:'Account Name',fieldName:'Name',type:'text'});
	},
    handleEvent:function(component,event,helper){
        var searchParameter=event.getParameter("searchKey");
        console.log(searchParameter);
        var action=component.get("c.searchAccount");
        action.setParams({'searchKey':searchParameter});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
                component.set("v.accountData",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})