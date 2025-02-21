abstract class Person {

    String name;
    int age;

    void showDetails(){
        System.out.println("Name : "+name+" and age : " + age);
    }

    abstract void method3();

}

class employee extends Person{

    int empid;
    String deptname;


    @Override
    void method3() {

        this.empid = 101;
        this.name = "Abhay";
        this.age = 23;
        this.deptname = "DBDA";

    }

    void printDetails(){
        System.out.println("Emp_id : "+this.empid+" and dept_name : "+this.deptname);
    }

}

public class Persontext{

    public static void main(String[] args) {

        employee e1 = new employee();

        e1.printDetails();
        e1.method3();

    }


}