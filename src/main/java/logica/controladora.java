    package logica;

import java.util.List;
import persistencia.controladoraPersistencia;

public class controladora { 
    private controladoraPersistencia controlPersis = new controladoraPersistencia(); 

    // Métodos para Reservas
    public void crearReserva(Reserva reserva) { 
        controlPersis.crearReserva(reserva); 
    } 
    
    public List<Reserva> traerReservas() { 
        return controlPersis.traerReservas(); 
    }
    
    public void borrarReserva(int idEliminar) { 
        controlPersis.borrarReserva(idEliminar); 
    }

    public Reserva traerReserva(int id_editar) { 
        return controlPersis.traerReserva(id_editar); 
    } 
    
}
