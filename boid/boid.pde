//Sophia Carlone

//float getDirection(int (&a)[270]);

int step = 2;
int x1 = 0;
int y1 = 310;
int x2 = 10;
int y2 = 300;
int x3 = 0;
int y3 = 290;

void setup(){
  size(600, 600);
  int[] a = {1, 0, 0, 0, 1, 1};
  if (getDirection(&a) == 2) background(0);
}

void draw(){
  background(100);
  triangle(x1, y1, x2, y2, x3, y3); //our first entity
  rect(400, 250, 50, 100); //our first obstacle
  //not thinking about efficiency here, just want animation
  x1 += step;
  x2 += step;
  x3 += step;
}

/*direction preference function
** a is an array of 0's and 1's. 
** 0 = no object detected in direction
** 1 = object detected in direction
** returns best possible direction
*/

float getDirection(int (&a)[270]){ //270 for degress of sight
  int leftmost = 0;
  int rightmost = 0;
  float mid = 0; //will be center of window (can change to int later)
  int count = 0;
  float max = 0;
  for(int i = 0; i < 270; i++){
    while(a[i] && i < 270) i++;
    if(i = 270) break;
    leftmost = i;
    count++;
    for(int j = i + 1; j < 271; j++){
      if(!a[j]) count++;
      else rightmost = j;
    }
    if(count > max) mid = rightmost+leftmost/2;
    i = j;
    count = 0;
  }
  return max;
}
//there is an end case we have to add
