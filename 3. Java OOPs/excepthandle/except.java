//package excepthandle;

import java.io.PrintStream;
import java.util.InputMismatchException;
import java.util.Scanner;

public class except {

    public static void main(String[] args) {

//        int num1;
//        int num2;
//        int res;
//        Scanner sc = new Scanner(System.in);
//        try{
//            System.out.println("Enter num1: ");
//            num1 = sc.nextInt();
//            System.out.println("Enter num2: ");
//            num2 = sc.nextInt();
//
//            res = num1/num2;
//
//            System.out.println("The div result is : "+ res);
//
//
//
//
//        }
//        catch(InputMismatchException i){
//            i.printStackTrace();
//        }
//        catch(ArithmeticException e){
//
//            e.printStackTrace();
//        }


        try{
            try{
                throw new ArithmeticException();
            }catch(ArrayIndexOutOfBoundsException e){
                System.out.println("Inner except-try(ArrayIndexOutOfBoundsException).");
            }
        }catch(Exception e){
            System.out.println("Outer except-try.");
        }




        System.out.println("enbfvh jkaij");

        System.out.println("Prog ends");

    }


}
