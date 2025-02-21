//package collections;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

public class collectiondemo {


    public static void main(String[] args) {

        ArrayList<Integer> lst1 = new ArrayList<Integer>();

        lst1.add(100);
        lst1.add(600);
        lst1.add(400);
        lst1.add(200);
        lst1.add(300);
        lst1.add(500);


        // Iterate methods :

        // 1] for - each loop

        for(Integer e : lst1){

            System.out.print(e + " ");

        }


        // 2] Traversal of array using iterator (interface)

        System.out.println();
        System.out.println("Traversal of array using Iterator: ");

        Iterator<Integer> it = lst1.iterator();

        while(it.hasNext()){

            System.out.print(it.next() + "  ");

        }


        // 3] List - iterator

        ListIterator<Integer> lit =


    }



    public static void main4(String[] args) {

        ArrayList<Integer> lst1 = new ArrayList<Integer>();// create arraylist of integers with initial size of 10.


        ArrayList<Integer> lst2 = new ArrayList<Integer>(100); // create arraylist of integers with initial size of 100.

        lst2.ensureCapacity(500); // dynamic in nature -> in runtime , can increase / decrease the capacity

        lst2.add(123);
        lst2.add(12);
        lst2.add(153);

        System.out.println(lst2.get(2));
        System.out.println(lst2);

    }



    public static void main3(String[] args) {


        ArrayList<Integer> lst1 = new ArrayList<Integer>();

        lst1.add(100);
        lst1.add(600);
        lst1.add(400);
        lst1.add(200);
        lst1.add(300);
        lst1.add(500);


        ArrayList<Integer> lst2 = new ArrayList<Integer>();

        lst1.add(864);
        lst1.add(925);

        System.out.println("LIST 1: " + lst1);

        lst1.remove(0);

        System.out.println("LIST 1: " + lst1);

        Integer a1 = 600; // 600 is boxed as object in a1 -> auto-boxing

        lst1.remove(a1);

        System.out.println("List 1 after auto boxing: " + lst1);



    }



    public static void main2(String[] args) {

        ArrayList<Integer> list = new ArrayList<Integer>();

        list.add(123); // add with object -> used to add an element at the last of the current list
        list.add(13);
        list.add(234);


        System.out.println(list);


        for(Integer e : list){ // for each loop
            System.out.println(e);
        }


        list.add(1, 45); // add(index, element)

        System.out.println(list);


        ArrayList<Integer> list2 = new ArrayList<Integer>();

        list2.add(103);
        list2.add(1456);
        list2.add(874);

        System.out.println(list2);

//        list.addAll(list2);
        list.addAll(2, list2);

        System.out.println("List after addition list : " + list);







    }

}
