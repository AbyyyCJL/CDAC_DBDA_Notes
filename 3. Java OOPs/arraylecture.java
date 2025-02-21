import java.util.Scanner;

public class arraylecture {


    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
//        int[] arr1 = new int[5];
//
//
//        for (int i = 0 ; i < arr1.length; i++){
//
//            System.out.println("Enter an element: ");
//            arr1[i] = sc.nextInt();
//        }

        // finding element with its index

//        System.out.println("Enter the finding element: ");
//        int x = sc.nextInt();
//
//        for (int i = 0 ; i < arr1.length; i++){
//
//            if (arr1[i] == x){
//                System.out.println("Element is found at " + i + " index.");
//                break;
//            }
//
//        }


        // sum of all the elements:
//        int sum = 0;
//        System.out.println("Addition in process...");
//
//        for(int i = 0; i < arr1.length; i++){
//
//            sum += arr1[i];
//
//        }
//
//        System.out.println("The sum of the elements present in array is : " + sum);


        // Update the value of array

//        int value;
//        int index;
//
//        System.out.println("Enter the index at which you want ot add(Range -> 0 to 4): ");
//        index=sc.nextInt();
//
//        for(int i = 0; i < arr1.length; i++){
//
//            if(i == index){
//
//                System.out.println("Enter Value: ");
//                value = sc.nextInt();
//                arr1[i] = value;
//                break;
//
//            }
//
//        }
//
//        System.out.println("the updated array is : ");
//
//        for (int i = 0; i < arr1.length; i++){
//
//            System.out.print(arr1[i] + " ");
//
//        }

        int[][] arr2 = new int[3][3];

        for(int i = 0; i < 3; i++){

            for(int j = 0; j < 3; j++){

                System.out.println("Enter the element: ");
                arr2[i][j] = sc.nextInt();

            }

        }

        System.out.println("The Array is : ");

        for(int i = 0; i < 3; i++){
            for(int j = 0; j < 3; j++){

                System.out.print(arr2[i][j] + " ");

            }
            System.out.println();
        }








    }




}
