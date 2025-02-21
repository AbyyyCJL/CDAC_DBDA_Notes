class student{

    int rollno;
    String name;
    float fees;
    int age;

}



public class trial {

    public static void main(String[] args) {

        student s1 = new student();

        System.out.println(s1);

    }



    public static void main1(String[] args) {

        student s1 ; // variable of class student, also called as reference variable
        new student(); // Instance of a class student, also called as anon instance

//        System.out.println(s1.name);


        student s2 =  new student();

        s2.age = 23;
        s2.name = "Abhay";
        s2.rollno = 2;
        s2.fees = 145000;

        System.out.println(s2.rollno);
        System.out.println(s2.name);
        System.out.println(s2.fees);
        System.out.println(s2.age);


    };


}

