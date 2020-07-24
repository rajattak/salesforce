({
    doInit : function(component, event, helper) {
		component.set('v.accountColumns',{label:'Account Name',fieldName:'Name',type:'text'});
        component.set('v.contactColumns',{label:'Contact Name',fieldName:'Name',type:'text'});
        component.set('v.leadColumns',{label:'Lead Name',fieldName:'Name',type:'text'});
	},
    
    handleChange:function(component,event,helper){
        var searchKey=component.find('searchKey').get('v.value');
        if(searchKey.length>=3){
            component.set('v.searchAccount',true);
            var action=component.get("c.searchAccount");
            action.setParams({'searchKey':searchKey});
            action.setCallback(this,function(response){
                var state=response.getState();
                if(state==='SUCCESS'){
                    component.set('v.accountData',response.getReturnValue()[0]);
                    component.set('v.contactData',response.getReturnValue()[1]);
                    component.set('v.leadData',response.getReturnValue()[2]);
                }
            });
            $A.enqueueAction(action);
        }           
    }
})