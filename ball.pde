class Ball {
  
  float size;
  float lastSize;
  float medianSize;
  PVector location;
  PVector speed;
  PVector accel = new PVector(0,0);
  float max;
  

  public Ball(float koko, float x, float y, float s){
    size = koko+1;
    lastSize = koko;
    medianSize = koko;
    location = new PVector(x,y);
    speed = new PVector(random(-s,s), random(-s,s));
    max = speed.mag();
  }
  
  PVector GetLocation(){
    return this.location;
  }
  
  void make(){//huomaa iso alkukirjain
    ellipse(location.x, location.y, size, size);
  }
  
  void Update(PVector force){
    speed.add(force);
    location.add(speed);
    
    //koon kasvatus
    if(size - lastSize < 0){
      lastSize = size;
      size--;
    }else if(size - lastSize > 0){
      lastSize = size;
      size++;
    }
    
    //koonmuutoksen rajat
    if(size > medianSize*2){
      lastSize = size + 1;
    }else if(size < medianSize / 4){
      lastSize = size -1;
    }
    
    /*
    //käännetään nopeuden suunta kun mennään tietyn etäisyyden päähän origosta(neliö)
    if(abs(location.x) > 300){
      speed = new PVector(speed.x*-1, speed.y);
    }else if(abs(location.y) > 300){
      speed = new PVector(speed.x, speed.y*-1);
    }
    
    //käännetään nopeuden suuntaa kun saavutetaan tietynkokoisen ympyrän kehä
    if(sqrt(pow(location.x,2) + pow(location.y,2)) > 300){
      
      float angle = PVector.angleBetween(new PVector(0,0).sub(location), speed);
      speed.rotate(angle*4);
    }
    */
  }
}
