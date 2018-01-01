
/*
Coded by TheSpaceCowboy42534
Gitub: github.com/TheSpaceCowboy42534
Date: 31/12/17

Happy new year :)

*/

private float gravity = 0.5, velocity = 0; // Gravity and velocity placeholder
private PVector position; // Placeholder for the position (x cord isn't really required in this program however i used a vector just in case)
private boolean dead = false; // Creates dead variable which is false by default
private PImage img; // Image placeholder
class bird{
   bird() // Bird constructor
   {
     position =  new PVector(35,height/2); // Sets the position to the left of the screen in the middle
     img = loadImage("data/1496184262Emoji-Png-Icon-Cowboy-Emoji-Png-large.png"); // Loads image
   }
   bird(PVector Cord) // Bird constructor
   {
     position = Cord; // Sets the bird at a specific cord
     img = loadImage("data/1496184262Emoji-Png-Icon-Cowboy-Emoji-Png-large.png"); // Loads image

   }
   void setDead(boolean b) // Setter for dead variable
   {
     dead = b;
   }
   void display() // Displays birds
   {
    //ellipse(position.x,position.y,30,30);
     image(img,position.x-15,position.y-15,30,30);
   }
   PVector getPos() // Return position
   {
     return position;
   }
   boolean isDead() // Returns if bird is dead or not
   {
     return dead;
   }
   void kill() // Kills the bird 
   {
    dead = true; 
   }
   void pos() // Increments the velocity in the y axis by 10 
   {
     if(dead == false) 
     {
       velocity = -10;

     }
   }
   void update()
   {
     if(dead == false){
       velocity += gravity; // gravity is being applied to object
       position.y += velocity; // Velocity is being applied to the y position
       if(position.y >= height)
       {
         dead = true; // If the bird goes below the stage set dead to true
       }
     }
   }

}