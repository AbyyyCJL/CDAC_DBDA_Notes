//package excepthandle;

/*

Create a simple banking application that manages different types of bank accounts. Your program should include the following components:

A class to represent a general bank account that includes common attributes such as account number, account holder's name, and a method to display account details.

Two specific types of accounts: one for savings and another for current accounts. The savings account should have features like interest calculation, while the current account might support overdraft facilities. Implement the unique features as methods within each account class.

Define a set of methods that outline essential operations such as depositing money, withdrawing money, and checking the account balance. Each account type should implement these methods in a way that reflects its specific behavior.

Create an array to store multiple account objects. Your main method should instantiate different account types, add element and demonstrate their functionalities by calling the methods you defined for depositing, withdrawing, and displaying account details.

 */



import java.util.Scanner;

// General BankAccount class
class BankAccount {
    protected String accountNumber;
    protected String accountHolderName;
    protected double balance;

    // Constructor
    public BankAccount(String accountNumber, String accountHolderName, double balance) {
        this.accountNumber = accountNumber;
        this.accountHolderName = accountHolderName;
        this.balance = balance;
    }

    // Method to deposit money
    public void deposit(double amount) {
        if (amount > 0) {
            balance += amount;
            System.out.println(amount + " deposited. New balance: " + balance);
        } else {
            System.out.println("Deposit amount must be positive.");
        }
    }

    // Method to withdraw money (to be overridden in subclasses)
    public void withdraw(double amount) {
        System.out.println("Withdrawal is not available in the base class.");
    }

    // Method to display account details
    public void displayAccountDetails() {
        System.out.println("Account Number: " + accountNumber);
        System.out.println("Account Holder: " + accountHolderName);
        System.out.println("Balance: " + balance);
    }

    // Method to check balance
    public double getBalance() {
        return balance;
    }
}

// SavingsAccount class (subclass of BankAccount)
class SavingsAccount extends BankAccount {
    private double interestRate;

    // Constructor
    public SavingsAccount(String accountNumber, String accountHolderName, double balance, double interestRate) {
        super(accountNumber, accountHolderName, balance);
        this.interestRate = interestRate;
    }

    // Method to calculate interest
    public void calculateInterest() {
        double interest = balance * interestRate / 100;
        balance += interest;
        System.out.println("Interest of " + interest + " added. New balance: " + balance);
    }

    // Overriding withdraw method
    @Override
    public void withdraw(double amount) {
        if (amount > 0 && amount <= balance) {
            balance -= amount;
            System.out.println(amount + " withdrawn. New balance: " + balance);
        } else {
            System.out.println("Insufficient balance or invalid amount.");
        }
    }
}

// CurrentAccount class (subclass of BankAccount)
class CurrentAccount extends BankAccount {
    private double overdraftLimit;

    // Constructor
    public CurrentAccount(String accountNumber, String accountHolderName, double balance, double overdraftLimit) {
        super(accountNumber, accountHolderName, balance);
        this.overdraftLimit = overdraftLimit;
    }

    // Overriding withdraw method to support overdraft
    @Override
    public void withdraw(double amount) {
        if (amount > 0 && balance + overdraftLimit >= amount) {
            balance -= amount;
            System.out.println(amount + " withdrawn. New balance: " + balance);
        } else {
            System.out.println("Overdraft limit exceeded or invalid amount.");
        }
    }
}

// Main class to demonstrate banking application
public class BankingApplication {
    public static void main(String[] args) {
        // Create an array to store multiple account objects
        BankAccount[] accounts = new BankAccount[5];  // Array to store up to 5 accounts
        Scanner sc = new Scanner(System.in);

        // Creating some accounts
        accounts[0] = new SavingsAccount("S1001", "Alice", 5000.0, 4.5);  // Savings Account with 4.5% interest
        accounts[1] = new CurrentAccount("C2001", "Bob", 2000.0, 1000.0); // Current Account with overdraft limit of 1000

        // Interact with accounts
        int choice;
        do {
            System.out.println("\nBanking System Menu:");
            System.out.println("1. Display Account Details");
            System.out.println("2. Deposit Money");
            System.out.println("3. Withdraw Money");
            System.out.println("4. Calculate Interest (Savings Only)");
            System.out.println("5. Exit");
            System.out.print("Enter your choice: ");
            choice = sc.nextInt();

            switch (choice) {
                case 1:  // Display account details
                    System.out.print("Enter account number (S1001/C2001): ");
                    String accNumber = sc.next();
                    displayAccountDetails(accounts, accNumber);
                    break;

                case 2:  // Deposit money
                    System.out.print("Enter account number (S1001/C2001): ");
                    accNumber = sc.next();
                    System.out.print("Enter amount to deposit: ");
                    double depositAmount = sc.nextDouble();
                    depositToAccount(accounts, accNumber, depositAmount);
                    break;

                case 3:  // Withdraw money
                    System.out.print("Enter account number (S1001/C2001): ");
                    accNumber = sc.next();
                    System.out.print("Enter amount to withdraw: ");
                    double withdrawAmount = sc.nextDouble();
                    withdrawFromAccount(accounts, accNumber, withdrawAmount);
                    break;

                case 4:  // Calculate interest for savings accounts
                    System.out.print("Enter account number (Savings only - S1001): ");
                    accNumber = sc.next();
                    calculateInterest(accounts, accNumber);
                    break;

                case 5:  // Exit
                    System.out.println("Exiting the system.");
                    break;

                default:
                    System.out.println("Invalid choice.");
                    break;
            }
        } while (choice != 5);

        sc.close();
    }

    // Method to display account details
    public static void displayAccountDetails(BankAccount[] accounts, String accountNumber) {
        for (BankAccount acc : accounts) {
            if (acc != null && acc.accountNumber.equals(accountNumber)) {
                acc.displayAccountDetails();
                return;
            }
        }
        System.out.println("Account not found.");
    }

    // Method to deposit money to a specific account
    public static void depositToAccount(BankAccount[] accounts, String accountNumber, double amount) {
        for (BankAccount acc : accounts) {
            if (acc != null && acc.accountNumber.equals(accountNumber)) {
                acc.deposit(amount);
                return;
            }
        }
        System.out.println("Account not found.");
    }

    // Method to withdraw money from a specific account
    public static void withdrawFromAccount(BankAccount[] accounts, String accountNumber, double amount) {
        for (BankAccount acc : accounts) {
            if (acc != null && acc.accountNumber.equals(accountNumber)) {
                acc.withdraw(amount);
                return;
            }
        }
        System.out.println("Account not found.");
    }

    // Method to calculate interest for savings account
    public static void calculateInterest(BankAccount[] accounts, String accountNumber) {
        for (BankAccount acc : accounts) {
            if (acc != null && acc.accountNumber.equals(accountNumber)) {
                if (acc instanceof SavingsAccount) {
                    ((SavingsAccount) acc).calculateInterest();
                } else {
                    System.out.println("Interest calculation is not available for this account type.");
                }
                return;
            }
        }
        System.out.println("Account not found.");
    }
}

