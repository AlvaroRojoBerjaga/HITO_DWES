package misrc;

public class Curso {
    
    private String codigoClase;
    private String nombre;
    private int creditos;

    public Curso() {
    }

    public Curso(String codigoClase, String nombre, int creditos) {
        this.codigoClase = codigoClase;
        this.nombre = nombre;
        this.creditos = creditos;
    }

    public String getCodigoClase() {
        return codigoClase;
    }

    public void setCodigoClase(String codigoClase) {
        this.codigoClase = codigoClase;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCreditos() {
        return creditos;
    }

    public void setCreditos(int creditos) {
        this.creditos = creditos;
    }

    @Override
    public String toString() {
        return "Curso: " + "codigoClase=" + codigoClase + ", nombre=" + nombre + ", creditos=" + creditos + '}';
    }
    
    
}
