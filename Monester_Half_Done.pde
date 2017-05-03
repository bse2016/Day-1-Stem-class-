float bodyCordX = 250;
float leftEyeCordX = 215;
float rightEyeCordX = 290;
float leftPupuleCordX = 215;
float leftPupuleCordY = 225;
float  rightPupuleCordX = 290;
float  rightPupuleCordY = 225;
float leftEyeX;
float leftEyeY;
float rightEyeX;
float rightEyeY;

   float  E1= 220;
   float  E2= 230;
   float  E3= 210;
   float  E4= 220;
   float  E5= 220;
   float  E6= 230;
   float  E7= 285;
   float  E8= 295;
    
void setup() {
  size(500, 500);
}

void draw() {
  
  background(244);
  drawing();
  eyeTrack();

}

void drawing() {
  fill(#34CE63);
  ellipse(bodyCordX, 250, 150, 150); //body
  fill(244);
  ellipse(leftEyeCordX, 225, 25, 25); //Left Eye
  fill(244);
  ellipse(rightEyeCordX, 225, 25, 25); //Right Eye
  fill(0);
  ellipse(leftEyeX, leftEyeY, 8, 8); //Left Pupol
  fill(0);
  ellipse(rightEyeX, rightEyeY, 8, 8); //Right Pupol
  fill(244);
  ellipse(bodyCordX, 280, 80, 30); // Mouth
  fill(0);
  triangle(bodyCordX, 320, bodyCordX-10, 265, bodyCordX+10, 265); //Tooth
}

void eyeTrack() {
 
  leftEyeY = constrain(mouseY, E1, E2);
  leftEyeX = constrain(mouseX, E3, E4);
  
  rightEyeY = constrain(mouseY, E5, E6);
  rightEyeX = constrain(mouseX, E7, E8);
}

void  keyPressed() {
  if(keyCode == RIGHT) {
    bodyCordX += 10;
    leftEyeCordX += 10;
    rightEyeCordX += 10;
    leftPupuleCordX += 10;
    rightPupuleCordX += 10;
    
    
    E3+= 10;
    E4+= 10;
   
    E7+= 10;
    E8+= 10;
  }
  if(keyCode == LEFT) {
    bodyCordX -= 10;
    leftEyeCordX -= 10;
    rightEyeCordX -= 10;
    leftPupuleCordX -= 10;
    rightPupuleCordX -= 10;
    
    E3-= 10;
    E4-= 10;
   
    E7-= 10;
    E8-= 10;
  }
}