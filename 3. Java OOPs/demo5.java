class myClass {


    int num1;
    int num2;
    int num3;


    myClass(){

        System.out.println("i am cons with 0 args ");

    }

    myClass(int num1){

        System.out.println("i am cons with 1 arg ");

    }

    myClass(int num1, int num2){

        System.out.println("i am cons with 2 args ");

    }


}


class Testcode{

    public static void main(String[] args){

        myClass s1 = new myClass();
        System.out.println(s1.num1);

    }


}