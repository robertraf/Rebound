class Pelota {

  void reset() {
    x = width/2;
    y = height/4;
    float angle = -5*PI/4;
    //angle = 0;

    //Velocidades de Salida (ANCHURA)
    xSpeed = 5 * cos(angle);
    ySpeed = 1 * sin(angle);

    if (primeraTirada) {
      if (random(1) < 0.1) {
        xSpeed *= -1;
      }
    } else {
      if (escena.tablero.left.jugador.getIndicador()) {
        xSpeed *=1;
      } else if (escena.tablero.right.jugador.getIndicador()) {
        xSpeed *=-1;
      }
    }
    difPuntos=escena.tablero.left.jugador.getPuntos()-escena.tablero.right.jugador.getPuntos();
    if (escena.tablero.left.jugador.getPuntos()==11||escena.tablero.right.jugador.getPuntos()==11) {
      if (difPuntos<0)
        ganador=escena.tablero.right.jugador.getNombre();
      else
        ganador=escena.tablero.left.jugador.getNombre();
      difPuntos=abs(difPuntos);
      if (difPuntos>=2) {

        isGameOver=true;
        isPlaying=false;
        isIntro=false;
        escena.play();
      }
    }
    
  }


  void show() {
    fill(255);
    ellipse(x, y, r*2, r*2);
  } 
  void edges() {
    if (y<100) {
      ySpeed*=-1;
    }
    if (y>height) {
      if (x<width/2) {
        ding.play();
        escena.tablero.right.jugador.incrementarpuntosconsecutivos();
        escena.tablero.left.jugador.setPuntosconsecutivos(0);

        escena.tablero.right.jugador.incrementar();
        escena.tablero.left.jugador.setIndicador(true);
        escena.tablero.right.jugador.setIndicador(false);
        primeraTirada=false;
      }
      if (x>width/2) {
        ding.play();
        escena.tablero.left.jugador.incrementarpuntosconsecutivos();
        escena.tablero.right.jugador.setPuntosconsecutivos(0);

        escena.tablero.left.jugador.incrementar();
        escena.tablero.right.jugador.setIndicador(true);
        escena.tablero.left.jugador.setIndicador(false);
        primeraTirada=false;
      }
      reset();
    }
    if (x>width) {
      ding.play();
      escena.tablero.left.jugador.incrementarpuntosconsecutivos();
      escena.tablero.right.jugador.setPuntosconsecutivos(0);

      escena.tablero.left.jugador.incrementar();
      escena.tablero.right.jugador.setIndicador(true);
      escena.tablero.left.jugador.setIndicador(false);
      primeraTirada=false;

      reset();
    }
    if (x<0) {
      ding.play();
      escena.tablero.right.jugador.incrementarpuntosconsecutivos();
      escena.tablero.left.jugador.setPuntosconsecutivos(0);

      escena.tablero.right.jugador.incrementar();
      escena.tablero.left.jugador.setIndicador(true);
      escena.tablero.right.jugador.setIndicador(false);
      primeraTirada=false;

      reset();
    }
  }
}