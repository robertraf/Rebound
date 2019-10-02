import javax.swing.JOptionPane; 
import processing.sound.*;
SoundFile ding;
float x;
float y;
float speed;
float angle;
float xSpeed;
float ySpeed;
float accel = -.3;
Paddle left;
Paddle right;
int r=5;
String ganador;
boolean primeraTirada=true;
boolean isGameOver=false;
boolean isIntro=true;
boolean isPlaying=false;
int v_actual1=0;
int v_actual2=0;
int difPuntos=0;
Escena escena;
void setup() {
  escena= new Escena();
  size(1200, 700);
  background(0);
  smooth();
  noStroke();
  angle = 45;
  speed = 5;
  xSpeed = speed * cos(radians(angle));
  ySpeed = speed * sin(radians(angle));
  ding = new SoundFile(this,"ding.mp3");
}

void draw() {
  background(0);
  //------------------------------
  if (escena.tablero.left.jugador.getPuntosconsecutivos()>= 3 ) {
      if (x<= width/2) {
        accel=-.1;
        textSize(40);
        stroke(255,0,0);
        text("Ventaja",40,150);
        println("Ventaja Izquierda");
      } else {
        accel =-.3;
        println("Normalidad");
      }
    } else if (escena.tablero.right.jugador.getPuntosconsecutivos()>=3  ) {
      if (x>= width/2) {
        accel=-.1;
        textSize(40);
        stroke(255,0,0);
        text("Ventaja",width-80,150);
        println("Ventaja derecha");
      }else{
      accel =-.3;
      println("Normalidad");
      }
    } else {
      accel=-.3;
      println("Normalidad");
    }

  //--------------------------
  escena.play();
  x += xSpeed;
  ySpeed += accel;
  y -= ySpeed;  
  //------------------------------------ 
  if (y<5) {
    ySpeed *=-1;
  }
  //------------------------------------------- 
  //colisión de la pelota con las paletas
  if (isPlaying) {
    if (y>height-10 && x>escena.tablero.left.x && x<escena.tablero.left.x+100 ) {
      if (y > escena.tablero.left.y) {
        float diff = x - escena.tablero.left.x;
        println("Valor de x:"+x);
        println("Valor de y:"+y);
        float valor = map(diff, 0, escena.tablero.left.w, 0, 100);
        println(valor);
        if ((valor>=0 && valor<=25)) {
          xSpeed*=1;
          ySpeed*=-1;
          angle=45;
        } else if (valor>25 && valor<50) {
          xSpeed*=-1;
          ySpeed*=-1;
          angle=60;
        } else if (valor>=50 && valor<=75) {
          xSpeed*=-1;
          ySpeed*=-1;
          angle=60;
        } else if (valor > 75 && valor <= 100) {
          xSpeed*=-1;
          ySpeed*=-1;
          angle=45;
        }
        y = escena.tablero.left.y+5;
      }
    }
    //-------------------------------------------------
    if (y>height-10 && x>escena.tablero.right.x && x<escena.tablero.right.x+100 ) {
      if (y > escena.tablero.right.y) {
        float diff = x - escena.tablero.right.x;
        println("Valor de x:"+x);
        println("Valor de y:"+y);
        float valor = map(diff, 0, escena.tablero.right.w, 0, 100);
        println(valor);
        if ((valor>=0 && valor<=25) ) {
          xSpeed*=-1;
          ySpeed*=-1;
        } else if (valor>25 && valor<=50) {
          xSpeed*=-1;
          ySpeed*=-1;
        } else if (valor>50 && valor<75) {
          xSpeed*=-1;
          ySpeed*=-1;
        } else if (valor >= 75 && valor <= 100) {
          xSpeed*=1;
          ySpeed*=-1;
        }
        y = escena.tablero.right.y+5;
      }
    }
  }
  //---------------------------------------------------
}

void keyReleased() {
  escena.tablero.left.move(0);
  escena.tablero.right.move(0);
}

void keyPressed() {
  if (key == 'a') {
    escena.tablero.left.move(-10);
  } else if (key == 'd') {
    escena.tablero.left.move(10);
  }

  if (keyCode == LEFT) {
    escena.tablero.right.move(-10);
  } else if (keyCode == RIGHT) {
    escena.tablero.right.move(10);
  }
}


void mousePressed() {
  if (isGameOver) {
    if (mouseX>=width/2-39 && mouseX<=width/2+39) {
      if (mouseY<=height/2+39 && mouseY>=height/2-39) {
        //println("NOS CANCELARAN EL PERIODO");
        isGameOver=false;
        isPlaying=false;
        isIntro=true;
        escena.play();
      }
    }
  }

  if (isIntro) {
    if (mouseX>=width/2-40 && mouseX<=width/2+40) {
      if (mouseY<=height/2+40 && mouseY>=height/2-40) {
        //println("NOS CANCELARAN EL PERIODO");
        isGameOver=false;
        isPlaying=true;
        isIntro=false;
        escena.play();
      }
    }
  }
}