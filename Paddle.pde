/* Ideas - Abstract
 Paddle as a Pin-Ball-Lookalike in the middle of the table
 Make the paddle smaller with more points
 [Advanced Option] 360 degrees full rotation for the ball/paddles
 [Advanced Option] Curved Paddle, deflects and different angles
 */

class Paddle {
  //Global Variables
  private color colour, colourResetWhite=#000000;
  private int paddleXLeft, paddleXRight, paddleYLeft, paddleYRight, paddleWidth, paddleHeight, paddleSpeed, yMove;
  private Boolean nightMode=false;
  private Boolean upLeft, downLeft, stopLeft, upRight, downRight, stopRight;
  //
  Paddle (float widthParameter, float heightParameter) { //General Population
    if ( nightMode == false ) this.colour = color ( int(random(100, 255)), int(random(50, 255)), int(random(175, 255)) ) ; //random, different
    if ( nightMode == true ) this.colour = color ( int(random(100, 255)), int(random(50, 255)), 0 ) ; //random, different
    //Game start, paddles in the middle
    paddleWidth = int(widthParameter*1/80); //no "this" thus no change ever
    paddleXLeft = int(widthParameter*1/40);
    paddleXRight = int(widthParameter*39/40) - paddleWidth;
    paddleHeight = int(heightParameter*1/4);
    this.paddleYLeft = int(heightParameter*1/2) - paddleHeight*1/2;
    this.paddleYRight = paddleYLeft;
    //Variables to move the paddle
    this.upLeft = false;
    this.downLeft = false;
    this.stopLeft = false;
    this.upRight = false;
    this.downRight = false;
    this.stopRight = false;
    //Variables for paddle speed
    paddleSpeed = 5; //Previously a USER Initiated Value, constant without THIS
    yMove = int(heightParameter / heightParameter) * paddleSpeed;
  }//End Contructor
  //
  void draw() {
    leftPaddle();
    rightPaddle();
  }//End draw
  //
  void leftPaddle() {
    //Specific Colour - configuration?
    fill(colour);
    rect(paddleXLeft, paddleYLeft, paddleWidth, paddleHeight);
    fill(colourResetWhite);
    move();
  }//End leftPaddle
  //
  void rightPaddle() {
    //Specific Colour - configuration?
    fill(colour);
    rect(paddleXRight, paddleYRight, paddleWidth, paddleHeight);
    fill(colourResetWhite);
    move();
  }//End rigthPaddle
  //
  void move() { //Notice Sequence: arithmetic, check, draw
    //Movement: //paddleYLeft++; //paddleYRight++;
    if ( upLeft == true && downLeft == false ) {
      paddleYLeft -= yMove;
      stopLeft = false;
    }
    //Needs to stop at the top and bottom, else off the screen
    if ( paddleYLeft <= height*0 ) paddleYLeft = 0;
    if ( paddleYLeft >= height-paddleHeight ) paddleYLeft = height-paddleHeight;
    if ( paddleYRight <= height * 0 ) paddleYRight = 0;
    if ( paddleYRight >= height-paddleHeight ) paddleYRight = height-paddleHeight;
  }//End move
  //
  //void momentumAddToBall() {}//End momentumAddToBall
  //- if the paddle is moving, increase the moment of the ball in the direction of the paddle
  //- if the paddle is stationary, increase the x-axis movement only
  //- Easter Egg: super strength ... technique ... OR ... Skill by points (level-up)
  //- ability is controlled in configuration (one or off)
  //
  // Getter
  // - When the Ball Bounces off the Paddle, randomize the color 20 times (1/3 of a second)
  public int paddleYLeftGetter() {
    return paddleYLeft;
  }
  //
  // Setters
  // - Send Paddle Location to Ball Class for Collision and Bounce
  // - Move the Paddle based on Boolean
  void generalReset() {
    upLeft = false;
    downLeft = false;
    stopLeft = false;
    upRight = false;
    downRight = false;
    stopRight = false;
  } 
  //
  public void upLeftSetter() { //Get Keyboard input
    generalReset();
    upLeft = true;
  }
  //
}//End Paddle
