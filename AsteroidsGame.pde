SpaceShip boob = new SpaceShip();
Star[] tiger = new Star[200];
int r;
int g;
int b;
int o;
//Asteroid[] huge = new Asteroid[18];
boolean alive = true;

ArrayList <Asteroid> huge = new ArrayList <Asteroid>();
ArrayList <Bullet> bomb = new ArrayList <Bullet>();
 

public void setup() 

{
  size(600,600);
  boob.setX(300);
  boob.setY(300);
   for(int i = 0; i<tiger.length;i++){
    tiger[i] = new Star((int)(Math.random()*700),(int)(Math.random()*700));
   }
for (int i=0; i<10; i++){
 huge.add(new Asteroid());
 huge.get(i).setX((int)(Math.random()*800));
 huge.get(i).setY((int)(Math.random()*800));
 huge.get(i).setDirectionX((int)(Math.random()*20)-10);
 huge.get(i).setDirectionY((int)(Math.random()*20)-10);
}
   
}
public void draw() 
{
  if(alive == true){

  
  background(0);
  boob.show();
  boob.move();
  for (int i = 0; i<huge.size();i++){
    huge.get(i).move();
    huge.get(i).show();
  }
  for (int i = 0; i<100;i++){
    tiger[i].show1();
  }

for (int i = 0; i<huge.size();i++){
 
    if(dist(boob.getX(), boob.getY(),huge.get(i).getX(),huge.get(i).getY())<50){
      alive = false;
    }

  for(int j=0;j<bomb.size();j++){

  
    if(dist(bomb.get(j).getX(), bomb.get(j).getY(),huge.get(i).getX(),huge.get(i).getY())<50){
      huge.remove(i); 
      bomb.remove(j);
      break;
    }
  }
  }
  for(int i = 0; i<bomb.size(); i++){
    bomb.get(i).show();
    bomb.get(i).move();
  }

  r = r  +1;
  g = g+1;
  b = b+1;
  o = o+1;
}

if(alive == false){
  background(0);
  text("LOSER",300,300,150,150);
}

}
public void keyPressed(){
 if (keyCode == LEFT)
 {
  boob.rotate(-15);
 }
 if(keyCode == RIGHT)
 {
  boob.rotate(15);
 }
 if(keyCode == UP)
 {
  boob.accelerate(0.2);
 }
 if(keyCode == 'H')
 {
  boob.setX((int)(Math.random()*600));
  boob.setY((int)(Math.random()*600));
  boob.setDirectionX(0);
  boob.setDirectionY(0);
  boob.setPointDirection((int)(boob.getPointDirection()*Math.random()*7)-3);
}
if(keyCode == 32)
{
  bomb.add(new Bullet(boob));                         
}
}
class SpaceShip extends Floater  
{   
    public SpaceShip(){
    corners = 4;
    int[] xS = {-5,3,-5,-2,-5};
    int[] yS = {-5,0,5,0,-5};
    xCorners = xS;
    yCorners = yS;
    myColor = 255;


    }  
      public void setX(int x) {myCenterX = x;}
      public int getX() {return (int)(myCenterX);}
      public void setY(int y) {myCenterY = y;}
      public int getY() {return (int)(myCenterY);}
      public void setDirectionX(double x) {myDirectionX = x;}
      public double getDirectionX() {return myDirectionX;}
      public void setDirectionY(double y) {myDirectionY = y;}
      public double getDirectionY() {return myDirectionY;}
      public void setPointDirection(int degrees) {myPointDirection = degrees;}
      public double getPointDirection() {return myPointDirection;}

   
}

class Star
{
 private int myX;
 private int myY;
 
 public Star(int x, int y){
  myX = x;
  myY = y;
 } 
 public void show1(){
  fill(r,g,b,o);
  ellipse(myX,myY,5,5);
 } 
}

class Asteroid extends Floater 
{
  private int rosalina = (int)((Math.random()*7)-3);
  public Asteroid(){
  corners = 5;
     int[] xS = {-16,0,24,24,-8};
     int[] yS = {0,16,0,-8,-16};
     xCorners = xS;
     yCorners = yS;
      myColor = color(160,82,45);
    }


    public void setX(int x) {myCenterX = x;}
      public int getX() {return (int)(myCenterX);}
      public void setY(int y) {myCenterY = y;}
      public int getY() {return (int)(myCenterY);}
      public void setDirectionX(double x) {myDirectionX = x;}
      public double getDirectionX() {return myDirectionX;}
      public void setDirectionY(double y) {myDirectionY = y;}
      public double getDirectionY() {return myDirectionY;}
      public void setPointDirection(int degrees) {myPointDirection = degrees;}
      public double getPointDirection() {return myPointDirection;}

    void move(){
      rotate(rosalina);
      super.move();
    }
}

  
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();  
  abstract public void setY(int y);   
  abstract public int getY();  
  abstract public void setDirectionX(double x);
  abstract public double getDirectionX();
  abstract public void setDirectionY(double y);  
  abstract public double getDirectionY(); 
  abstract public void setPointDirection(int degrees); 
  abstract public double getPointDirection();

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

