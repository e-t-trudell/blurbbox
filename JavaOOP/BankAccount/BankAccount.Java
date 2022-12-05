class BankAccount {
    // instances that belong to a bank account
    // Ask TA why we do the private and not public/
    private double checkingBalance;
    private double savingsBalance;
    
    // we have 'int' below since the num of accounts will be a whole number
    //Static things (that belong to the bankAccount class)
    public static int numberOfAccounts = 0;
    public static double totalAmount = 0;

// a simple constructor for the bank account creation structure
    public BankAccount(){
        // what is the importance of calling 'this'? Do we need to use it only in constructors?
        this.checkingBalance = 0;
        this.savingsBalance = 0;
        BankAccount.numberOfAccounts++;
    }

    public void deposit(double amount, String account){
        // ask Peter why we do the "checking"?
        if (account == "checking") {
            this.checkingBalance += amount;
        }
        else {
            this.savingsBalance += amount;
        }
        this.totalAmount += amount;
    }

    public void withdraw(double amount, String account) {
        if (account == "checking") {
            if(amount > this.checkingBalance) {
                System.out.println("Insufficient Funds");
                return;
            }
            this.checkingBalance -= amount;
        }
        else {
            if(amount > this.savingsBalance) {
                System.out.println("Insufficient Funds");
                return;
            }
            this.savingsBalance -= amount;
        }
        this.totalAmount -=amount;
    }
// creating a getter method for checking
    public double getCheckingBalance() {
        return this.checkingBalance;
    }
// getter method for savings
    public double getSavingsBalance() {
        return this.savingsBalance;
    }
}