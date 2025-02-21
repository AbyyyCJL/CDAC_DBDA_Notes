package easiertocode;

@FunctionalInterface
interface myfunc
{
    void show();
//    void fun2();
}


class myclass3 implements myfunc{

    @Override
    public void show() {
        System.out.println("show def of mylcass");
    }
}


public class functionalinterfacedemo {

    public static void main(String[] args) {

        myclass3 m3 = new myclass3();

        m3.show();

        myfunc  mf = new myfunc() {
            @Override
            public void show() {
                System.out.println("Show def by anon class.");
            }
        };

        mf.show();

    }
}
