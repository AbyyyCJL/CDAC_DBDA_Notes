class miclass{

    static int num1;

    miclass(){
        System.out.println(" A cons with zero arg ");

    }

    static{ // static block

        num1 = 2; //static variable insitialized in static block
        System.out.println(" A static block");
    }

    static void Method1(){ // static block
        System.out.println(" A static block of method 1.");
    }


}

class Testcode{

    public static void main(String[] args){

        miclass.Method1(); //calling of static method

        miclass m1 = new miclass();

        System.out.println("Using instance : "+m1.num1);

        System.out.println("Value of num1 : " + miclass.num1);

    }


}