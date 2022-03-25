/* Ideas - Abstract
 Change the Ball Colour based on direction or collision
 Change the speed of the ball based on the score of the game
 Change the colour of the ball at a specific level/score
 Introduce multiple balls at a specific level/score
 Unlimited mode, where the ball speeds up over time
 - Note: continuous collision, so the ball can't zip through the paddle
 Ball become invisible for a split second-guessing
 - invisible halfway across the screen ... guess the path
 */
private class Ball
{
  //Global Variables
  private float x, y, diameter, xStart, yStart, xDirection, yDirection;
  private color colour, colourReset=#FFFFFF;
  private int xSpeed, ySpeed;
  private Boolean nightMode=false, ballXGoal=false;
  //
  // int ballCount = 10; //Knows how many instances of BALL there are
  // Not just myBall and yourBall
  // Example of a Static Variable: do not need an object, true sense of Final Global Variable 
  //
  public Ball (float widthParameter, float heightParameter) { //Constructor Is ... hard coded, single visual object
    this.x = widthParameter*1/2; //Start Ball Location whereever
    this.y = heightParameter*1/2;
    xStart = x; // Location Specifically at Game Start, middle of field
    yStart = y;
    diameter = widthParameter*1/70; //same on all of them
    if ( nightMode == false ) this.colour = color( random( 0, 255), random(255), random(255) );
    if ( nightMode == true ) this.colour = color( random( 0, 255), random(255), 0 ); //Blue=0 //Hexidecimal: #1FFF03, Night Mode Friendly
    this.xSpeed = int ( random (widthParameter/widthParameter, widthParameter/widthParameter*5) );
    this.ySpeed = int ( random (heightParameter/heightParameter, heightParameter/heightParameter*5) );
    xDirection = 0;
    while ( xDirection == 0) { 
      this.xDirection = int ( random (-2, 2) );
    } //one line WHILE
    yDirection = 0;
    while ( yDirection == 0) { 
      this.yDirection = int ( random (-2, 2) );
    } //one line WHILE
  }//End Constructor
  //
  public void draw() {
    fill(colour);
    ellipse(x, y, diameter, diameter);
    fill(colourReset);
    //
    ballScore();
    //bouncePaddle(); //See Main void draw
  }//End draw
  //
  private void move() {
    x += xSpeed;
    y += ySpeed;
  }//End move
  //
  private void bounce() {//not the bounce off the paddles
    if ( x-diameter*1/2 < width*0 || x+diameter*1/2 > width ) xSpeed *= -1; //Net Bounce, will change
    if ( y-diameter*1/2 < height*0 || y+diameter*1/2 > height ) ySpeed *= -1; //Top and Bottom
  }//End bounce
  //
  private void ballScore() {
    //Ball knows where NET is
    if ( x < (width*0)+diameter || x > width-diameter  ) { //Net Detection
      ballXGoal = true; //Might be bug depending on Goal Algorithms
      if ( x < (width*0)+diameter ) {//Goal for left player
        x = (width*0)+(diameter/4); // Ackward ball placement
        y = y;
      } 
      if ( x > width-diameter ) { //Goal for right player
        x = width-diameter/4; // Ackward ball placement
        y = y;
      }
    } //End Net Detection
    //
    if ( ballXGoal == true ) {
      //EMPTY IF
    } else {
      move();
      bounce();
    }
  }//End ballScore
  //
  //Getters and Setters
  void directionXSetter(int paddleYLeft, int paddleHeight) {
    if ( y>=paddleYLeft && y<=paddleYLeft+paddleHeight ) xDirection *=  (-1); 
  }
}//End Ball
