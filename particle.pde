class Particle {
  PVector p, v, a;
  float radius;
  Particle (float x, float y) {
    p = new PVector (x,y);
    v = new PVector (random(-1,1), random(-1,1));
    radius = random(4,10);
  }
  
  boolean distance(Particle other){
    return (this.p.dist(other.p) < this.radius + other.radius); 
  }
  
  void particleCollision (Particle other){
    float tempx, tempy;
    tempx = this.v.x;
    tempy = this.v.y;
    this.v.x = other.v.x;
    this.v.y = other.v.y;
    other.v.x = tempx;
    other.v.y = tempy;
  }
  
  boolean wallCheck(){
    return (p.x > width || p.x < 0 || p.y > height || p.y < 0);
  }
  
  void wallCollision(){
    if (p.x > width || p.x < 0){
      v.x = -v.x;
    }
    if (p.y > height || p.y < 0){
      v.y = -v.y;
    }
  }
  
  void update(){
    p.x = p.x + v.x;
    p.y = p.y + v.y;
  }
  
  void display(){
    ellipse(p.x,p.y,2*radius,2*radius);
  }
}
