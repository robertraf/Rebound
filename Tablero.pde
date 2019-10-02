class Tablero{
  private Pelota pelota;
  private Paddle left;
  private Paddle right;
  

  
  public Tablero(){
  this.left = new Paddle(width/4-50);
  this.right = new Paddle(width-width/4);
  this.pelota = new Pelota();
  }
  
  void dibujar(){
    isIntro=false;
    isGameOver=false;
    isPlaying=true;
    //rectangulo negro en el fondo
  fill(0);
  rect(0,0,width,height);
  
  //dibujando red
  strokeWeight(10);
  stroke(174);
  line(width/2,height-100,width/2,height);
  
  //dibujando marcador
  fill(174);
  rect(0,0,width,100);
  
  //puntos
  fill(0);
  textSize(20);
  text(this.left.jugador.getNombre(),50,40);
  text(this.left.jugador.getPuntos(),120,40);
  text(this.right.jugador.getNombre(),width-130,40);
  text(this.right.jugador.getPuntos(),width-50,40);
  
  
  this.left.show();
  this.right.show();
  this.pelota.show();
  this.pelota.edges();
  this.left.update(0, width/2-left.w-10);
  this.right.update(width/2+10,width-right.w);
  }
}