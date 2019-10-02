class Escena {
  private Tablero tablero;

  private Jugador j1;
  private Jugador j2;
  PImage startscreen1= loadImage("space.jpg");
  PImage startscreen2;



  public Escena() {
    // Inicializacion del Tablero
    tablero = new Tablero();

    // Inicializacion de los jugadores
    j1 = new Jugador(JOptionPane.showInputDialog("Jugador 1: "));
    j2 = new Jugador(JOptionPane.showInputDialog("Jugador 2: "));

    // Colocar los Jugadores dentro de las paletas
    tablero.left.jugador = j1;
    tablero.right.jugador = j2;
  }

  public void intro() {

    //background(255);
    image(startscreen1, 0, 0, 1200, 700);

    //puntitos de colores
    for (int i=0; i<20; i++) {
      strokeWeight(random(4, 11));
      stroke(random(255), random(255), random(255));
      point(random(width), random(height));
    }
    //circulo de color atras del boton
    fill(random(255), random(255), random(255));
    noStroke();
    ellipse(width/2, height/2, 80, 80);//Agregado

    //imagen del boton
    startscreen2= loadImage("play.png");
    image(startscreen2, width/2-39, height/2-39, 78, 78);

    //textos
    textAlign(CENTER);
    textSize(40);
    fill(random(250), random(250), random(250));//Color de las letras
    text("REBOUND GAME", width/2, 150);
    //fill(0, 102, 153);
    text("2017", width/2, 190);
    textSize(20);
    fill(255, 255, 255);
    text("POO-0700", 70, 500);
    text("GRUPO: WARRIORS", 110, 520);
    fill(random(250), random(250), random(250));
    text("WARRIORS", 150, 520);
    fill(255, 255, 255);
    text("Cristian Cortés____20151001626", 180, 540);
    text("Luis Andino_______20151003836", 180, 560);
    text("Roberto Ramírez__20151003441", 178, 580);
  }

  public void play() {
    if (isGameOver)
      gameOver();
    else if (isIntro)
      intro();
    else if (isPlaying)
      tablero.dibujar();
  }


  public void gameOver() {
    isGameOver=true;
    isIntro=false;
    isPlaying=false;
    background(0);
    image(startscreen1, 0, 0, 1200, 700);
    for (int i=0; i<20; i++) {
      strokeWeight(random(4, 11));
      stroke(random(255), random(255), random(255));
      point(random(width), random(height));
    }

    noStroke();
    fill(random(255), random(255), random(255));
    ellipse(width/2, height/2, 80, 80);//Agregado
    startscreen2= loadImage("play.png");
    image(startscreen2, width/2-39, height/2-39, 78, 78);

    textAlign(CENTER);
    textSize(60);
    fill(random(250), random(250), random(250));//Color de las letras
    text("GAME OVER", width/2, 150);
    textSize(40);
    text("PLAY AGAIN", width/2, 450);
    text("Ganador: "+ganador,width/2,490);

    primeraTirada=true;
    /*isGameOver=true;
    isIntro=false;
    isPlaying=false;*/
    difPuntos=0;
    tablero.left.jugador.setPuntos(0);
    tablero.right.jugador.setPuntos(0);
  }
}