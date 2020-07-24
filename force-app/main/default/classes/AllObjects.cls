/*
 * This class is created by: rajat.tak on 05/20/2020.
 * This class returns the name of all oects in salesforce.
 */
public class AllObjects {
    /*
     * This method use the getGlobalDescribe() method of Schema class and returns the names of all object in org.
     */
    public static List<string> allObjectName(){
        /* This list contains the name og all ojects.*/
        List<string> objectList=new List<string>();
        for(string objectName:schema.getGlobalDescribe().keySet()){
            objectList.add(objectName);
        }
        return objectList;
    }
}