/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package misrc;

/**
 *
 * @author Campus FP
 */
public class Matricula {
    private String codigoAlumno;
    private String codigoClase;
    private String fechaMatricula;

    public Matricula() {
    }

    public Matricula(String codigoAlumno, String codigoClase, String fechaMatricula) {
        this.codigoAlumno = codigoAlumno;
        this.codigoClase = codigoClase;
        this.fechaMatricula = fechaMatricula;
    }

    public String getCodigoAlumno() {
        return codigoAlumno;
    }

    public void setCodigoAlumno(String codigoAlumno) {
        this.codigoAlumno = codigoAlumno;
    }

    public String getCodigoClase() {
        return codigoClase;
    }

    public void setCodigoClase(String codigoClase) {
        this.codigoClase = codigoClase;
    }

    public String getFechaMatricula() {
        return fechaMatricula;
    }

    public void setFechaMatricula(String fechaMatricula) {
        this.fechaMatricula = fechaMatricula;
    }

    @Override
    public String toString() {
        return "Matricula{" + "codigoAlumno=" + codigoAlumno + ", codigoClase=" + codigoClase + ", fechaMatricula=" + fechaMatricula + '}';
    }
    
    
    
    
}
