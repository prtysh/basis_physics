Particle[] particles;
int cluster;

void setup(){
  size(420,420);
  background(51);
  cluster = 20;
  particles = new Particle[cluster];
  for (int i = 0; i < cluster; i++){
    float x = random(width);
    float y = random(height);
    
    particles[i] = new Particle(x,y);
  }
}


void draw(){
  background(51);
  for (int i = 0; i < cluster; i++){
    particles[i].display();
    particles[i].update();
    if(particles[i].wallCheck()){
      particles[i].wallCollision();
    }
  }
  for (int i = 0; i < cluster; i++){
    for (int j = i; j < cluster; j++){
      if (particles[i].distance(particles[j])){
        particles[i].particleCollision(particles[j]);
      }
    }
  }
}
