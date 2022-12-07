public class Bat extends Mammal {
    public Bat(){// we do not need an energyLevel param
        super(300);//simply input the only value we can pass in
    }
    public void fly(){
        System.out.println("The bat took off and flew");
        this.energyLevel -= 50;

    }
    public void eatHumans(){
        System.out.println();
        this.energyLevel += 25;
    }
    public void attackTown(){
        System.out.println("The crackle of fire burns as the bat attacked!");
        this.energyLevel -= 100;
    }
}