Particle[] particles;
void setup()
{
   size(500, 500);
   background(0);
   colorMode(HSB, 100);
   particles = new Particle[100];
   particles[0] = new OddballParticle();
   particles[1] = new JumboParticle();
   for(int i = 2; i < particles.length; i++)
   {
     particles[i] = new NormalParticle();
   }
}
void draw()
{
   fill(0, 25);
   rect(-1, -1, 501, 501);
   for(int i = 0; i < particles.length; i++)
   {
     particles[i].show();
     particles[i].move();
   }
}
class NormalParticle implements Particle
{
   double x, y, speed, theta;
   int c, d; //color
   NormalParticle()
   {
     x = 250;
     y = 250;
     speed = Math.random() * 3 + 1;
     theta = Math.random() * (2 * Math.PI);
     c = (int)(Math.random() * 100) + 1;
   }
   public void move()
   {
     x = x + Math.cos(theta) * speed;
     y = y + Math.sin(theta) * speed;
     if(mousePressed == true)
     {
       x = mouseX;
       y = mouseY;
     }
     theta = theta + .02;
   }
   public void show()
   {
     fill(c, 70, 90);
     ellipse((float)x, (float)y, 10, 10);
   }
}
interface Particle
{
  public void show();
  public void move();
}
class OddballParticle implements Particle
{
   double x, y;
   OddballParticle()
   {
     x = 250;
     y = 250;
   }
  public void move()
  {
     x = x + Math.random()*5 - 2;
     y = y + Math.random()*5 - 2;
  }
  public void show()
  {
    fill(0, 0, 100);
    ellipse((float)x, (float)y, 15, 15);
  }
}
class JumboParticle extends NormalParticle
{
   JumboParticle()
   {
   }
   public void show()
   {
     fill(c, 70, 90);
     ellipse((float)x, (float)y, 30, 30);
   }
}
