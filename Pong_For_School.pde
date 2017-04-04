int x, y, w, h, speedX, speedY;
int paddleXL, paddleYL, paddleW, paddleH, paddleS, gameover,timer, mill, timerReset;
int paddleXR, paddleYR, ballColor;
boolean upL, downL;
boolean upR, downR;

color colorL = color(255);
color colorR = color(255);

int scoreL = 0; 
int scoreR = 0;

int winScore = 2;

void setup() {
  size(600, 500);

  x = width/2;
  y = height/2;
  w = 25;
  h = 25;
  speedX = 3;
  speedY = 2;
  timerReset = 0;
  timer = mill-timerReset;

  textSize(25);
  textAlign(CENTER, CENTER);
  
  rectMode(CENTER);
  paddleXL = 40;
  paddleYL = height/2;

  paddleXR = width-40;
  paddleYR = height/2;

  paddleW = 15;
  paddleH = 100;
  paddleS = 5;
}

void draw() {
  background(58, 179, 222);
 mill = millis();
  drawCircle();
  moveCircle();
  bounceOff();

  drawPaddles();
  timer();
  movePaddle();
  restrictPaddle();
  contactPaddle();
  scores();
  gameOver();
  PaddleAI();
  ballChange();
}

void drawPaddles() {
  fill(colorL);
  rect(paddleXL, paddleYL, paddleW, paddleH);
  fill(colorR);
  rect(paddleXR, paddleYR, paddleW, paddleH);
}

void movePaddle() {
  if (upL) {
    paddleYL = paddleYL - paddleS;
  }
  if (downL) {
    paddleYL = paddleYL + paddleS;
  }
  if (upR) {
    paddleYR = paddleYR - paddleS;
  }
  if (downR) {
    paddleYR = paddleYR + paddleS;
  }
}

void restrictPaddle() {
  if (paddleYL - paddleH/2 < 0) {
    paddleYL = paddleYL + paddleS;
  }
  if (paddleYL + paddleH/2 > height) {
    paddleYL = paddleYL - paddleS;
  }
  if (paddleYR - paddleH/2 < 0) {
    paddleYR = paddleYR + paddleS;
  }
  if (paddleYR + paddleH/2 > height) {
    paddleYR = paddleYR - paddleS;
  }
}

void contactPaddle() {
  //left collision
  if (x - w/2 < paddleXL + paddleW/2 && y - h/2 < paddleYL + paddleH/2 && y + h/2 > paddleYL - paddleH/2 ) {
    if (speedX < 0) {
      speedX = -speedX;
    }
  }

  //right collision
  else if (x + w/2 > paddleXR - paddleW/2 && y - h/2 < paddleYR + paddleH/2 && y + h/2 > paddleYR - paddleH/2 ) {
    if (speedX > 0) {
      speedX = -speedX;
    }
  }
}

void drawCircle() {
  fill(ballColor);
  ellipse(x, y, w, h);
}

void moveCircle() {
  x = x + speedX;
  y = y + speedY;
}

void bounceOff() {
  if ( x > width - w/2) {
    setup();
    speedX = -speedX;
    scoreL = scoreL + 1;
  } else if ( x < 0 + w/2) {
    setup();
    scoreR = scoreR + 1;
  }

  if ( y > height - h/2) {
    speedY = -speedY;
  } else if ( y < 0 + h/2) {
    speedY = -speedY;
  }
}

void scores() {
  fill(255);
  text(scoreL, 100, 50);
  text(scoreR, width-100, 50);
}
void gameOver() {
  if(scoreL == winScore) {
    gameOverPage("", colorL);
  }
  
  if(scoreR == winScore) {
    gameOverPage("", colorR);
    
  }
}

void gameOverPage(String text, color c) {
  gameover = 1;
  speedX = 0;
  speedY = 0;
  
  fill(255);
  text("Game over", width/2, height/3 - 40);
  text("Click to play again", width/2, height/3 + 40);
  fill(c);
  text(text, width/2, height/3);
  
  if(mousePressed) {
    scoreR = 0;
    scoreL = 0;
    speedX = 3;
    speedY = 2;
    gameover = 0;
    timerReset = mill;
    timer = mill-timerReset;
  }
  
}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    upL = true;
  }
  if (key == 's' || key == 'S') {
    downL = true;
  }
  if (keyCode == UP) {
    upR = true;
  }
  if (keyCode == DOWN) {
    downR = true;
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') {
    upL = false;
  }
  if (key == 's' || key == 'S') {
    downL = false;
  }
  if (keyCode == UP) {
    upR = false;
  }
  if (keyCode == DOWN) {
    downR = false;
  }
}

void PaddleAI() {
  if(paddleYR == y) {
  } else {
     paddleYR = y;
  }
}
void ballChange() {
  if(speedX < 0) {
      ballColor = 0;
  }
    else 
  ballColor = 255;
}
void timer() {
  fill(255);
  textAlign(CENTER);
  text(mill/1000, width/2, 40);
  println(mill);
   
}