package misrc;

import java.io.*;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.*;

public class Metodos {

    public static List<Alumno> getListaAlumnosFromArchivo(String nra) {

        List<Alumno> alumnos_al = new ArrayList<Alumno>();

        File f;
        FileReader fr;
        BufferedReader br;
        String registro;

        try {

            f = new File(nra);
            fr = new FileReader(f);
            br = new BufferedReader(fr);
            while ((registro = br.readLine()) != null) {
                String[] p = registro.split(";");
                Alumno a = new Alumno(p[0],
                        p[1],
                        p[2],
                        p[3],
                        p[4].charAt(0));

                alumnos_al.add(a);
            }

        } catch (Exception e) {
            alumnos_al = null;
        }

        return alumnos_al;
    }

    public static Alumno getAlumno(String codigo, List<Alumno> alumnos_al) {
        Alumno alumno = null;
        boolean bandera = false;
        for (int i = 0; i < alumnos_al.size(); i++) {
            alumno = alumnos_al.get(i);
            if (alumno.getCodigo().equalsIgnoreCase(codigo)) {
                bandera = true;
                break;
            }
        }
        if (bandera == false) {
            alumno = null;
        }
        return alumno;

    }

    public static List<Matricula> getListaMatriculas(String nra) {
        List<Matricula> matricula_al = new ArrayList<Matricula>();

        File f;
        FileReader fr;
        BufferedReader br;
        String registro;

        try {

            f = new File(nra);
            fr = new FileReader(f);
            br = new BufferedReader(fr);
            while ((registro = br.readLine()) != null) {
                String[] p = registro.split(";");
                Matricula m = new Matricula(p[0],
                        p[1],
                        p[2]);

                matricula_al.add(m);
            }

        } catch (Exception e) {
            matricula_al = null;
        }

        return matricula_al;
    }

    public static List<String> getListaMatriculasDistintas(List<Matricula> matricula_al) {
        Set<String> fechas_hs = new HashSet<String>();
        List<String> fechas_al = null;
        for (int i = 0; i < matricula_al.size(); i++) {
            String f = matricula_al.get(i).getFechaMatricula();
            fechas_hs.add(f);

        }

        fechas_al = new ArrayList<String>(fechas_hs);
        Collections.sort(fechas_al);

        return fechas_al;

    }

    public static List<String> getCodigoPorFecha(String fecha, List<Matricula> matricula_al) {
        Set<String> codigos_hs = new HashSet<String>();
        List<String> codigos_al = null;

        for (int i = 0; i < matricula_al.size(); i++) {

            String c = matricula_al.get(i).getCodigoAlumno();
            if (fecha.equalsIgnoreCase(matricula_al.get(i).getFechaMatricula())) {
                codigos_hs.add(c);
            }
        }

        codigos_al = new ArrayList<String>(codigos_hs);
        Collections.sort(codigos_al);
        return codigos_al;
    }

    public static List<Alumno> getListaAlumnoPorCodigo(List<String> codigos_al, List<Alumno> alumnos_al) {
        List<Alumno> alumnoMatriculado_al = new ArrayList<Alumno>();
        try {

            for (int i = 0; i < codigos_al.size(); i++) {
                for (int j = 0; j < alumnos_al.size(); j++) {
                    if (alumnos_al.get(j).getCodigo().equalsIgnoreCase(codigos_al.get(i))) {
                        alumnoMatriculado_al.add(alumnos_al.get(j));
                    }
                }

            }
        } catch (Exception e) {
            alumnoMatriculado_al = null;
        }
        return alumnoMatriculado_al;
    }

    public static List<LocalDate> getFechasAMostrar(LocalDate ldfecha1, LocalDate ldfecha2, List<String> fechas_al) {
        List<LocalDate> fechasAMostrar_al = new ArrayList<LocalDate>();
        List<LocalDate> todasLasFechas_al = new ArrayList<LocalDate>();

        if (ldfecha1.equals(ldfecha2)) {
            fechasAMostrar_al.add(ldfecha1);
        } else {

            for (int i = 0; i < fechas_al.size(); i++) {
                String[] p1 = fechas_al.get(i).split("/");
                LocalDate ld = LocalDate.of(Integer.parseInt(p1[2]),
                        Integer.parseInt(p1[1]),
                        Integer.parseInt(p1[0]));
                todasLasFechas_al.add(ld);
            }
            for (int j = 0; j < fechas_al.size(); j++) {

                if ((ldfecha1.isBefore(todasLasFechas_al.get(j)) && ldfecha2.isAfter(todasLasFechas_al.get(j))) || ldfecha1.equals(todasLasFechas_al.get(j)) || ldfecha2.equals(todasLasFechas_al.get(j))) {
                    fechasAMostrar_al.add(todasLasFechas_al.get(j));
                }
            }
        }
        return fechasAMostrar_al;
    }

    public static List<String> getFechasAMostrarOrdenadas(List<LocalDate> listaFechasAMostrar) {
        List<String> listaFechasOrdenadas = new ArrayList<String>();
        String fecha;
        for (int i = 0; i < listaFechasAMostrar.size(); i++) {
            LocalDate ld = listaFechasAMostrar.get(i);
            String ldx = ld.toString();
            String[] p = ldx.split("-");
            fecha = p[2] + "/" + p[1] + "/" + p[0];
            listaFechasOrdenadas.add(fecha);
        }

        return listaFechasOrdenadas;
    }

    public static List<String> getCodigoPorFecha2(List<String> listaFechasOrdenadas, List<Matricula> matricula_al) {
        Set<String> codigos_hs = new HashSet<String>();
        List<String> codigos_al = null;

        for (int j = 0; j < listaFechasOrdenadas.size(); j++) {
            for (int i = 0; i < matricula_al.size(); i++) {

                String c = matricula_al.get(i).getCodigoAlumno();
                if (listaFechasOrdenadas.get(j).equalsIgnoreCase(matricula_al.get(i).getFechaMatricula())) {
                    codigos_hs.add(c);
                }
            }
        }

        codigos_al = new ArrayList<String>(codigos_hs);
        Collections.sort(codigos_al);
        return codigos_al;
    }

    public static List<Curso> getListaCursoFromArchivo(String nra) {

        List<Curso> curso_al = new ArrayList<Curso>();

        File f;
        FileReader fr;
        BufferedReader br;
        String registro;

        try {

            f = new File(nra);
            fr = new FileReader(f);
            br = new BufferedReader(fr);
            while ((registro = br.readLine()) != null) {
                String[] p = registro.split(";");
                Curso c = new Curso(p[0],
                        p[1],
                        Integer.parseInt(p[2]));

                curso_al.add(c);
            }

        } catch (Exception e) {
            curso_al = null;
        }

        return curso_al;
    }

    public static boolean estaMatriculado(List<Matricula> matricula_al, String codigo) {
        boolean estaMatriculado = false;
        for (int i = 0; i < matricula_al.size(); i++) {
            if (matricula_al.get(i).getCodigoAlumno().equalsIgnoreCase(codigo)) {
                estaMatriculado = true;
                break;
            }
        }
        return estaMatriculado;
    }

    public static boolean esMayor(String fechaNacimiento) {
        boolean esMayor = false;
        String[] p1 = fechaNacimiento.split("/");
        LocalDate nacimiento = LocalDate.of(Integer.parseInt(p1[2]),
                Integer.parseInt(p1[1]),
                Integer.parseInt(p1[0]));

        LocalDate hoy = LocalDate.now();

        long edad = ChronoUnit.YEARS.between(nacimiento, hoy);

        if (edad < 18) {
            esMayor = false;
        } else {
            esMayor = true;
        }

        return esMayor;
    }

    public static List<Alumno> esBisiesto(List<Alumno> alumnos_al) {
        boolean esBisiesto = false;
        List<Alumno> alumnosBisiesto_al = new ArrayList<Alumno>();
        for (int i = 0; i < alumnos_al.size(); i++) {

            Alumno a = alumnos_al.get(i);
            String[] p1 = a.getFechaNacimiento().split("/");
            int anio = Integer.parseInt(p1[2]);

            if (anio % 4 == 0) {
                alumnosBisiesto_al.add(a);
            }

        }
        return alumnosBisiesto_al;
    }

}
