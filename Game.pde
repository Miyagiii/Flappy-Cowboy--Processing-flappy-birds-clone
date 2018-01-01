
/*
Coded by TheSpaceCowboy42534
Gitub: github.com/TheSpaceCowboy42534
Date: 31/12/17

Happy new year :)

*/

//Imports
bird b; //Creates a bird object placeholder
stage s; // Creates a stage object placeholder
int score; // Creates a placeholder for the score
PImage bg; // Creates placeholder for the background image
String highScore[]; // Creates a placeholder for highscore
PrintWriter fw; // Placeholder for writing files
void setup(){
  
  size(500,500); // Size of the program
  highScore = loadStrings("highscore.txt");  // Loads in highscore 
  score = 0; // Sets current score to 0
  b = new bird(); // Creates an instance of bird;
  s = new stage(); // Creates an instance of stage
  bg = loadImage("data/bg.png"); // Loads in background image
  bg.resize(500,500); // Resizes background to fit application
}

void draw(){
  background(bg); // Sets the background to the image
  text("HighScore: "+highScore[0],50,30); // Displays highscore
  text("Score: "+score,50,50); // Displays score
  b.display(); // Displays bird
  b.update(); // Updates birds position
  s.display(); // Displays stage
  s.update(); // Updates stage position 
  if(s.kills(b) == true)
  {
    b.kill(); // If stage collides with bird kill vird
  }    

 if(b.isDead())
 {
   gameover(); // Display's gameover screen

   
    
    
 }
 else
 {
   score++; // Adds score while it's alive
 }
  

}

void mousePressed()
{
  b.pos(); // Increases the birds y
}
void keyPressed()
{
  if(b.isDead() == true) // If bird is dead then you can revive
  {
    b.setDead(false); // Revives bird instead of creating new instance
    setup(); // Runs setup
    b.pos(); // Stops death upon respawn
    
  }

}


void gameover()
{
    background(255,0,0); // Sets background to red
    text("You died",width/2-50,height/2); // Tells user they died
    text("Score: "+score,width/2-50,height/2+20); // Displays score
    if(int(highScore[0]) < score) // If the score is higher than the highscore update the highscore
    {
      fw = createWriter("highscore.txt"); // Writes the new data to the highscore file
      fw.println(score);
      fw.flush();
      fw.close();
          
    }

    delay(500); // Delays program to prevent accidental respawn


}