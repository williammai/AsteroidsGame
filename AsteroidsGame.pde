//your variable declarations here
public void setup() 
{
  size(600,600);
}
public void draw() 
{
  //your code here
}
class SpaceShip extends Floater  
{   
    public SpaceShip(){
      corners = 5;
      int[] xS = {-6,6,0,0,11};
      int[] yS = {4,-4,-7,7,0};
      xCorners = xS;
      yCorners = yS;


    }  
      public void setX(int x) {myCenterX = x;}
      public int getX() {return (int)(myCenterX);}
      public void setY(int y) {myCenterY = y;}
      public int getY() {return (int)(myCenterY);}
      public void setDirectionX(double x) {myDirectionX = x;}
      public double getDirectionX(double x) {return myDirectionX;}
      public void setDirectionY(double y) {myDirectionY = y;}
      public double getDirectionY(double y) {return myDirectionY;}
      public void setPointDirection(int degrees) {myPointDirection = degrees;}
      public double getPointDirection(int degrees) {return myPointDirection;}
    
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
  public void setX(int x);  
  public int getX();  
  public void setY(int y);   
  public int getY();  
  public void setDirectionX(double x);
  public double getDirectionX();
  public void setDirectionY(double y);  
  public double getDirectionY(); 
  public void setPointDirection(int degrees); 
  public double getPointDirection();

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
  public void move ()   //move the floater in the current direction of travel
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

