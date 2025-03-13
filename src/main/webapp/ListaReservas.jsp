<%@page import="logica.Reserva"%>  <!-- Importa la clase Reserva desde el paquete logica -->
<%@page import="java.util.List"%>  <!-- Importa la clase List para manejar listas -->
<%@page import="java.text.SimpleDateFormat"%>  <!-- Importa la clase SimpleDateFormat para el formato de fechas -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>  <!-- Define el tipo de contenido como HTML y establece la codificación UTF-8 -->

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">  <!-- Define la codificación de caracteres como UTF-8 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  <!-- Establece las configuraciones para la visualización en dispositivos móviles -->
    <title>Lista de Reservas</title>  <!-- Título de la página -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">  <!-- Carga Bootstrap para el diseño -->
</head>
<body>
    <div class="container mt-4">  <!-- Contenedor principal con margen superior -->
        <h1 class="text-center mb-4">Lista de Reservas</h1>  <!-- Título principal de la página -->
        <div class="card shadow-sm">  <!-- Tarjeta de Bootstrap con sombra -->
            <div class="card-body">
                <% 
                    // Recupera la lista de reservas desde la sesión
                    List<Reserva> listaReservas = (List<Reserva>) request.getSession().getAttribute("listaUsuarios");
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // Formato de fecha
                %>
                
                <!-- Verifica si hay reservas en la lista -->
                <% if (listaReservas != null && !listaReservas.isEmpty()) { %>
                    <!-- Si hay reservas, muestra una tabla con la información -->
                    <table class="table table-striped table-hover">
                        <thead class="table-dark">  <!-- Cabecera con fondo oscuro -->
                            <tr>
                                <th>#</th>
                                <th>Nombre</th>
                                <th>Fecha Inicio</th>
                                <th>Fecha Final</th>
                                <th>Espacio</th>
                                <th>Tiempo</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                               int cont = 1;  // inizializa el contador en 1
                               // Creacion de tabla para la iteracion con todos los registros que se van ingresando o eliminando  en la lista = "listaReservas"
                               for (Reserva reserva : listaReservas) { %>
                                <tr>
                                    <td><%= cont %></td>  <!-- Muestra el número de la reserva -->
                                    <td><%= reserva.getNombre() %></td>  <!-- Muestra el nombre de la persona que hizo la reserva -->
                                    <td><%= sdf.format(reserva.getFechaInicial()) %></td>  <!-- Muestra la fecha de inicio de la reserva -->
                                    <td><%= sdf.format(reserva.getFechaFinal()) %></td>  <!-- Muestra la fecha final de la reserva -->
                                    <td><%= reserva.getEspacio() %></td>  <!-- Muestra el espacio reservado -->
                                    <td><%= reserva.getTiempoDuracion() %></td>  <!-- Muestra la duración de la reserva -->
                                    <td>
                                        <!-- Formulario para eliminar una reserva -->
                                        <form action="EliminarReservaServlet" method="post">
                                            <input type="hidden" name="idReserva" value="<%= reserva.getId() %>">  <!-- Pasa el ID de la reserva para eliminarla -->
                                            <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>  <!-- Botón para eliminar la reserva -->
                                        </form>
                                    </td>
                                </tr>
                            <% cont++; } %>
                        </tbody>
                    </table>
                <% } else { %>
                    <!-- Si no hay reservas, muestra un mensaje de advertencia -->
                    <div class="alert alert-warning text-center" role="alert">
                        No hay reservas registradas.
                    </div>
                <% } %>

                <!-- Botón para volver al inicio -->
                <div class="text-center mt-3">
                    <a href="index.jsp" class="btn btn-primary">Volver al Inicio</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Carga los scripts de Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
