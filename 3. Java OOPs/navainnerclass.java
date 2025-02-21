
class ABC{

    private int num1;
    static int num3;

    static class XYZ{

        static int num2;

        void show(){

            System.out.println("Value of num1 : "+this.num2);
            System.out.println("Value of num1 : "+ABC.num1);
            System.out.println("Value of num1 : "+num3);

        }


    }

    void show(){

        System.out.println("Value of num 1 : "+num1);
        System.out.println("Value of num 2 : "+XYZ.num2);


    }


}


public class navainnerclass {

    public static void main(String[] args) {

        ABC x1 = new ABC();

        ABC.XYZ s1 = x1.new XYZ();



    }

}
