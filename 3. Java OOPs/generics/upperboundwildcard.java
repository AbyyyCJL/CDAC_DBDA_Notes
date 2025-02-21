//package generics;

class Person{

}

class employee extends Person{


}


class employeeManager extends employee{

}

class Gen<T> extends employeeManager{

    T a;

    void show(){
        System.out.println("Value of a is : " + this.a);
    }

}


public class upperboundwildcard {

    public static void main(String[] args) {


        Gen g1 = new Gen<>();

        g1.a = "abhay";
//
//        g1.show();
//
//        g1.a = 2345;
//
//        g1.show();
//
//        g1.a = 'c';
//
//        g1.show();

        Gen<String> gd1 = new Gen<String>();
        Gen<Integer> gd2 = new Gen<Integer>();
        Gen<Float> gd3 = new Gen<Float>();



    }

}
