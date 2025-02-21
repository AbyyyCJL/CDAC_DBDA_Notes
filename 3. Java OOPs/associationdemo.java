import java.util.Scanner;

class Student4 { //model class or Domain class

    int rollno;
    String name;
    float fees;
    int age;

    static String CourseName = "DBDA";


}

class studmanager{ // Manger class or implementation class

    Student4 s = new Student4(); // Assoication, Coupling

    void printstudrecord(){

        System.out.println("Roll No: " + s.rollno + ", Name : " + s.name + ", fees are : " + s.fees + ", age is : " + s.age + " and the course he enrolled in is : " + Student4.CourseName);

    }

    void acceptstudrecord(){

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

//        Student4 s1 = new Student4();

        studmanager sm = new studmanager();
        System.out.println("Record before Input values: ");
        sm.printstudrecord();

        sm.acceptstudrecord();


        System.out.println("Record after Input values: ");
        sm.printstudrecord();


    }

}