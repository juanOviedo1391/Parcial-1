package com.mycompany.primerservlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Reserva;
import logica.controladora;

@WebServlet(urlPatterns = {"/ReservaServlets"}) // Asegúrate de que coincide con el formulario
public class ReservaServlet extends HttpServlet {

    private controladora control = new controladora(); // Instancia del controlador

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

            // Obtener los parámetros enviados desde el formulario
            String nombre = request.getParameter("nombre");
            String fechaInicialStr = request.getParameter("fechaInicial");
            String fechaFinalStr = request.getParameter("fechaFinal");
            String espacio = request.getParameter("espacio");
            String tiempoDuracion = request.getParameter("tiempoDuracion");

            // Validación: Verificar si algún campo está vacío
            if (nombre == null || fechaInicialStr == null || fechaFinalStr == null || 
                espacio == null || tiempoDuracion == null ||
                nombre.trim().isEmpty() || fechaInicialStr.trim().isEmpty() || 
                fechaFinalStr.trim().isEmpty() || espacio.trim().isEmpty() || 
                tiempoDuracion.trim().isEmpty()) {

                System.out.println("Error: Todos los campos deben estar completos.");
                response.sendRedirect("index.jsp?error=Todos+los+campos+son+obligatorios");
                return;
            }

            // Convertir las fechas de String a Date
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaInicial, fechaFinal;

            try {
                fechaInicial = sdf.parse(fechaInicialStr);
                fechaFinal = sdf.parse(fechaFinalStr);
            } catch (ParseException e) {
                System.out.println("⚠ Error: Formato de fecha incorrecto.");
                response.sendRedirect("index.jsp?error=Formato+de+fecha+incorrecto");
                return;
            }

            // Validar que la fecha inicial sea anterior a la final
            if (fechaInicial.after(fechaFinal)) {
                System.out.println("⚠ Error: Fecha inicial es posterior a la final.");
                response.sendRedirect("index.jsp?error=La+fecha+de+inicio+debe+ser+anterior+a+la+fecha+final");
                return;
            }

            // Crear la reserva con los datos recibidos
            Reserva nuevaReserva = new Reserva();
            nuevaReserva.setNombre(nombre);
            nuevaReserva.setFechaInicial(fechaInicial); // Usar Date directamente
            nuevaReserva.setFechaFinal(fechaFinal); // Usar Date directamente
            nuevaReserva.setEspacio(espacio);
            nuevaReserva.setTiempoDuracion(tiempoDuracion);

            // Guardar la reserva en la base de datos (o en memoria si no hay BD)
            control.crearReserva(nuevaReserva);
            System.out.println("✅ Reserva creada exitosamente.");

            // Enviar respuesta con los detalles de la reserva
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<html><body>");
            response.getWriter().println("<h2>Reserva confirmada</h2>");
            response.getWriter().println("<p><strong>Nombre:</strong> " + nombre + "</p>");
            response.getWriter().println("<p><strong>Fecha Inicial:</strong> " + sdf.format(fechaInicial) + "</p>"); // Convertir a String para mostrar
            response.getWriter().println("<p><strong>Fecha Final:</strong> " + sdf.format(fechaFinal) + "</p>"); // Convertir a String para mostrar
            response.getWriter().println("<p><strong>Espacio:</strong> " + espacio + "</p>");
            response.getWriter().println("<p><strong>Duración:</strong> " + tiempoDuracion + "</p>");
            response.getWriter().println("<br><a href='index.jsp'>Volver al inicio</a>");
            response.getWriter().println("</body></html>");

    }

    @Override
    public String getServletInfo() {
        return "Servlet que maneja la creación de reservas";
    }
}
