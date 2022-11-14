class Boid{
  float[] position = new float[2]; //(x, y)
  float[] velocity = new float[2]; //(x, y)
  
  void Boid(){
    position[0] = displayWidth+random(0, 50);
    position[1] = displayHeight+random(0, 50);
    velocity[0] = 0;
    velocity[1] = 0;
  }
  
  void DrawBoid(){
    circle(position[0], position[1], 10);
  }
  
  float XPos(){ 
    return position[0]; 
  }
  void setXPos(float x){
    position[0] = x;
  }
  
  float YPos(){ 
    return position[1]; 
  }
  void setYPos(float y){
    position[1] = y;
  }
  
  float XVel(){ 
    return velocity[0]; 
  }
  void setXVel(float x){
    velocity[0] = x;
  }
  
  float YVel(){ 
    return velocity[1]; 
  }
  void setYVel(float y){
    velocity[1] = y;
  }
  
  void AddToVelocity(float x, float y){
    velocity[0] += x;
    velocity[1] += y;
  }
}
