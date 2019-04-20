package pojos;

import java.util.Date;
import java.text.SimpleDateFormat;

public class Service {
    private int id, idCliente, idFumigador;
    private double costo;
    private String fecha, nombreCliente, nombreFumigador;
    private

    final String NEW_FORMAT = "dd/MM/yyyy";
    final String OLD_FORMAT = "yyyy-MM-dd";

    public Service() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdFumigador() {
        return idFumigador;
    }

    public void setIdFumigador(int idFumigador) {
        this.idFumigador = idFumigador;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
        try {
            Date d = sdf.parse(fecha);
            sdf.applyPattern(NEW_FORMAT);
            String newFecha = sdf.format(d);
            this.fecha = newFecha;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getNombreFumigador() {
        return nombreFumigador;
    }

    public void setNombreFumigador(String nombreFumigador) {
        this.nombreFumigador = nombreFumigador;
    }

}