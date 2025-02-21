import java.util.Scanner;

class Student4 { //model class or Domain class

    int rollno;
    String name;
    float fees;
    int age;

    static String CourseName = "DBDA";


}

class studmanager{ // Manger class or implementation class

    static void printstudrecord(Student4 s){

        System.out.println("Roll No: " + s.rollno + ", Name : " + s.name + ", fees are : " + s.fees + ", age is : " + s.age + " and the course he enrolled in is : " + Student4.CourseName);

    }

    static void acceptstudrecord(Student4 s){

        Scanner sc = new Scanner(System.in);

        System.out.println("Enter rollno : ");
        s.rollno = sc.nextInt();

        System.out.println("Enter the name : ");
        s.name = sc.nextLine();
        sc.nextLine();

        System.out.println("Enter the fees : ");
        s.fees = sc.nextFloat();

        System.out.println("Enter the age: ");
        s.age = sc.nextInt();

    }

}

class testcode{ // Interface , testClass

    public static void main(String[] args) {

        Student4 s1 = new Student4();

        System.out.println("Record before Input values: ");
        studmanager.printstudrecord(s1);

        studmanager.acceptstudrecord(s1);


        System.out.println("Record after Input values: ");
        studmanager.printstudrecord(s1);


    }

}