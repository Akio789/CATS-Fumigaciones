package pojos;

public class Service {
    private int id, idCliente, idFumigador;
    private double costo;
    private String fecha;

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

    public void setFecha(String Fecha) {
        this.fecha = fecha;
    }

}