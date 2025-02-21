import java.util.Scanner;

class Student{

    int rollno;
    String name;
    int age;
    float fees;

    public Student(int rollno, String name, int age, float fees) {
        this.rollno = rollno;
        this.name = name;
        this.age = age;
        this.fees = fees;
    }

    public Student(){

    }


}

public class arrayofref {

    public static void main(String[] args) {

        Student[] stud = new Student[5];


        int choice;
        int n = 0;
        int[] arr = new int[n];
        Scanner sc = new Scanner(System.in);

        do {

            System.out.println("****************************************************");
            System.out.println("1. to add student.");
            System.out.println("2. to print all students.");
            System.out.println("3. to replace an element.");
            System.out.println("4. to sort array in asc.");
            System.out.println("5. to delete a element.");
            System.out.println("6. to print an array.");
            System.out.println("7. to exit.");
            System.out.println("****************************************************");

            choice = sc.nextInt();

            switch (choice) {

                case 1:
                    for(int i = 0; i < stud.length; i++){
                        if (stud[i] == null){
                            stud[i] = new Student();
                            System.out.println("Enter roll no. ");
                            stud[i].rollno = sc.nextInt();

                            sc.nextLine();
                            System.out.println("Enter name: ");
                            stud[i].name = sc.nextLine();

                            System.out.println("Enter age : ");
                            stud[i].age = sc.nextInt();

                            System.out.println("Enter the fees: ");
                            stud[i].fees = sc.nextFloat();

                            System.out.println("Student added successfully...");

                        }
                    }

                    break;

                case 2:

                    System.out.println("Enter the element to be searched: ");
                    int num = sc.nextInt();
                    boolean flag = false;

                    for (int i = 0; i < stud.length; i++){

                        System.out.println("Roll_No"+stud[i]);

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
