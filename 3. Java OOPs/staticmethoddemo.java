import java.util.Scanner;

class Student4 {

    int rollno;
    String name;
    float fees;
    int age;

    static String CourseName = "DBDA";

    static void printstudrecord(Student4 s){

        System.out.println("Roll No: " + s.rollno + ", Name : " + s.name + ", fees are : " + s.fees + ", age is : " + s.age + " and the course he enrolled in is : " + CourseName);

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

class studmanager{

    static void printstudrecord(){



    }

    static void acceptstudrecord(){



    }

}

class testcode{

    public static void main(String[] args) {

        Student4 s1 = new Student4();

        System.out.println("Record before Input values: ");
        Student4.printstudrecord(s1);

        Student4.acceptstudrecord(s1);


        System.out.println("Record after Input values: ");
        Student4.printstudrecord(s1);


    }

}