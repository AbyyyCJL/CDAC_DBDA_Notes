//class demo{ // parent class, super class, base class
//
//    int num1;
//    demo(){
//        System.out.println("I am demo.");
//    }
//
//    void method1(){
//
//        System.out.println("I am method 1");
//
//    }
//
//}
//
//class demo1 extends demo { // child class, sub-class , derived class
//
//    int num2;
//
//    demo1(){
//        System.out.println("I am cons of demo 2");
//    }
//
//}
//
//
//class demo2 extends demo1 {
//
//    int num3 ;
//
//    void method3(){
//        System.out.println("I am method 3");
//    }
//
//
//}
//
//
//
//class testcode{
//
//    public static void main(String[] args) {
//        demo2 d2 = new demo2(); //creating the instance of child class/ sub-class
//
//        d2.num1 = 234;
//        d2.num2 = 876;
//
//        System.out.println(d2.num1);
//        d2.method1();
//        d2.method3();
//
//    }
//
//
//
//}