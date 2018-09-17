//size(800,600);
//background(0);
//background(255, 0, 0); //red
//fill(0, 255, 0);
//line(10,10,50,100);
//rect(200, 300, 100, 50);
//fill(0, 0, 255);
//ellipse(300, 400, 20, 20);
//fill(255, 0, 0);
//rect(200, 200, 200, 200);

//PVector vec1 = new PVector();
//vec1.x = 200;
//vec1.y = 300;
PVector vec1 = new PVector(100, 0);
PVector vec2 = new PVector(-2, 1);

//vec1.add(vec2);
//vec1.sub(vec2);

//vec1.mult(10);
//vec1.div(10);
//vec1.normalize(); // length => 1

//PVector added = vec1.add(vec2); //vec1 változik, az added csak referencia

//PVector added = vec1.copy().add(vec2); //
//PVector added = vec1.add(vec2).copy(); // nem ugyanaz
//added.x = -10;

//System.out.println(vec1);
//System.out.println(added);


PVector pos = new PVector(400, 300);
PVector vel = new PVector(1, 1);

float speed = 20;
int last_time;

void setup(){ //azt érdemes ide írni ami egyszer fut le
  size(800, 600);
  last_time = millis();
}

int radius = 10;
float mouse_radius = 10.0;
void draw() {
  update();
  background(0);
  ellipse (pos.x, pos.y, 10, radius);
  
  mouse_radius = 50 + 30 * sin(millis() / 200.0f);
  ellipse (mouseX, mouseY, 2*mouse_radius,  2*mouse_radius);
 
}

void update () {
  float delta_time = (millis() - last_time) / 100.0f;
  last_time = millis();
  pos.add(vel.copy().mult(delta_time * speed)); //v = s/t   //ha a copy nem lenne akkor folyamatosan gyorsulna
  //width; 
  //height;
  
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
  
  //fill(255, 0, 0);

  //egérnek ütközés
  if((pos.x + radius < mouseX + mouse_radius) && (pos.x + radius > mouseX - mouse_radius)){
     vel.x *= -1;
  }
  
}


//mouseX
//mouseY
