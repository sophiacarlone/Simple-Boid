//Sophia Carlone

int boid_count = 30;
Boid[] boids = new Boid[boid_count];

void setup(){ //initialize positions
  //positions should be random off screen
  fullScreen();
}

void draw(){ //draw boids
  //TODO: move this to make it more time efficient
  for(int boid = 0; boid < boid_count; boid++){ //I find this hilarious
    boids[boid].DrawBoid();
  } //can probably move this for loop later for time efficiency 
  NewPositions();
}

void NewPositions(){
  //note: processing does not have vectors and I am not as familar with processing
  //TODO: arrays used, find possible better container
  float[] a1 = new float[2];
  float[] a2 = new float[2];
  float[] a3 = new float[2];

  for(int boid = 0; boid < boid_count; boid++){
    rule1(boid);
    rule2(boid);
    a3 = rule3(boid);
    /*TODO: different possibilities here
    have functions return a pointer
    have setter and getters for the Boid class
    */
  }
}

void rule1(int boid){ //pass boid
  //Vector pcJ this would be better if this wasn't java based
  float xvel = 0;
  float yvel = 0;

  for(int i = 0; i < boid_count; i++){
    if(i != boid){
      xvel += boids[i].XPos();
      yvel += boids[i].YPos();
    }
  }

  xvel = xvel / boid_count-1;
  yvel = yvel / boid_count-1;

  xvel = xvel - boids[boid].XPos() / 100;
  yvel = yvel - boids[boid].XPos() / 100;
  
  boids[boid].AddToVelocity(xvel, yvel);

}

void rule2(int boid){ //pass boid
  //Vector c = 0;
  float delta_x = 0;
  float delta_y = 0; 

  for(int i = 0; i < boid_count; i++){
    if(i != boid){
      //TODO: clean this up bit by stuffing data into variables
      if ((boids[i].XPos() - boids[boid].XPos()) < 100){
        delta_x -= (boids[i].XPos() - boids[boid].XPos());
      }
      if ((boids[i].YPos() - boids[boid].YPos()) < 100){
        delta_y -= (boids[i].YPos() - boids[boid].YPos());
      }
    }
  }
  boids[boid].AddToVelocity(delta_x, delta_y);
}

void rule3(int boid){ //pass boid
  //Vector pvJ

  //  FOR EACH BOID b
  //    IF b != bJ THEN
  //      pvJ = pvJ + b.velocity
  //    END IF
  //  END

  //  pvJ = pvJ / N-1

  //  RETURN (pvJ - bJ.velocity) / 8
}
