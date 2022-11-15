class Boid{
  float xpos, ypos, xvel, yvel;
  
  Boid(){
    xpos = random(0, displayWidth); //+random(0, 50);
    ypos = random(0, displayHeight); //+random(0, 50);
    xvel = 0;
    yvel = 0;
  }
  
  void DrawBoid(){
    circle(xpos, ypos, 10);
  }
  
  float XPos(){ 
    return xpos; 
  }
  void setXPos(float x){
    //println("reaching set xPos");
    xpos = x;
    //println(xpos);
    if(xpos > displayWidth) xpos = 0;
    if(xpos < 0) xpos = displayWidth;
  }
  
  float YPos(){ 
    return ypos; 
  }
  void setYPos(float y){
    ypos = y;
    if(ypos < 0) ypos = displayHeight;
    if(ypos > displayHeight) ypos = 0;

  }
  
  float XVel(){ 
    return xvel; 
  }
  //void setXVel(float x){
  //  velocity[0] = x;
  //}
  
  float YVel(){ 
    return yvel; 
  }
  //void setYVel(float y){
  //  velocity[1] = y;
  //}
  
  void AddToVelocity(float x, float y){
    //print("reached AddToVelocity function ");
    xvel += x;
    yvel += y;
    //println(xvel, yvel);
  }
}
