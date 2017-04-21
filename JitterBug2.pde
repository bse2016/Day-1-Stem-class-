  //Bryce Ellinger
  //4/21/17
  
  JitterBug jit;
   JitterBug bug;
   void setup() {
     size(480, 120);
     smooth();
     jit = new JitterBug(width * 0.33, height/2, 50);
     bug = new JitterBug(width * 0.66, height/2, 10);
}
   void draw() {
     jit.move();
     jit.display();
     bug.move();
     bug.display();
     beetle();
     setColor();
     setSize();
}

float x1, y1, x2, y2, x3, y3;
float speed = 2.5;

void beetle() {
  
  x1 += random(-speed, speed);
  y1 += random(-speed, speed);
  x2 += random(-speed, speed);
  y2 += random(-speed, speed);
  x3 += random(-speed, speed);
  y3 += random(-speed, speed);
  fill(100, color1, 200);
  triangle(x1, y1, x2, y2, x3, y3);
}

int color1;

void setColor() {
  color1 = int(random(0, 255));

}
 float size;
void setSize() {
  size = int(random(30, 50));
}