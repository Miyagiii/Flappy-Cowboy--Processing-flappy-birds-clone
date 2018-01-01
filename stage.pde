
/*
Coded by TheSpaceCowboy42534
Gitub: github.com/TheSpaceCowboy42534
Date: 31/12/17

Happy new year :)

*/

private PVector loc1, loc2; // Placeholder for the bottom and top of the stage
private float size1, size2, speed = 15; // Placeholder for the size of the top and bottom of the stage as well as how fast they move across the stage
private PImage p,p2; // Placeholder for the images

class stage
{
  stage() // Constructor for the stage
  {
    gen(); // Generates the top and bottom of the stage
    p = loadImage("data/rocket.png"); // Loads the bottom rocket pipe
    p2 = loadImage("data/rocket2.png"); // Loads the top rocket pipe

  }
  void gen()
  {
    
    size1 = random(100, height/2-25); // Sets the size of the first rocket pipe
    size2 = random(100, height/2-50); // Sets the size of the second rocket pipe
    loc1 = new PVector(float(width), 0); // Sets the location of the first rocket pipe
    loc2 = new PVector(float(width), height-size2); // Sets the location of the second rocket pipe
  }
  void display()
  {

    //rect(loc1.x, loc1.y, 30, size1);
    //rect(loc2.x, loc2.y, 30, size2); 
    
    image(p2,loc1.x-10,loc1.y,60,size1); // Displays the first rocket
    image(p,loc2.x-10,loc2.y,60,size2); // Displays the second rocket

  }
  boolean kills(bird b)
  {
   // line(b.getPos().x, b.getPos().y, 30, height - size2   );
    //line(b.getPos().x, b.getPos().y, 30, size1  );
    if (b.getPos().y  > 0 && b.getPos().y  <  size1 -5||b.getPos().y  < height && b.getPos().y  >  height -size2 +5 || b.getPos().y < 0) { // If the bird is between the size and the top or the bottom of the screen
      if (b.getPos().x > loc1.x && b.getPos().x < loc1.x + 30 || b.getPos().x > loc2.x && b.getPos().x < loc2.x + 30) // If the bird is between the width of the pipes
      {
        return true; // Kill the bird
      }
    }
    return false;
  }
  void update() 
  {
    loc1.x -= speed; // Moves the first pipe left
    loc2.x -= speed; // Moves the second pipe left
    if (loc1.x < 0)
    {
      gen(); // When the pipes are at the left re generate them
    }
  }
}