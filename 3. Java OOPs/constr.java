class Students {

    int rollno;
    String name;

    Students(){

    }

    Students(int rollno, String name){
        this.rollno = rollno;
        this.name = name;

    }

    void printrecord(){

        System.out.println("Roll No: "+rollno+ " and name: " + name);
    }



}

class constr{


    public static void main(String[] args) {
        Students s1 = new Students(101, "Abhay");
        s1.printrecord();
    }


}
