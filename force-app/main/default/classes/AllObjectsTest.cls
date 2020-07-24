/*
 * This test class is created by: rajat.tak on 05/21/2020.
 * This testing the AllObjects class.
 */
@isTest
public class AllObjectsTest {
    /*
     * This method is verifying the result by comparing the size of returned oject name list.
     */
    @isTest
    public static void allObjectNameTest(){
        List<String> objectNameList=new List<String>();
        Test.startTest();
        objectNameList=AllObjects.allObjectName();
        Test.stopTest();
        System.assert(objectNameList.size()>0);
    }
}