
public class Jugador {
  private boolean indicador=false;

  public Jugador(String nombre) {
    this.nombre = nombre;
    this.puntos = 0;
  }
  
  public String getNombre(){
   return this.nombre; 
  }

  private int puntos;
  private String nombre;
  private int puntosconsecutivos;

  public int getPuntos() {
      return this.puntos;
  }

  public void setPuntos(int puntos) {
      this.puntos = puntos;
  }
  
  public void incrementar() {
    this.puntos++;
  }
  
    public void incrementarpuntosconsecutivos() {
    this.puntosconsecutivos++;
  }
  
   public int getPuntosconsecutivos() {
      return this.puntosconsecutivos;
  }

  public void setPuntosconsecutivos(int puntos) {
      this.puntosconsecutivos = puntos;
  }
  
  public boolean getIndicador(){
   return indicador; 
  }
  
  public void setIndicador(boolean indicador){
   this.indicador=indicador; 
  }

}