package com.mycompany.primerservlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Reserva;
import logica.controladora;

@WebServlet(urlPatterns = {"/ListaReservas"})  // Define la URL a la que el servlet responde
public class ListaReservasServlet extends HttpServlet {

    // Instancia de la clase controladora, que maneja la lógica de negocio
    private controladora control = new controladora(); 

    @Override 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
                throws ServletException, IOException { 
        
        // Inicializa una lista para almacenar las reservas
        List<Reserva> listaUsuarios = new ArrayList<>();
        
        // Trae la lista de reservas desde la base de datos utilizando el método de la clase controladora
        listaUsuarios = control.traerReservas(); 
        
        // Obtiene la sesión del usuario
        HttpSession misesion = request.getSession(); 
        
        // Establece la lista de reservas como un atributo de la sesión, para poder accederla en JSP
        misesion.setAttribute("listaUsuarios", listaUsuarios); 
        
        // Redirige al usuario a la página de "ListaReservas.jsp", donde se muestran las reservas
        response.sendRedirect("ListaReservas.jsp"); 
    }
}
