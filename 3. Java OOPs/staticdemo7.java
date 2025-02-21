
class Testcode{

    static int count = 2;
    int num1;

    Testcode(){

        count++;

    }

    void show(){ // non-static method
        // System.out.println("The value of count is : "+this.count); // acccessing the static variable
        System.out.println("The value of count is : "+count); 
        // System.out.println("The value of num1 is : "+this.num1); 
    }

    static void m1(){
        // System.out.println("Value of num1 : " + count);
    }


    public static void main(String[] args){

        Testcode t1 = new Testcode();
        // Testcode t2 = new Testcode();

        // System.out.println("Value of count is : "+ count);

        System.out.println("The value of count is : " + count); // access the variable within the class

        t1.show();
        // t2.show();

    }


}