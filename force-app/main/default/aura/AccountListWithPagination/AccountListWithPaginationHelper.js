({
	fetchAccounts : function(component) {
		var action=component.get("c.accountList");
        
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
                var pageSize = component.get("v.pageSize");
                component.set('v.AccountData', response.getReturnValue());
                component.set("v.totalRecords", component.get("v.AccountData").length);
                component.set("v.startPage",0);
                component.set("v.endPage",pageSize-1);
                var PaginationList = [];
                
                for(var i=0; i< pageSize; i++){
                    if(component.get("v.AccountData").length> i)
                        PaginationList.push(response.getReturnValue()[i]);    
                }
                component.set('v.PaginationList', PaginationList);
            }
            else{
                alert('ERROR');
            }
        });
        $A.enqueueAction(action);
	},
    
    next : function(component, event){
        var sObjectList = component.get("v.AccountData");
        var end = component.get("v.endPage");
        var start = component.get("v.startPage");
        var pageSize = component.get("v.pageSize");
        var Paginationlist = [];
        var counter = 0;
        
        for(var i=end+1; i<end+pageSize+1; i++){
            if(sObjectList.length > i){
                Paginationlist.push(sObjectList[i]);
            }
            counter ++ ;
        }
        
        start = start + counter;
        end = end + counter;
        component.set("v.startPage",start);
        component.set("v.endPage",end);
        component.set('v.PaginationList', Paginationlist);
    },
    
    previous : function(component, event){
        var sObjectList = component.get("v.AccountData");
        var end = component.get("v.endPage");
        var start = component.get("v.startPage");
        var pageSize = component.get("v.pageSize");
        var Paginationlist = [];
        var counter = 0;
        for(var i= start-pageSize; i < start ; i++){
            if(i > -1){
                Paginationlist.push(sObjectList[i]);
                counter ++;
            }else{
                start++;
            }
        }
        
        start = start - counter;
        end = end - counter;
        component.set("v.startPage",start);
        component.set("v.endPage",end);
        component.set('v.PaginationList', Paginationlist);
    }
})