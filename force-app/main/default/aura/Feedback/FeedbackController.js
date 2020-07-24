({
    doInit:function(cmp,event,helper){
        var url = $A.get('$Resource.FourthImage');
        cmp.set('v.backgroundImageURL', url);
    },
    handleSuccess : function(cmp, event, helper) {
        alert("Thanks for your feedback");
        $A.get('e.force:refreshView').fire();
    }
    
})