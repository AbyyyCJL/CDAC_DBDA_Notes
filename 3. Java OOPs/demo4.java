import java.util.Scanner;

public class demo4 {

    int rollno;
    String name;
    float fees;
    int age;

    public void Display() {
        System.out.println("Roll No.: " + rollno + " Name: " + name + " Fees: " + fees + " Age: " + age);
    }

    public void setStudent(int rn, String nm, float fs, int ag) { // non-static method
        rollno = rn;
        name = nm;
        fees = fs;
        age = ag;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        demo4 s = new demo4(); // Corrected object creation
        System.out.println("Enter a roll no: ");
        s.rollno = sc.nextInt();

        System.out.println("Enter the fees: ");
        s.fees = sc.nextFloat();

        System.out.println("Enter the age: ");
        s.age = sc.nextInt();
        sc.nextLine(); // Consume newline left-over

        System.out.println("Enter the name: ");
        s.name = sc.nextLine();

        s.Display();
    }
}
