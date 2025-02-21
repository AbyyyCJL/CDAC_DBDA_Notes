import java.util.Scanner;


public class arraydemo {

    public static void main(String[] args) {

        int choice;
        int n = 0;
        int[] arr = new int[n];
        Scanner sc = new Scanner(System.in);

        do {

            System.out.println("****************************************************");
            System.out.println("1. to enter elements.");
            System.out.println("2. to search a element.");
            System.out.println("3. to replace an element.");
            System.out.println("4. to sort array in asc.");
            System.out.println("5. to delete a element.");
            System.out.println("6. to print an array.");
            System.out.println("7. to exit.");
            System.out.println("****************************************************");

            choice = sc.nextInt();

            switch (choice) {

                case 1:
                    System.out.println("Enter the size of array: ");
                    n = sc.nextInt();
                    arr = new int[n];
                    for (int i = 0; i < n; i++) {

                        System.out.println("Enter the element: ");
                        arr[i] = sc.nextInt();

                    }

                    break;

                case 2:

                    System.out.println("Enter the element to be searched: ");
                    int num = sc.nextInt();
                    boolean flag = false;

                    for (int i = 0; i < arr.length; i++){

                        if(arr[i] == num){

                            flag = true;
                            System.out.println("Element found at " + i + " index.");
                            break;

                        }

                    }

                    if(!flag){
                        System.out.println("Element not found..");
                    }

                    break;
                case 3:
                    break;
                case 4:
                    break;
                case 5:
                    break;
                case 6:
                    for (int i = 0; i < arr.length; i++) {

                        System.out.println(arr[i]);


                    }
                    break;

                case 7:
                    break;


            }

        }while(choice != 7);

    }


}
