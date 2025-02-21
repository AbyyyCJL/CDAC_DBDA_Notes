//package excepthandle;

public class finaldemo {

    void checkAge(int age) throws ArithmeticException {
        if (age < 18) {
            throw new ArithmeticException("Not eligible to vote");
        }
    }

    public static void main(String[] args) {

//        try{
//
//            throw new ArithmeticException();
//
//        }catch(ArithmeticException e){
//            e.printStackTrace();
//        }
//        finally {
//            System.out.println("Close the connection");
//            System.out.println("Close the file");
//        }
//
//        System.out.println("Rest of the Progress..");

        finaldemo fd = new finaldemo();

        fd.checkAge(4);





    }

}
