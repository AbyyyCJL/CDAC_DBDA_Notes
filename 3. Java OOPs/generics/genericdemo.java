package generics;

class demogen{


}


public class genericdemo<T> extends demogen{

    T num1;
    T num2;

    void showData(){

        System.out.println("Num1 : " + this.num1 + " and num2 : " + this.num2);

    }


    public static void main(String[] args) {

        genericdemo<demogen> gd= new genericdemo<demogen>();

//        gd.num1 = 2345;
//
//        gd.num2 =9876;

        gd.num1 = new demogen();

        gd.showData();

    }


    public static void main3(String[] args) {

        genericdemo<String> dstr = new genericdemo<String>();




    }


    public static void main2(String[] args) {

        genericdemo<Integer> dint = new genericdemo<Integer>(); // Bounded datatype

        dint.num1 = 123; // ok
        dint.num2 = 87; // ok

        dint.showData();

//        dint.num2 = "ABHAY"; // not ok


    }


//    public static void main1(String[] args) {
//
//        genericdemo gd = new genericdemo<>(); // Raw type -> kuch bhi value rahega
//
//
//        gd.num2 = 23;
//        gd.num1 = 57;
//
//        gd.showData();
//
//
//
//    }

}
