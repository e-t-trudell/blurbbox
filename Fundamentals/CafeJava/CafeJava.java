public class CafeJava {
    public static void main(String[] args) {

        String generalGreeting = "Welcome to Cafe Java,";
        String pendingMessage = ", your order will be ready shortly";
        String readyMessage = ", your order is ready";
        String displayTotalMessage = "Your total is $";

        double mochaPrice = 3.5;
        double dripCoffeePrice = 3.25;
        double lattePrice = 4.0;
        double cappucinoPrice = 2.8;

        String customer1 = "Cindhuri";
        String customer2 = "Sam";
        String customer3 = "Jimmy";
        String customer4 = "Noah";

// at first I asked myself why do we need 4 isReadyOrder variables? 
// shouldnt we get by with 2 since we only need true and false? 
// NO, your're thinking about it the wrong way. The isReadyOrder stands for each Customers order, we can just change
        boolean isReadyOrder1 = false; // whether we want it true or false by changing it.
        boolean isReadyOrder2 = true;
        boolean isReadyOrder3 = true;
        boolean isReadyOrder4 = true;

        System.out.println(generalGreeting + customer1);
// Cindhuri message
        System.out.println(customer1 + pendingMessage);

// for Noah's order
        if (isReadyOrder2) {
            System.out.println(customer4 + readyMessage);
            System.out.println(displayTotalMessage + cappucinoPrice);
        }
        else {
            System.out.println(customer4 + pendingMessage);
        }
// for Sam
        System.out.println(displayTotalMessage + lattePrice*2);
        if (isReadyOrder3){
            System.out.println(customer2 + readyMessage);
        }
        else{
            System.out.println(customer2 + pendingMessage);
        }

// for Jimmy
        System.out.println(displayTotalMessage + (lattePrice - dripCoffeePrice));
    }
}