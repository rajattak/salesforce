/*
 * This test class is created by: rajat.tak on 05/22/2020.
 */
@isTest
public class TestClassForAssignment {
    /*
     * This method is testing the before insert trigger on Contact.
     */
    @isTest
    public static void insertTeacherTest(){
        Contact c=new Contact(LastName='Fresh Account',Subjects__c='Hindi');
        
        Test.startTest();
        Database.SaveResult result=Database.insert(c,false);
        Test.stopTest();
        
        System.assertEquals('Teacher cannot be inserted',result.getErrors()[0].getMessage());
    }
    
    /*
     * This method is testing the before update trigger on Contact.
     */
    @isTest
    public static void updateTeacherTest(){
        Contact c=new Contact(LastName='Fresh Account',Subjects__c='English');
        insert c;
        c.Subjects__c='Hindi';
        
        Test.startTest();
        Database.SaveResult result=Database.update(c,false);
        Test.stopTest();
        
        System.assertEquals('Teacher cannot be updated',result.getErrors()[0].getMessage());
    }
    
    /*
     * This method is testing the before insert trigger on Student__c.
     */
    @isTest
    public static void beforeInsertStudent(){
        Class__c c=new Class__c(Name='XII',Name__c='XII',MaxSize__c=1);
        insert c;
        Student__c s=new Student__c(Name='Jaya',Last_Name__c='Jaya',Class__c=c.Id);
        insert s;
        
        Student__c student=new Student__c(Name='Jhon',Last_Name__c='Jhon',Class__c=c.Id);
        
        Test.startTest();
        Database.SaveResult result=Database.insert(student,false);
        Test.stopTest();
        
        System.assertEquals('Maximum limit is reached',result.getErrors()[0].getMessage());
    }
    
    /*
     * This method is testing the after insert trigger on Student__c and verifies that MyCount__c after insert.
     */
    @isTest
    public static void afterInsertStudent(){
        Class__c c=new Class__c(Name='XII',Name__c='XII',MaxSize__c=1);
        insert c;
        Class__c classUpdate=new Class__c();
        Student__c s=new Student__c(Name='Jaya',Last_Name__c='Jaya',Class__c=c.Id);
        
        Test.startTest();
        Database.SaveResult result=Database.insert(s);
        Test.stopTest();
        
        classUpdate=[select MyCount__c from Class__c where Id=:c.Id];
        
        System.assertEquals(1,classUpdate.MyCount__c);
    }
    
    /*
     * This method is testing the after delete trigger on Student__c and verifies the MyCount__c after delete.
     */
    @isTest
    public static void afterDeleteStudent(){
        Class__c c=new Class__c(Name='XII',Name__c='XII',MaxSize__c=1);
        insert c;
        Class__c classUpdate=new Class__c();
        Student__c s=new Student__c(Name='Jaya',Last_Name__c='Jaya',Class__c=c.Id);
        insert s;
        
        Test.startTest();
        Database.DeleteResult result=Database.delete(s);
        Test.stopTest();
        
        classUpdate=[select MyCount__c from Class__c where Id=:c.Id];
        
        System.assertEquals(0,classUpdate.MyCount__c);
    }
    
    /*
     * This method is testing the after update trigger on opportunity and verifies the CloseDate of opportunity.
     */
    @isTest
    public static void opportunityUpdateTest(){
        Opportunity opportunityUpdate=new Opportunity();
        Opportunity opportunityInsert=new Opportunity(Name='Fresh Account',StageName='Qualification',CloseDate=System.today()+2);
        insert opportunityInsert;
        opportunityInsert.StageName='Closed Won';
        
        Test.startTest();
        Database.SaveResult result=Database.update(opportunityInsert);
        Test.stopTest();
        
        opportunityUpdate=[select Id,StageName,CloseDate from Opportunity where Id=:opportunityInsert.Id];
        
        System.assertEquals(System.today(),opportunityUpdate.CloseDate);
    }
    
    /*
     * This method is testing the after update trigger on opportunity.
     */
    @isTest
    public static void opportunityLinesTest(){
        /* This list contains the opportunitylineitem after update in opportunity.*/
        List<OpportunityLineItem> oliUpdateList=new List<OpportunityLineItem>();
        
        Opportunity opportunityUpdate=new Opportunity(Name='Fresh Account',StageName='Qualification',Custom_Status__c='New',CloseDate=System.today()+2);
        insert opportunityUpdate;
        
        Pricebook2 standardPriceBook=new Pricebook2(Name='Pricebook');
        insert standardPriceBook;
        Product2 product=new Product2();
        product.Name='Fresh Account';
        product.IsActive=true;
        insert product;
        
        PricebookEntry pbe=new PricebookEntry();
        pbe.Pricebook2Id=Test.getStandardPricebookId();
        pbe.Product2Id=product.Id;
        pbe.UnitPrice=100;
        pbe.UseStandardPrice=false;
        pbe.IsActive=true;
        insert pbe;
        
        OpportunityLineItem oli=new OpportunityLineItem();
        oli.PricebookEntryId=pbe.Id;
        oli.OpportunityId=opportunityUpdate.Id;
        oli.Quantity=1;
        oli.TotalPrice=100;
        insert oli;
        
        opportunityUpdate.Custom_Status__c='Reset';
        
        Test.startTest();
        Database.SaveResult result=Database.update(opportunityUpdate);
        Test.stopTest();
        
        oliUpdateList=[select Id from OpportunityLineItem where OpportunityId=:opportunityUpdate.Id];
        
        System.assertEquals(0,oliUpdateList.size());
    }
}