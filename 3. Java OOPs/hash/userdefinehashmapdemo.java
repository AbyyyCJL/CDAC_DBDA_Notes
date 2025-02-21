//package hash;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

class Customer{

    int cid;
    String name;

    public Customer() {
    }

    public Customer(int cid, String name) {
        this.cid = cid;
        this.name = name;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "cid=" + cid +
                ", name='" + name + '\'' +
                '}';
    }
}


class product{

    int pid;
    String pname;

    public product() {
    }

    public product(int pid, String pname) {
        this.pid = pid;
        this.pname = pname;
    }

    @Override
    public String toString() {
        return "product{" +
                "pid=" + pid +
                ", pname='" + pname + '\'' +
                '}';
    }
}


public class userdefinehashmapdemo {

    public static void main(String[] args) {

        HashMap<Customer, product> userhm = new HashMap<Customer, product>();

        userhm.put(new Customer(102, "Abhay"), new product(5,"Shirt"));
        userhm.put(new Customer(104, "Alex"), new product(2,"Bucket"));
        userhm.put(new Customer(107, "Utkarsh"), new product(4,"Daru"));
        userhm.put(new Customer(111, "Neelanjan"), new product(8,"Body-Pillow"));
        userhm.put(new Customer(176, "Ninad"), new product(12,"Cigerates"));

//        System.out.println(userhm);

        for(Map.Entry<Customer, product> x : userhm.entrySet()){

//            System.out.println(x);

            System.out.println(x.getKey().cid + " " + x.getKey().name + " -> " + x.getValue().pname);

        }

        System.out.println();

        for(Customer x : userhm.keySet()){

            System.out.println("Customer : " + x);

        }

        System.out.println();

        for(product x : userhm.values()){

            System.out.println("Product : " + x);

        }

        System.out.println();

        ArrayList<product> prodlist = (ArrayList<product>) userhm.values();


        Collections.sort(prodlist, (p1, p2) -> p1.pname.compareTo(p2.pname));

        for(product p:prodlist){
            System.out.println(p);
        }


    }

}
