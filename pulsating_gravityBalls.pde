float koko = 0;
float refresh = 100;
ArrayList<Ball> balls = new ArrayList<Ball>();
float speed = 10;
PVector center = new PVector(0,0);
float g = 1;
float viiva = 255;
float colorB = 70;

void setup() {
  //size(600,600);
  fullScreen();
  background(0);
}

void draw() {
  
  noStroke();
  translate(width/2, height/2);
  //noCursor();  

  koko = map(millis()%4000, 0, 3999, -70, 70);  
  
  //taustaneliöfunktio. väri, origin, koko
  bgRect(color(0,10), 0, 0, 600);
  stroke(viiva);
  
  //värin r-komponentti vaihtuu koon mukana
  fill(map(abs(koko),-70,70,0,255), 200, colorB); 
  
  //ellipse(mouseX, mouseY, abs(koko), abs(koko));
  textSize(32);
  text(balls.size(), -290, -260); 
  
 
  for(int i=0; i<balls.size(); i++){
    
    //vektori, joka osoittaa pallosta keskustaan
    PVector gravity = PVector.sub(center, balls.get(i).GetLocation());
    
    //normalisoidaan aiempi ja kerrotaan painovoimalla => painovoimavektori
    gravity = PVector.mult(gravity.normalize(),g);
    
    balls.get(i).Update(gravity);  
    balls.get(i).make();
  }   
}

void mousePressed(){
  if(mouseButton == LEFT){
  balls.add(new Ball(random(20,50),map(mouseX,0,width,-width/2, width/2),map(mouseY, 0, height, -height/2, height/2), speed));
  }else{
    balls.clear();
    background(0);
  }
}


//värinhallinta (sinisen komponentin) hiiren rullalla
void mouseWheel(MouseEvent e){
  colorB += e.getCount()*20;
  if(colorB < 0) colorB = 0;
  if(colorB > 255) colorB = 255;
}


void bgRect(color c, float x, float y, float siz){
  fill(c);
  rectMode(CENTER);
  stroke(255);
  rect(x,y,siz,siz);
}
