//Sophia Carlone

float Dt = 0.00001;
//float slow = 1000.0;
float R = 0.0; //radius for collision avoidance / separation
int boid_count = 50;
Boid[] boids = new Boid[boid_count]; //learning moment: these objects will be set as null

void setup(){ //initialize positions
  //TODO: positions should be random off screen
  fullScreen();
  for(int boid = 0; boid < boid_count; boid++){ //I find this hilarious
    boids[boid] = new Boid();
  }
  println("start");
}

void draw(){ //draw boids
  //TODO: move this to make it more time efficient
  background(0);
  for(int boid = 0; boid < boid_count; boid++){ //I find this hilarious
    boids[boid].DrawBoid();
  } //can probably move this for loop later for time efficiency 
  NewPositions();
}
  
void NewPositions(){
  //note: processing does not have vectors and I am not as familar with processing
  //TODO: arrays used, find possible better container
  //println("reached NewPositions function ");
  for(int boid = 0; boid < boid_count; boid++){
    rule1(boid);
    rule2(boid);
    rule3(boid);
    /*TODO: different possibilities here
    have functions return a pointer
    have setter and getters for the Boid class
    */
    boids[boid].setXPos(boids[boid].XPos() + boids[boid].XVel());
    boids[boid].setYPos(boids[boid].YPos() + boids[boid].YVel());
  }
}

void rule1(int boid){ //pass boid
  //print("reached rule 1 ");
  
  float xpos = 0;
  float ypos = 0;
  float xacc = 0;
  float yacc = 0;

  for(int i = 0; i < boid_count; i++){
    if(i != boid){
      xpos += boids[i].XPos();
      ypos += boids[i].YPos();
    }
  }
  
  xpos = xpos / (float)(boid_count-1);
  ypos = ypos / (float)(boid_count-1);
  
  xacc = (xpos - boids[boid].XPos());
  yacc = (ypos - boids[boid].XPos());
  
  boids[boid].AddToVelocity(xacc * Dt, yacc * Dt);

}

void rule2(int boid){ //pass boid
  //Vector c = 0;
  //print("reached rule 2 ");
  float delta_x = 0;
  float delta_y = 0; 

  for(int i = 0; i < boid_count; i++){
    if(i != boid){
      //TODO: clean this up bit by stuffing data into variables
      if (abs(boids[i].XPos() - boids[boid].XPos()) < R){
        delta_x -= (boids[i].XPos() - boids[boid].XPos());
      }
      if (abs(boids[i].YPos() - boids[boid].YPos()) < R){
        delta_y -= (boids[i].YPos() - boids[boid].YPos());
      } //TODO 50 -> R
    }
  }
  delta_x *= Dt;
  delta_y *= Dt;
  boids[boid].AddToVelocity(delta_x, delta_y);
}

void rule3(int boid){ //pass boid
  //Vector pvJ
  //print("reached rule 3 ");
  float pvx = 0.0; //precieved velocity
  float pvy = 0.0; 

  for(int i = 0; i < boid_count; i++){
    if(i != boid){
      pvx += boids[i].XPos();
      pvy += boids[i].YPos();
    }
  }

  pvx = pvx / float(boid_count-1);
  pvy = pvy / float(boid_count-1);
  
  pvx = (pvx - boids[boid].XVel()) * Dt;
  pvy = (pvy - boids[boid].YVel()) * Dt;

  boids[boid].AddToVelocity(pvx, pvy);  
  println(boid);
}
