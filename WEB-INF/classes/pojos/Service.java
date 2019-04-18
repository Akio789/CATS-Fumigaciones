package pojos;

public class Service {
    private int id, idCliente, idFumigador;
    private double costo;

    public Service() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdCLiente() {
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

}