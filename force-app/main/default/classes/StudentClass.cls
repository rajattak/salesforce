/*
 * This class is created by: rajat.tak on 05/19/2020.
 * The first method in this class is returning  a list of student names and second method is returning a map of class and student.
 */
public class StudentClass {
    /*
     * This method takes classId and returns a list of student names.
     */
    public static List<string> studentsInClass(string classId){
        /* This list contains the name of students.*/
        List<string> studentNameList=new List<string>();
        /* This list contains the students.*/
        List<Student__c> studentList=new List<Student__c>();
        
        studentList=[select Last_Name__c from Student__c where Class__c=:classId];
        for(Student__c nameOfStudent:studentList){
            studentNameList.add(nameOfStudent.Last_Name__c);
        }
        return studentNameList;
    }
    
    /*
     * This method returns a map of class as key and students as values in it.
     */
    public static Map<Class__c,List<Student__c>> studentAndClass(){
        /* This list contains the classes.*/
        List<Class__c> classList=new List<Class__c>();
        /* This map contains class as a key and students of that class as values.*/
        Map<Class__c,List<Student__c>> studentClassMap=new Map<Class__c,List<Student__c>>();
        Map<Id,Class__c> classMap=new Map<Id,Class__c>([select Id,(select Id from Students__r) from Class__c]);
        for(Class__c c:classMap.values()){
            /* This list contains the students in a class.*/
            List<Student__c> studentList=new List<Student__c>();
            for(Student__c student:c.Students__r){
                studentList.add(student);
            }
            studentClassMap.put(c,studentList);
        }
        return studentClassMap;
    }
}