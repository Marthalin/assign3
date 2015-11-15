//You should implement your assign3 here.
final int GAME_START = 0, GAME_RUN = 1;
final int E1 = 1, E2 = 2, E3 = 3;

PImage bg1,bg2,enemy,fighter,hp,treasure,start2,start1,end1,end2;
int bgX,treasureX,treasureY;
int blood;
int gameState;
int enemyState;
final int TOTAL_LIFE = 100;
int life;

float fighterX,fighterY;
float enemyX,enemyY;
float speedX = 3;
float speedY = 3;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
boolean isPlaying = false;

void setup () {
  size(640,480) ; 

  bg1 = loadImage("img/bg1.png");
  bg2 = loadImage("img/bg2.png");
  enemy = loadImage("img/enemy.png");
  fighter = loadImage("img/fighter.png");
  hp = loadImage("img/hp.png");
  treasure = loadImage("img/treasure.png");
  start2 = loadImage("img/start2.png");
  start1 = loadImage("img/start1.png");
  end2 = loadImage("img/end2.png");
  end1 = loadImage("img/end1.png");
  
  bgX = 0;
  enemyX = 0;
  enemyY = floor(random(40,400));
  fighterX = 580;
  fighterY = 240;
  treasureX = floor(random(20,590));
  treasureY = floor(random(40,440));
  blood = 40;
  life = 20;
  gameState = GAME_START;
  enemyState = E1;
}

void draw() {
  // your code
  background(0);
  
  switch (gameState){
    case GAME_START:
    image(start2,0,0);
    if(mouseX > 205 && mouseX <455 && mouseY >380 && mouseY < 410){
      image(start1,0,0);
      if(mousePressed){
        gameState = GAME_RUN;
      }
    }
    break;
    
    case GAME_RUN:
    image(bg1,bgX,0);
    image(bg2,bgX-bg1.width,0);
    image(bg1,bgX-bg1.width-bg2.width,0);
    bgX++;
    bgX%=(bg1.width+bg2.width);
    
    fill(255,0,0);
    rect(30,24,blood,20);
    blood = 2*life;
    image(hp,20,20);
    
    image(treasure,treasureX,treasureY);
    
    image(fighter,fighterX,fighterY);
    
    if (upPressed) {
        fighterY -= speedY;
      }
      if (downPressed) {
        fighterY += speedY;
      }
      if (leftPressed) {
        fighterX -= speedX;
      }
      if (rightPressed) {
        fighterX += speedX;
      }
      
      if(fighterX > 590){
        fighterX = 590;
      }
      if(fighterX < 0){
        fighterX = 0;
      }
      if(fighterY > 430){
        fighterY = 430;
      }
      if(fighterY < 0){
        fighterY = 0;
      }
    
    float spacing = enemy.width;
    switch (enemyState){
      case E1 :
      enemyX=enemyX+4;
      if(enemyX<640+5*spacing){
        for(int i=0; i<5; i++){
          float x = enemyX - i*spacing;
          float y = enemyY;
          image(enemy,x,y);
        }
      }else{
        enemyX = 0;
        enemyY = random(40,300);
        enemyState = 2;
      }
      break;
      
      case E2:
      enemyX=enemyX+4;
      if (enemyX < 640 + 5*spacing){
        for(int j=0; j<5; j++){
          float x = enemyX - j*spacing;
          float y = enemyY + 0.5*j*spacing;
          image(enemy,x,y);
       }
       }else{
          enemyX = 0;
          enemyY = random(40,250);
          enemyState = 3;
       }
      break;
      
      case E3 :
      enemyX=enemyX+4;
      if (enemyX < 640 + 5*spacing){
        for(int i=0; i<5; i++){
          float x = enemyX - i*spacing;
          float y = enemyY - abs(2-i)*spacing + 4*spacing;
          image(enemy,x,y);
        for(int j=0; j<5; j++){
          float x2 = enemyX - j*spacing;
          float y2 = enemyY + abs(2-j)*spacing;
          image(enemy,x2,y2);
          }
        }
      }else{
        enemyX = 0;
        enemyY = random(40,400);
        enemyState = 1;
      }
      break;
      
      }
    break;
  }
}  

void keyPressed(){
  if (key == CODED) { 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}


void keyReleased(){
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}
