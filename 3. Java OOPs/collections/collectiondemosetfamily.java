package collections;

import java.util.HashSet;
import java.util.Iterator;
import java.util.TreeSet;

public class collectiondemosetfamily {


    public static void main(String[] args) {


        TreeSet<Integer> t1 = new TreeSet<Integer>();

        t1.add(234);
        t1.add(23);
        t1.add(34);
        t1.add(634);
        t1.add(4);

        System.out.println(t1);

        TreeSet<String> t2 = new TreeSet<String>();

        t2.add("alex");
        t2.add("zebra");
        t2.add("chicken");
        t2.add("mutton");
        t2.add("egg");

        System.out.println(t2);


    }


    public static void main1(String[] args) {

        HashSet<Integer> h1 = new HashSet<Integer>();

        h1.add(100);
        h1.add(200);
        h1.add(300);
        h1.add(400);
        h1.add(500);
        h1.add(600);
        h1.add(700);


        Iterator<Integer> it = h1.iterator();

        while(it.hasNext()){

            System.out.print(it.next() + " ");

        }


//        System.out.println(h1);


    }

}
