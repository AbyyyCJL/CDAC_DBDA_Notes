//package hash;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

public class hashmapdemo {

    public static void main(String[] args) {

        HashMap<Integer, String> hm1 = new HashMap<Integer, String>();

        hm1.put(101, "Abhay");
        hm1.put(102, "Alex");
        hm1.put(103, "Ninad");
        hm1.put(104, "Neelanjan");
        hm1.put(105, "Utkarsh");

        System.out.println(hm1);

        for(Map.Entry<Integer, String> entry : hm1.entrySet()){

//            System.out.println(entry);

            System.out.println(entry.getValue());

            System.out.println(entry.getKey());

        }


//        ArrayList<String> hmvalues = (ArrayList<String>) hm1.values();



        TreeMap<Integer, String> trtmp = new TreeMap<Integer, String>();

        trtmp.put(101, "Abhay");
        trtmp.put(102, "Alex");
        trtmp.put(103, "Ninad");
        trtmp.put(104, "Neelanjan");
        trtmp.put(105, "Utkarsh");

        System.out.println(trtmp);


    }

}
