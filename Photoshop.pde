PImage image;
float rotateAmount;
boolean rotate;
float filter = 0;
int fliterColor1, fliterColor2, fliterColor3;
boolean payment;
float Width, Hight;
void setup() {
  size(600, 500);
  image = loadImage("Scene.jpg");
  rotateAmount = 0;
   fliterColor1 = 244;
   fliterColor2 = 244;
   fliterColor3 = 244;
   payment = false;
   Width = 150;
   Hight = 100;
}

void draw() {
  background(#AAA899);
  
  functionBar();
  functionBarFunction();
  filterPic();
  rotatePic();
  
  tint(fliterColor1, fliterColor2, fliterColor3);
 image(image, 0, 0, Width, Hight);
  payment();
}

void functionBar() {
  fill(#898887);
  rect(0, 25, 100, 500);
  rect(0, 0, 600, 25); //uper bar
  fill(0);
  text("Photoshop (Processing Edition)", 400, 18);
  
  fill(#0A35FF);
  rect(15, 40, 72, 40); //Button Rotate
  fill(#989696);
  rect(15, 100, 72, 40); //Grey Color
  fill(10, 100, 200);
  rect(15, 160, 72, 40); //blue filter
  fill(59, 232, 170);
  rect(15, 220, 72, 40); //green fliter
  fill(#E3E3E3);
  rect(15, 400, 72, 40);
  fill(#E8F018);
  rect(15, 280, 72, 40);
  rect(15, 340, 72, 40);
  fill(0);
   text("Rotate", 32, 62);
   text("Reset", 35, 423);
   text("Biger", 35, 305);
   text("Smaller", 30, 365);
}

void functionBarFunction() {
  if(payment == false) {
  if(mouseX > 15 && mouseX < 87 && mouseY > 40 && mouseY < 80 && mousePressed == true && rotate == false) {
    rotateAmount = rotateAmount + 90;
    rotate = true; 
  }
  
  if(mouseX > 15 && mouseX < 87 && mouseY > 100 && mouseY < 140 && mousePressed == true) {
    filter = 1;
  }
  
  if(mouseX > 15 && mouseX < 87 && mouseY > 160 && mouseY < 200 && mousePressed == true) {
    filter = 2;
  }
  if(mouseX > 15 && mouseX < 87 && mouseY > 220 && mouseY < 260 && mousePressed == true) {
    filter = 3;
  }
  if(mouseX > 15 && mouseX < 87 && mouseY > 400 && mouseY < 440 && mousePressed == true) {
    filter = 0;
    rotateAmount = 0;
  }
  if(mouseX > 15 && mouseX < 87 && mouseY > 280 && mouseY < 320 && mousePressed == true) {
    if(Width < 300 && Hight < 300) {
    Width = Width + 10;
    Hight = Hight + 10;
    }
  }
  if(mouseX > 15 && mouseX < 87 && mouseY > 340 && mouseY < 380 &&  mousePressed == true) {
    if(Width > 50 && Hight > 50) {
    Width = Width - 10;
    Hight = Hight - 10;
    }
  }
  }
}

void rotatePic() {
  imageMode(CENTER);
  translate(400, 200);
  rotate(radians(rotateAmount));
}

void filterPic() {
  if(filter == 0) {
    fliterColor1 = 244;
    fliterColor2 = 244;
    fliterColor3 = 244;
  }
  if(filter == 1) {
    fliterColor1 = 152;
    fliterColor2 = 152;
    fliterColor3 = 152;
  } 
  if(filter == 2) {
    fliterColor1 = 10;
    fliterColor2 = 100;
    fliterColor3 = 200;
  } 
  if(filter == 3) {
    fliterColor1 = 59;
    fliterColor2 = 232;
    fliterColor3 = 170;
  }
}
void payment() {
 if(millis()/1000 == 5) {
    payment = true;
 }
  if(payment == true) {
    rotateAmount = 0;
    translate(-400, -200);
    fill(#C1C1C1);
    rect(150, 150, 300, 200);
    fill(244);
    rect(150, 150, 300, 20);
    fill(#FF0D0D);
    ellipse(440, 160, 10, 10);
    fill(0);
    ellipse(440, 160, 4, 4);
    text("Piracy Notice", 155, 165);
    text("Your Free Trial is over.", 155, 190);
    text("Please pult a 100% in for Bryce's grade if you", 155, 215);
    text("would like to continue.", 155, 230);
    if(mouseX < 450 && mouseX > 430 && mouseY < 170 && mouseY > 150 && mousePressed == true) {
      payment = false;
     
    }
  }
}

void mouseReleased() {
  rotate = false;
}