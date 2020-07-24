({
    doInit : function(component, event, helper) {
		component.set('v.columns',[
            {label:'Account Name',fieldName:'Name',type:'text'},
            {label:'Date',fieldName:'Date__c',type:'Date'},
            {label:'Active',fieldName:'Active__c',type:'text'},
            {label:'Edit',type:'button',typeAttributes:{label:'Edit',name:'Edit',title:'Edit',value:'Edit'}},
            {label:'Contact',type:'button',typeAttributes:{label:'Contact',name:'Contact',title:'Contact',value:'Contact'}}
        ]);
        
        helper.fetchAccounts(component);
        
	},
    
    next: function (component, event, helper) {
    helper.next(component, event);
    },
    
    previous: function (component, event, helper) {
    helper.previous(component, event);
    },
    
    handleEvent:function(component,event,helper){
        var accountParameter=event.getParam('account');
        var accounts=component.get("v.PaginationList");
        accounts.push(accountParameter);
        component.set("v.PaginationList",accounts);
        var a=component.get('c.doInit');
        $A.enqueueAction(a);
    },
    
    editRecord:function(component,event,helper){
        var actionName=event.getParam('action').name;
        var accountId=event.getParam('row').Id;
        component.set('v.contactId',accountId);
        if(actionName=='Edit'){
            var editData=$A.get("e.force:editRecord");
            editData.setParams({'recordId':accountId});
            editData.fire();
        }
        else if(actionName=='Contact'){
            component.set('v.model',true);
            var action=component.get('c.contactList');
            action.setParams({'a':accountId});
            action.setCallback(this,function(response){
                var state=response.getState();
                if(state==='SUCCESS'){
                    component.set('v.contactList',response.getReturnValue());
                }
            });
            $A.enqueueAction(action);
            }
    },
    
    handleModel:function(component,event,helper){
        component.set('v.modelToCreateContact',true);
    },
    
    createContactForAccount:function(component,event,helper){
        var contactId=component.get("v.contactId");
        var contact=component.get("v.contactName");
        var action=component.get('c.createContact');
        action.setParams({
            'contact':contact,
            'accountId':contactId
        });
        action.setCallback(this,function(response){
            let state=response.getState();
            if(state==='SUCCESS'){
                alert("Contact created with Id "+response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
    
})