SpaceShip space = new SpaceShip ();
Star [] stars = new Star[300];

public void setup() 
{
  size(800, 700);
 for(int i=0; i<stars.length; i++)
 {
  stars[i]=new Star();
 }
}
public void draw() 
{
  background(8, 18, 81);

  space.show();
  space.move();

  for(int i=0; i<stars.length; i++)
   {
    
    stars[i].movingStars();
    stars[i].show();

   }
}
public void keyPressed()
{
  if(key== '0')
  {
    space.setX((int)(Math.random()*700));
    space.setY((int)(Math.random()*700));
    space.setPointDirection((int)(Math.random()*360));
  }
  if(key==CODED && keyCode==UP){space.accelerate(.5);}
  if(key==CODED && keyCode==DOWN){space.accelerate(-.5);}
  if(key==CODED && keyCode==LEFT){space.rotate(-15);}
  if(key==CODED && keyCode==RIGHT){space.rotate(15);}
}
class Star
{
  private int starX, starY, starColor;
  private boolean play;
  public Star()
  {
    starX=(int)(Math.random()*800);
    starY=(int)(Math.random()*700);
    starColor=color(249, 249, 64);
    play=true;
  }
  public void movingStars()
  {
    if(play==true)
    {
     //myX=myX+((int)(Math.random()*800)-400);
     starY++;
     if(starY>690)
     {
      starX=(int)(Math.random()*820);
      starY=(int)(Math.random()*10);
     }
    }
  }
  public void show()
  {
    fill(starColor);
    ellipse(starX, starY, 2, 2);
  }
}
class SpaceShip extends Floater  
{   
   public SpaceShip ()
   {
    //shape
    corners=4;
    xCorners = new int[corners]; 
    yCorners = new int[corners]; 
    xCorners[0] = 36;
    yCorners[0] = 0;
    xCorners[1] = 0;
    yCorners[1] = 12;
    xCorners[2] = 12;
    yCorners[2] = 0;
    xCorners[3] = 0;
    yCorners[3] = -12;

    //initialize
    myColor= color(255);
    myCenterX=350;
    myCenterY=350;
    setDirectionX(0);
    setDirectionY(0);
    myPointDirection=0;
    } 

   public void setX(int x){myCenterX=x;}
   public int getX(){return (int)myCenterX;}
   public void setY(int y){myCenterY=y;}   
   public int getY(){return (int)myCenterY;}   
   public void setDirectionX(double x){myDirectionX=x;}   
   public double getDirectionX(){return myDirectionX;}   
   public void setDirectionY(double y){myDirectionY=y;;}   
   public double getDirectionY(){return myDirectionY;}   
   public void setPointDirection(int degrees){myPointDirection=degrees;}   
   public double getPointDirection(){return myPointDirection;}     

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

