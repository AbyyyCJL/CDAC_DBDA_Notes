//package collections;

import java.util.ArrayList;
import java.util.Iterator;

class Employee{

    int eid;
    String empname;
    float salary;

    public Employee() {
    }

    public Employee(int eid, String empname, float salary) {
        this.eid = eid;
        this.empname = empname;
        this.salary = salary;
    }
}



public class userdefinedclassdemo {

    public static void main(String[] args) {

        ArrayList<Employee> emplist = new ArrayList<Employee>();

        Employee e1 = new Employee();
        Employee e2 = new Employee(101, "Abhay", 2345.53f);

        emplist.add(e1);
        emplist.add(e2);

        emplist.add(new Employee(102, "Alex", 455.53f));


        // method 1
        for(Employee e : emplist){

            if(e.eid == 101){
                System.out.println(e.eid + " " + e.empname + " " + e.salary);
            }

        }


        // method 2

        Iterator<Employee> it = emplist.iterator();

        while(it.hasNext()){

//            System.out.println(it.next());
            System.out.println("Salary : " + it.next().salary);

        }


    }

}
