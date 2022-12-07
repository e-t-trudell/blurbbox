public class Gorilla extends Mammal{
    // create gorilla instance
    public Gorilla(int energyLevel){
        super(energyLevel);
        //why do super instead of just this.energylevel?
    }
    // create throw something method
    public void throwSomething() {
        System.out.println("The gorilla threw a rock! So - 5 energy.");
        this.energyLevel -= 5;
    }
    // create eatBananas()
    public void eatBananas(){
        System.out.println("The gorilla cheered and ate the bananas!");
        this.energyLevel += 10;
    }

    // climb method
    public void climb(){ // why void instead of int?
        System.out.println("The gorilla swiftly climbed the tree.");
        this.energyLevel -=10; //why don't we put energyLevel into the params?
    }
}