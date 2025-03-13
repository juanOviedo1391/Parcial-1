package persistencia;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Reserva;
import persistencia.exceptions.NonexistentEntityException;

public class controladoraPersistencia { 
    private ReservaJpaController usuJpa = new ReservaJpaController();


    public void crearReserva(Reserva reserva) { 
        usuJpa.create(reserva); 
    } 

    public List<Reserva> traerReservas() { 
        return usuJpa.findReservaEntities(); 
    }

    public void borrarReserva(int id_eliminar) { 
        try {
            usuJpa.destroy(id_eliminar);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(controladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Reserva traerReserva(int id_editar) { 
        return usuJpa.findReserva(id_editar); 
    } 

    public void editarReserva(Reserva reserva) { 
        try {
            usuJpa.edit(reserva);
        } catch (Exception ex) {
            Logger.getLogger(controladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
