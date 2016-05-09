import controlP5.*;

ControlP5 controlP5;
boolean showGUI = false;
Slider[] sliders;

int tempo = 5; // tempo varie, cf. draw()
ArrayList<Rocket> rockets = new ArrayList<Rocket>();
float xoff = 0.0; // à utiliser pour le noise qui gère le tempo
int switcher = 0;
float alea;
float rocketStroke = 2;
int rocketSpeed = 20;
int backgroundAlpha = 75;

float X1, Y1, X2, Y2;

void setup(){
  size(2120, 360);
  frameRate(25);
  background(0);
  smooth();
  
   setupGUI();
}
void draw(){
  fill(0, backgroundAlpha);
  noStroke();
  rect(0, 0, width, height);
  
  if(frameCount%tempo == 0){
    /*
    X1 = random(width);
    Y1 = random(height);
    X2 = random(width);
    Y2 = random(height);
    */
    
    X1 = alea(0);
    X2 = alea(0);
    
    if(X1 == -10 || X1 == width+10){
      Y1 = random(height);
    } 
    else{
      Y1 = alea(0);
    }
    
    if(X2 == -10 || X2 == width+10){
      Y2 = random(height);
    } 
    else{
      Y2 = alea(0);
    }
    
    rockets.add(new Rocket(X1, Y1, X2, Y2, random(rocketSpeed-10, rocketSpeed+10))); 
    
  }
  
  for(int i = 0 ; i < rockets.size() ; i++)
  {
    Rocket part = rockets.get(i);
    part.display();
  }
  
  drawGUI();
}


float alea(float v){

  int alea = floor(random(3));
  
  switch(alea){
    case 0:
      v = -10;
      break;
    case 1:
      v = width+10;
      break;
    case 2:
       v = random(width);
       break;
  }
  
  return v;
}

class Rocket {
   float x1, y1, x2, y2;
   float ax, ay, speed, iterate;  
   float px, py; // previous position
  
    Rocket (float X1, float Y1, float X2, float Y2, float Speed){
        x1 = X1;
        y1 = Y1;
        x2 = X2;
        y2 = Y2;
        
        ax = x1;
        ay = y1;
        
        px = ax;
        py = ay;
        
        speed = Speed;
        iterate = height/speed;
        
        println("new Rocket created");
    }
    void display(){
      
        if(x2 > x1) ax += (abs(x1-x2))/iterate;
        if(x1 > x2) ax -= (abs(x1-x2))/iterate;
        if(y2 > y1) ay += (abs(y1-y2))/iterate;
        if(y1 > y2) ay -= (abs(y1-y2))/iterate;
        /*
        fill(255);
        noStroke();
        ellipse(ax, ay, rocketStroke, rocketStroke);
        */
        
        stroke(255);
        strokeWeight(rocketStroke);
        line(px, py, ax, ay);
        
        px = ax;
        py = ay;
    } 
}