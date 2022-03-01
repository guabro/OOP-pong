//Global Variable
int leftPaddleSpeed = 0;
Boolean leftPaddleUP=false, leftPaddleDOWN=false;

void leftPaddleDraw() {
  leftPaddleStart(); //Might have to move outside draw()
  //
  if ( yLeftPaddle <= height*0) yLeftPaddle = height*0;
  if ( yLeftPaddle+heightPaddle >= height) yLeftPaddle = height-heightPaddle; // if yLeftPaddle=height, hidden bug
  //
  if ( leftPaddleUP==true ) yLeftPaddle -= leftPaddleSpeed ; //yLeftPaddle=yLeftPaddle-1, yLeftPaddle--
  if ( leftPaddleDOWN==true ) yLeftPaddle += leftPaddleSpeed ;
  //Note: this method creates a bug when it reaches the bottom of the screen
  //
}//End leftPaddle

void leftPaddleKeyPressed() {
  //Left Paddle Speed, before Game Plays
  if ( leftPaddleSpeed==0 ) {
    if ( key=='N' || key=='n' ) leftPaddleSpeed = 1;
    if ( key=='R' || key=='r' ) leftPaddleSpeed = 3;
    if ( key=='G' || key=='g' ) leftPaddleSpeed = 10;
  }
  //Left Paddle: 'W', 'S', 'D' Keys
  //Note: two variables true is a Logical Conflict for Paddle Movement
  //Paper & Pencil: true tables
  if ( key=='W' || key=='w' ) {
    leftPaddleUP=true;
    leftPaddleDOWN=false;
  }//End leftPaddleUP ; 
  if ( key=='S' || key=='s' ) {
    leftPaddleUP=false;
    leftPaddleDOWN=true;
  }//End leftPaddleDOWN
  if ( key=='D' || key=='d' ) {
    leftPaddleUP=false;
    leftPaddleDOWN=false;
  }//End leftPaddleDOWN
  //
}//End lefttPaddleKeyPressed

void leftPaddleStart() {
  rect(xLeftPaddle, yLeftPaddle, widthPaddle, heightPaddle);
}//End leftPaddleStart()
