/*
 * This test class is created by: rajat.tak on 05/21/2020.
 * This class is testing StudentClass.
 */
@isTest
public class AssignmentTest {
    /*
     * This method has records for common access.
     */
    @testSetup
    public static void setupMethod(){
        Class__c classForTest=new Class__c(Name='XII', Name__c='XII');
        insert classForTest;
        
        Student__c studentFirst=new Student__c(Name='Heera', Last_Name__c='Heera');
        Student__c studentSecond=new Student__c(Name='Jaya', Last_Name__c='Jaya');
        studentFirst.Class__c=classForTest.Id;
        studentSecond.Class__c=classForTest.Id;
        
        List<Student__c> studentList=new List<Student__c>();
        studentList.add(studentFirst);
        studentList.add(studentSecond);
        insert studentList;
    }
    
    /*
     * This method is verifing student list.
     */
    @isTest
    public static void studentNameTest(){
        List<String> studentNameList=new List<String>();
        List<String> result=new List<String>();
        
        Class__c c=new Class__c();
        c=[select Id from Class__c];
        
        studentNameList.add('Heera');
        studentNameList.add('Jaya');
        
        Test.startTest();
        result=StudentClass.studentsInClass(c.Id);
        Test.stopTest();
        
        System.assertEquals(studentNameList.size(),result.size());
    }
    
    /*
     * This method is verifying the map.
     */
    @isTest
    public static void studentClassMapTest(){
        Map<Class__c,List<Student__c>> studentClassMap=new Map<Class__c,List<Student__c>>();
        Map<Class__c,List<Student__c>> result=new Map<Class__c,List<Student__c>>();
        List<Student__c> studentList=new List<Student__c>();
        
        Class__c c=new Class__c();
        c=[select Id from Class__c where Name__c='XII'];
        
        Test.startTest();
        result=StudentClass.studentAndClass();
        Test.stopTest();
        
        studentList=[select Id from Student__c where Class__r.Id=:c.Id];
        studentClassMap.put(c,studentList);
        System.debug(studentClassMap);
        System.debug(result);
        System.assertEquals(studentClassMap,result);
    }
}