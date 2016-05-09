float radius = 100.0;
float radian;
float x1, y1, x2, y2, x3, y3, x4, y4;
int offset = 150;

void setup() {
  size(400, 400);
  background(0);

  radian = 0;
}

void draw() {
  background(0);

  x1 = sin(radian)*radius + offset;
  y1 = cos(radian)*radius + offset;

  x2 = sin(radian+PI)*radius + offset;
  y2 = cos(radian+PI)*radius + offset;

  x3 = sin(radian+PI/2)*radius + offset;
  y3 = cos(radian+PI/2)*radius + offset;

  x4 = sin(radian+PI*1.5)*radius + offset;
  y4 = cos(radian+PI*1.5)*radius + offset;

  stroke(255, 125);
  strokeWeight(1);
  noFill();
  ellipse(offset, offset, radius*2, radius*2);

  stroke(255, 75);
  strokeWeight(1);
  line(x1, y1, x2, y2);
  line(x3, y3, x4, y4);

  fill(255);
  ellipse(x1, y1, 4, 4);
  ellipse(x2, y2, 4, 4);
  ellipse(x3, y3, 4, 4);
  ellipse(x4, y4, 4, 4);



  if (radian < 2*PI) {
    radian = radian+=0.03;
  } else {
    radian = 0;
  }
}