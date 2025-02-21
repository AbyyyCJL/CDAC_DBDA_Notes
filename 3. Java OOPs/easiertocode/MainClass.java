
interface int1 {
    void show();
    default void method1() {
        System.out.println("I am method 1.");
    }
}

class demo1 implements int1 {
    public void show() {
        System.out.println("ewebfgbwf");
    }
}

public class MainClass {
    public static void main(String[] args) {
        demo1 d = new demo1();
        d.show();
        d.method1();  // Call to method1
    }
}
