// here we wanna write out our Mammal class

// within the mammal class we want to make two sub classes, one being the Gorilla class, and the other 
// being the bat class. 

// They will both have 

public class Mammal {
    // create member var for energyLevel
    protected static int energyLevel = 100;
    
    public Mammal(int energyLevel){ // here we build a constructor for the mammal instance
        this.energyLevel = energyLevel;
    }
    //create displayEnergy() method.
    public int displayEnergy(int energyLevel){
        System.out.println("The Energy level is currently " + this.energyLevel);
        return this.energyLevel;
    }
}


