int len = 100;
int screenX = 0;
int screenY = 0;
int startX = 0;
int offsetX = 0;
int startY = 0;
int offsetY = 0;

public void setup()
{
  textAlign(CENTER, CENTER);
  size(1000,1000);
}
public void draw()
{
  println(len);
  
  if(mousePressed){
    screenX=offsetX-(startX-mouseX);
    screenY=offsetY-(startY-mouseY);
  }
  else{
    screenX=offsetX;
    screenY=offsetY;
  }
  background(0,0,0);
  stroke(255,255,255);
  sierpinski(500+screenX,500+screenY,len);
  if(len > 1952257792){
    textSize(80);
    text("Integer Limit Reached",500,500);
  }
}

public void keyPressed()
{
  if(keyCode == 38){
    len = Math.max((int)(len*1.1),len+1);
  }
  if(keyCode == 40){
    len/=1.1;
  }
  if(keyCode == 32){
    len=100;
  }
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
  if(len<6){
    if(isOnScreen(x,y))
      triangle(x-len,y,x+len,y,x,y-2*len);
    return;
  }
  if(isWithinLengthOfScreen(x,y, len)){
    sierpinski(x-len/2,y+len/2,len/2);
    sierpinski(x+len/2,y+len/2,len/2);
    sierpinski(x,y-len/2,len/2);
  }
  return;
}

boolean isOnScreen(int x, int y){
  return((x>-50 && x<width+50)&&(y>-50 && y<height+50));
}

boolean isWithinLengthOfScreen(int x, int y, int len){
  return((x>-len && x<width+len)&&(y>-len && y<height+len));
}
