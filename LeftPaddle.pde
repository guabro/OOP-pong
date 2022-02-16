//Global Variable
int leftPaddleSpeed = 5;

void leftPaddleDraw() {
  leftPaddleStart(); //Might have to move outside draw()
  //
  if ( yLeftPaddle < height*0) yLeftPaddle = height*0;
  if ( yLeftPaddle+heightPaddle > height) yLeftPaddle = height;
  //
}//End leftPaddle

void leftPaddleKeyPressed() {
  //Left Paddle: 'W' & 'S' Keys
  if ( key=='W' || key=='w' ) yLeftPaddle -= leftPaddleSpeed ; //yRightPaddle=yRightPaddle-1, yRightPaddle--
  if ( key=='S' || key=='s' ) yLeftPaddle += leftPaddleSpeed;
}//End rightPaddlekeyPressed

void leftPaddleStart() {
  rect(xLeftPaddle, yLeftPaddle, widthPaddle, heightPaddle);
}//End leftPaddleStart()
