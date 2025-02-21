
class student1{


    private int rollno;
    private String name;


    public void setRollNo(int rollno){

        this.rollno = rollno;


    }

    public void setName(String name){ // setter

        this.name = name;


    }

    public String getName(){ // getter

        return this.name;

    }


    void printrecord(){

        System.out.println("Roll : " + this.rollno + " and name is : " + name);

    }

}

//class Testcode{
//
//    public static void main(String[] args){
//
//        student1 s1 = new student1();
//
//        s1.printrecord();
//
//        // s1.rollno = 54;
//        // s1.name = "Alex";
//
//
//
//
//        s1.setRollNo(2384);
//        s1.setName("Alexander");
//
//
//
//        s1.printrecord();
//
//
//        String sname = s1.getName();
//
//        System.out.println("Sname is : " + sname);
//    }
//
//
//}
