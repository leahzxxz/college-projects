class Banana
{
  // position
  float xPos, yPos;
  
  // perlin noise index
  float perlinIndex;

  Banana(float x, float y)
  {
    xPos = x;
    yPos = y;
    
    // pick a random perlin noise index
    perlinIndex = random(0,100000);
  }  
  
  boolean collect(float x, float y)
  {
    // did the minion catches this banana?
    if (x > xPos - 15 && x < xPos + bananaImage.width + 15 && y > yPos - 15 && y < yPos + bananaImage.height + 15)
    {
      // I should hide!  jump up to some random negative y value
      // I will continue to fall since my display() function will keep getting called by the main program
      yPos = random(-300, -50);
      
      // also return true - this lets the main program know that we have a hit, so it can assign
      // points to the user
      return true;
    }  

    // no hit!    
    else
    {
      return false;
    }
  }
  
  void display()
  {
    // grab a random number from the Perlin noise generator
    float r = noise(perlinIndex);
    
    // turn that number into a number between -2 and 2 to simulate our swaying left and right
    float xMovement = map(r, 0, 1, -2, 2);
    
    // add xMovement to our xPos
    xPos += xMovement;
    
    // prevent the coin from going off the right or left edges by constraining it
    xPos = constrain(xPos, 0, width-50);
    
    // add 1 to our y position always -- this simulates dropping
    yPos += 1;
    
    // wrapping
    if (yPos > height)
    {
      yPos = -50;
    }
    
    // add a small amount to our Perlin noise location so next time we get a different random #
    perlinIndex += 0.01;
    
    image(bananaImage, xPos, yPos);
  }
  
}
