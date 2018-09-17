
PVector pos = new PVector(400, 300);
PVector vel = new PVector(1, 1);

float speed = 20;
int last_time;

void setup(){ //azt érdemes ide írni ami egyszer fut le
  size(800, 600);
  last_time = millis();
}

int radius = 10;
float mouse_radius = 10;
void draw() {
  update();
  background(0);
  ellipse (pos.x, pos.y, 2*radius, 2*radius);
  ellipse (mouseX, mouseY, 2*mouse_radius,  2*mouse_radius);
}

void update () {
  float delta_time = (millis() - last_time) / 100.0f;
  last_time = millis();
  pos.add(vel.copy().mult(delta_time * speed)); //v = s/t   //ha a copy nem lenne akkor folyamatosan gyorsulna
  
  if(pos.y > height-radius){
    pos.y =  height-radius;
    vel.y *= -1;
    background(0);
  }
  
  if(pos.x > width-radius){
    pos.x= width-radius;
    vel.x *= -1;
    background(0);
  }
  
  if(pos.x < radius){
    pos.x = radius;
    vel.x *= -1;
    background(0);
  }
  
  if(pos.y < radius){
    pos.y = radius;
    vel.y *= -1;
    background(0);
  }

  //egérnek ütközés
  mouse_radius = 50 + 30 * sin(millis() / 200.0f);                     //millis: a milisecundummok száma a program kezdete óta
                                                                       //200.0f: hogy nem double hanem float legyen
  
  PVector mouse_pos = new PVector(mouseX, mouseY);  
  PVector diff = pos.copy().sub(mouse_pos);                            //a sub kivon két vektort egymásból
  
  if((diff.mag()<mouse_radius + radius)){                              //mag: length of the vector
    pos = mouse_pos.add( diff.normalize().mult(mouse_radius +radius)); //normalize: egységvektorrá alakít
                                                                       //mult: skalárral szoroz
    vel = diff.normalize();
  }
}
