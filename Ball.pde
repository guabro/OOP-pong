int xMove, yMove; //see population
Boolean rigthGoalScore = false;

void ball() {
  ballStart();
  ballMove();
}//End ball()

void ballMove() {
  //Conditional for Goal Check and Moving the Ball on the x-axis
  if (xBall >= x1RightNet-(ballDiameter*1/2)) {
    xBall = width-ballDiameter*1/2;
  } else if (xBall <= x1LeftNet+(ballDiameter*1/2)) {
    xBall = (width*0)+(ballDiameter*1/2);
  } else {
    xBall += xMove;
    yBall += yMove;
  }
  //
  if ( xBall<=(width*0)+(ballDiameter*1/2) || xBall>=width-(ballDiameter*1/2) ) xMove*=-1;
  if ( yBall<=(height*0)+(ballDiameter*1/2) || yBall>=height-(ballDiameter*1/2) ) yMove*=-1;
  //
}//End ballMove

void ballStart() {
  ellipse(xBall, yBall, ballDiameter, ballDiameter);
}//End ballStart
