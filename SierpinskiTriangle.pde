int len = 100;
int screenX = 0;
int screenY = 0;
int startX = 0;
int offsetX = 0;
int startY = 0;
int offsetY = 0;

public void setup()
{
  size(1000,1000);
}
public void draw()
{
  if(mousePressed){
    System.out.println(offsetX);
    screenX=offsetX-(startX-mouseX);
    screenY=offsetY-(startY-mouseY);
  }
  else{
    screenX=offsetX;
    screenY=offsetY;
  }
  background(0,0,0);
  stroke(255,255,255);
  //triangle(400+screenX-len,600+screenY+len, 600+screenX+len,600+screenY+len, 500+screenX,400+screenY-len);
  sierpinski(500+screenX,500+screenY,len);
}
public void mouseWheel(MouseEvent event)
{
  len-=20*event.getCount();
}
public void mousePressed()
{
  startX=mouseX;
  startY=mouseY;
}
public void mouseReleased()
{
  offsetX-=startX-mouseX;
  offsetY-=startY-mouseY;
}

public void sierpinski(int x, int y, int len) 
{
  if(len<10){
    triangle(x-len,y,x+len,y,x,y-2*len);
    return;
  }
  sierpinski(x-len/2,y+len/2,len/2);
  sierpinski(x+len/2,y+len/2,len/2);
  sierpinski(x,y-len/2,len/2);  
}
