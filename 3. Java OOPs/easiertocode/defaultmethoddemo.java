package easiertocode;

interface myint2
{
    void method1();
    void method2();
    default void method3() //avoid situation where
    {
        System.out.println("I am default def of method");
    }
}

class myclass2 implements myint2{
    @Override
    public void method1() {
        System.out.println("an method 1 def of myclass");
    }

    @Override
    public void method2() {
        System.out.println("an method 2 def of myclass");
    }

}

public class defaultmethoddemo {

    public static void main(String[] args) {

        myclass2 m2 = new myclass2();

        m2.method1();
        m2.method2();
        m2.method3();

    }

}
