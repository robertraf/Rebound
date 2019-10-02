class Paddle {
  float x=100;
  float h = 10;
  float y = height-10;
  float w = 100;
  float xchange = 0;
  private Jugador jugador;

  Paddle(float x_) {
    this.x=x_;
  }

  void update(float inicio, float salida) {
    x += xchange;
    x=constrain(x,inicio,salida);
  }

  void move(float steps) {
    xchange = steps;
  }

  void show() {
    fill(255);
    rectMode(CORNER);
    rect(x, y, w, h);
  }
}