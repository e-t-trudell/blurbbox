class BankAccountTest {
    public static void main(String[] args) {

        BankAccount sadieBankAccount = new BankAccount();
        sadieBankAccount.deposit(600, "checking");
        sadieBankAccount.deposit(75, "savings");
        sadieBankAccount.withdraw(100, "checking");
        sadieBankAccount.withdraw(800, "checking");
        sadieBankAccount.withdraw(75, "savings");

        System.out.println(sadieBankAccount.getCheckingBalance());
        System.out.println(sadieBankAccount.getSavingsBalance());

        System.out.println(BankAccount.totalAmount);
    }


}