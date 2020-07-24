trigger CityManagerTrigger on Loan__c (before insert) {
    List<Loan__c> loanList=new List<Loan__c>();
    Map<String,CityManager__c> cityManager=new Map<String,CityManager__c>();
    Map<Id,CityManager__c> cityManagerMap=new Map<Id,CityManager__c>([select Id,Name,Manager__c from CityManager__c]);
    String userName;
    for(CityManager__c city:cityManagerMap.values()){
        if(!cityManager.containsKey(city.Name)){
            cityManager.put(city.Name,city);
        }
    }
    for(Loan__c loan:trigger.new){
        loan.Manager__c=cityManager.get(loan.City__c).Manager__c;
    }
}