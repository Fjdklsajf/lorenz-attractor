/**************************************************************************************
 * Name - Zhongming Su
 * Date - 7 October 2020
 * Description - This program simulates the Lorenz attractor by using Lorenz's 
 *   differential equations. The objective is to present of visual representation of
 *   two of the Lorenz's Equation and Chao Theory's traits -- sensitivity to initial 
 *   conditions & strange attractors
 **************************************************************************************/
import peasy.*;

//parameters (Lorenz attractor constants)
final float SIGMA = 10;
final float RHO = 28;
final float BETA = 8 / 3.0;

final int LENGTH = 1000; //length of the drawings
PeasyCam cam;

//drawings
Attractor attractor1 = new Attractor(0.1, 0, 0);   //control
Attractor attractor2 = new Attractor(0.2, 0, 0);   //slight change of initial condition
Attractor attractor3 = new Attractor(30, 20, -10); //extreme change of initial condition

/**************************************************************************************
 * void setup()
 * ____________________________________________________________________________________
 * Sets up the display window, colors, and camera
 * 
 * Preconditions - none
 **************************************************************************************/
void setup() {
  size(1000, 700, P3D); //set up window
  colorMode(HSB); //set up color mode
  cam = new PeasyCam(this, 500); //set up cam rotations
}

/**************************************************************************************
 * void drawHelper(Attractor, float)
 * ____________________________________________________________________________________
 * Draws the given dyanmic system on the window with given hue value as color.
 * If !(0 < hue < 255), display the system with rainbow colors
 * Length of the drawing is limited to LENGTH (default = 100)
 * 
 * Preconditions - none
 **************************************************************************************/
void drawHelper(Attractor attractor, float hue) {
  int processed = 0;
  boolean rainbow = false;
  
  
  if(hue < 0 || hue > 255) {
    rainbow = true;
    hue = 0;
  }
  
  beginShape();
  for(PVector v : attractor.getPoints()) {
    //Limit length of the drawing
    processed++;
    if(processed + LENGTH < attractor1.points.size()) {
      continue;
    }
    
    //Draw vectors
    stroke(hue, 255, 255);
    vertex(v.x, v.y, v.z);
    
    //Rainbow color
    if(rainbow) {
      hue += 0.1;
      if(hue > 255) {
        hue = 0;
      }
    }
  }
  endShape();
}

/**************************************************************************************
 * void draw()
 * ____________________________________________________________________________________
 * Updates the attractors and draws the pathings with respect to time
 * 
 * Preconditions - none
 **************************************************************************************/
void draw() {
  background(0); //set background color
  
  attractor1.update();
  attractor2.update();
  attractor3.update();
  
  translate(0, 0, 80); //set drawing conditions
  scale(5);
  stroke(255);
  noFill();
  
  //First drawing
  drawHelper(attractor1, 0);
  //drawHelper(attractor1, 256);
  
  //Second drawing with slight initial condition change
  drawHelper(attractor2, 124);
  
  //Third drawing with extreme initial condition
  drawHelper(attractor3, 75);
}
