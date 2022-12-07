// so in this file we wanna write out our launchpad for the code to run in the terminal
class MammalTest {
    public static void main(String[] args) {
        Mammal gorilla = new Mammal();
        int energyLevel = gorilla.getEnergyLevel();
        System.out.println("The mammals energy level is at: " + energyLevel);
    }
}