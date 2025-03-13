package com.mycompany.primerservlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.controladora;
import logica.Reserva;

@WebServlet(urlPatterns = {"/EliminarReservaServlet"})  // Define la URL a la que el servlet responde
public class EliminarReservaServlet extends HttpServlet {

    private controladora control = new controladora();  // Instancia de la clase controladora que maneja la lógica de negocio

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        // Obtiene el parámetro "idReserva" del formulario o de la solicitud HTTP
        String idReservaStr = request.getParameter("idReserva");

        // Verificar si el parámetro "idReserva" está presente y no es vacío
        if (idReservaStr == null || idReservaStr.trim().isEmpty()) {
            // Si no se proporciona el ID, redirige al usuario a una página de error
            response.sendRedirect("error.jsp?error=ID+de+reserva+no+proporcionado");
            return;
        }

        try {
            // Intenta convertir el parámetro "idReserva" a un número entero
            int idReserva = Integer.parseInt(idReservaStr);

            // Elimina la reserva usando el ID proporcionado
            control.borrarReserva(idReserva);

            // Obtiene la lista actualizada de reservas
            HttpSession session = request.getSession();  // Obtiene la sesión del usuario
            List<Reserva> listaReservas = control.traerReservas();  // Método que obtiene la lista de reservas desde la base de datos
            session.setAttribute("listaUsuarios", listaReservas);  // Actualiza la lista de reservas en la sesión

            // Redirige al usuario a la página de la lista de reservas actualizada
            response.sendRedirect("ListaReservas.jsp");

        } catch (NumberFormatException e) {
            // Si ocurre un error al convertir el ID, redirige al usuario a una página de error
            response.sendRedirect("error.jsp?error=Formato+de+ID+inválido");
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet para eliminar reservas";  // Información sobre el servlet
    }
}

