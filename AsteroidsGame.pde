SpaceShip space = new SpaceShip ();
Star [] stars = new Star[300];
ArrayList <Asteroid> rock= new ArrayList <Asteroid> ();
ArrayList <Bullet> laser=new ArrayList <Bullet> ();

public void setup() 
{
  size(800, 700);
 for(int i=0; i<stars.length; i++)
 {
  stars[i]=new Star();
 }
for(int i=1; i<15; i++)
 {
  rock.add(new Asteroid());
 }
}
public void draw() 
{
  background(0);
 for(int i=0; i<stars.length; i++)
   {
    stars[i].movingStars();
    stars[i].draw();
   }
  for(int i= 1; i<rock.size(); i++)
   {
    rock.get(i).move();
    rock.get(i).show();
    if(dist(rock.get(i).getX(), rock.get(i).getY(), space.getX(), space.getY())<25){rock.remove(i);}
       for(int l=0; l<laser.size();l++)
         {
           if(dist(rock.get(i).getX(), rock.get(i).getY(), laser.get(l).getX(), laser.get(l).getY())<25)
            {
              rock.remove(i);
              laser.remove(l);
            }
         }
   }
  for(int i=0; i<laser.size(); i++)
   {
    laser.get(i).show();
    laser.get(i).move();
   }
  space.show();
  space.move();
}
public void keyPressed()
{
  if(key=='0')
  {
    space.setX((int)(Math.random()*700));
    space.setY((int)(Math.random()*700));
    space.setPointDirection((int)(Math.random()*360));
    space.setDirectionX(0);
    space.setDirectionY(0);
  }
  if(key==CODED && keyCode==UP){space.accelerate(.5);}
  if(key==CODED && keyCode==DOWN){space.accelerate(-.5);}
  if(key==CODED && keyCode==LEFT){space.rotate(-15);}
  if(key==CODED && keyCode==RIGHT){space.rotate(15);}
  if(key=='8'){laser.add(new Bullet(space));}
}
class Star
{
  private int starX, starY, starColor;
  private boolean play;
  public Star()
  {
    starX=(int)(Math.random()*800);
    starY=(int)(Math.random()*700);
    starColor= color(237, 240, 127);
    play=true;
  }
  public void movingStars()
  {
    if(play==true)
    {
     starY++;
     if(starY>690)
     {
      starX=(int)(Math.random()*820);
      starY=(int)(Math.random()*10);
     }
    }
  }
  public void draw()
  {
    fill(starColor);
    stroke(starColor);
    ellipse(starX, starY, 2, 2);
  }
}
class SpaceShip extends Floater  
{   
   public SpaceShip ()
   {
    //shape
    corners=14;
    xCorners = new int[corners]; 
    yCorners = new int[corners]; 
    xCorners[0] = 16;
    yCorners[0] = 0;
    xCorners[1] = 12;
    yCorners[1] = -4;
    xCorners[2] = 1;
    yCorners[2] = -7;
    xCorners[3] = -7;
    yCorners[3] = -9;
    xCorners[4] = -15;
    yCorners[4] = -14;
    xCorners[5] = -23;
    yCorners[5] = -14;
    xCorners[6] = -15;
    yCorners[6] = -4;
    xCorners[7] = -16;
    yCorners[7] = 0;
    xCorners[8] = -15;
    yCorners[8] = 4;
    xCorners[9] = -23;
    yCorners[9] = 14;
    xCorners[10] = -15;
    yCorners[10] = 14;
    xCorners[11] = -7;
    yCorners[11] = 9;
    xCorners[12] = 1;
    yCorners[12] = 7;
    xCorners[13] = 12;
    yCorners[13] = 4;

    //initialize
    myColor= color(127, 18, 33);
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
class Asteroid extends Floater
{
  private int myRotSpeed;
  public Asteroid()
  {
    corners=12;
    xCorners= new int [corners];
    yCorners= new int [corners];
    xCorners[0]=16;
    yCorners[0]=0;
    xCorners[1]=14;
    yCorners[1]=-9;
    xCorners[2]=9;
    yCorners[2]=-14;
    xCorners[3]=0;
    yCorners[3]=-16;
    xCorners[4]=-9;
    yCorners[4]=-14;
    xCorners[5]=-14;
    yCorners[5]=-9;
    xCorners[6]=-16;
    yCorners[6]=0;
    xCorners[7]=-14;
    yCorners[7]=9;
    xCorners[8]=-9;
    yCorners[8]=14;
    xCorners[9]=0;
    yCorners[9]=16;
    xCorners[10]=9;
    yCorners[10]=14;
    xCorners[11]=14;
    yCorners[11]=9;

    myColor= color(104, 103, 103);
    myCenterX=(int)(Math.random()*800);
    myCenterY=(int)(Math.random()*700);
    setDirectionX((int)(Math.random()*5)-2);
    setDirectionY((int)(Math.random()*5)-2);
    myPointDirection=0;
    myRotSpeed=((int)(Math.random()*10)-1);
  }
  public void move()
  {
    rotate(myRotSpeed);
    super.move();
    if(myCenterX>-1)
    {
      myCenterX=myCenterX+2;
      myCenterY++;
    }
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
class Bullet extends Floater
{
  public Bullet(SpaceShip theShip)
  {
    myColor= color(240,191,127);
    myCenterX=theShip.getX();
    myCenterY=theShip.getY();
    myPointDirection=theShip.getPointDirection();
    double dRadians =myPointDirection*(Math.PI/180);
    setDirectionX(5 * Math.cos(dRadians) +  myDirectionX);
    setDirectionY(5 * Math.sin(dRadians) +  myDirectionY);
  }
  public void show()
  {
    stroke(myColor);
    fill(myColor);
    ellipse((float)myCenterX, (float)myCenterY, 10, 5);
  }
  public void move()
  {
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;   
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
  protected int corners;  
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

