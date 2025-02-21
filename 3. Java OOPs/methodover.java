class methods {

    void method1(){
        System.out.println("0 arg");
    }
    void method1(int num1){
        System.out.println("1 arg");
    }
    void method1(int num1, int num2){
        System.out.println("2 arg");
    }


}

public class methodover{

    public static void main(String[] args) {

        methods m = new methods();

        m.method1();
        m.method1(4);
        m.method1(4,9);

    }


}