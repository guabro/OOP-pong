/*To Do List
 Ball Collisions
 Pseudocode other class
 Configuring the Game - setting initial variables (i.e. paddle speed)
 Screen Saver Pong or 1-Player Pong: paddle.y=ball.y
 */

// Global Variables & Objects
int ballCount=10; //Hack for STATIC Variable, see Ball Class
Ball[] ball = new Ball[ballCount]; //Not just an array, but an array list: includes code and variables
int ballCounter = ball.length - ball.length; //How to get "zero" but using another value
Paddle paddle;
//
void setup()
{
  size(700, 500); //fullScreen(); displayWidth, displayHeight
  //ScreenSizeChecker() for Landscape, Portrait, square views (updated automatically for screen rotate)
  //
  //Constructor
  ball[ballCounter] = new Ball( width, height ); //Start the first ball, need ballCounter
  paddle = new Paddle( width, height );
  //Instead of myBall or yourBall, ball[0]
  //
  ballCounter++; // ballCounter += 1
  //exit(); //Exit Button, TBA
}//End setup()
//Object is garbage collected here
//
void draw()
{
  background(255); //Gray Scale, hardcoded for prototyping
  paddle.draw();
  for ( int i=0; i<ballCounter; i++ ) { //Controls each ball of all 10 (ballCount)
    ball[i].draw();
    ball[i].directionXSetter(paddle.paddleYLeftGetter(), paddleHeight); //Ball knows when to bounce
  }//End ball.draw
  //
  //myBall.detectCollision(Paddle.x); // Example: Classes Talking
  //
  ballCollisions(); //Student Problem
}//End draw()
//
void keyPressed() {
  //User defined NIGHTMODE, see Ball Class, will be referenced to other classes too
  //NIGHTMODE might be better as a STATIC Variable
  //Press W-S-D for Left Paddle
  if ( key == CODED && key == 'W' || key == 'w' ) paddle.upLeftSetter();
  //if ( key == CODED && key == 'S' || key == 's' ) ; //Security Feature
  //if ( key == CODED && key == 'D' || key == 'd' ) ;
  //Press UP-DOWN-LEFT Arroes for Right Paddle
}//End keyPressed()
//
void mousePressed() {
  //Easter Egg Example: mouse press to create another ball instantiation
  if ( ballCounter >= ball.length) {
    exit(); // Eventually will become an EXIT Button
  } else {
    ballCounter++; // ballCounter += 1
  }
  for ( int i=ballCounter-1; i<ballCounter; i++ ) { // Constructor for other ball objects could be a button
    ball[i] = new Ball( width, height );
    ball[i].draw(); //Completes Constructor, teaching opportunity
  }//End Constructor
}//End mousePressed()
//
