({
	createAccount : function(cmp,event) {
        var accountName=cmp.get("v.accountName");
        var active=cmp.get("v.active");
        var accept=cmp.get("v.boolean");
        var date=cmp.get("v.date");
        var action=cmp.get("c.accountCreate");
        action.setParams(
            {name:accountName,
             accountDate:date,
             active:active,
             accept:accept}
        );
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state=='SUCCESS'){
                var a=response.getReturnValue();
                alert("Account is created with account Id"+a.Id);
                var componentEvent=cmp.getEvent("accountEvent");
                componentEvent.setParams({account:a});
                componentEvent.fire();
            }
        });
    $A.enqueueAction(action);
	}
})