Sistema de Gestión de Reservas
Este proyecto es una aplicación web desarrollada en Java con Servlets y JSP para la gestión de reservas de espacios. Utiliza JPA para la persistencia de datos en una base de datos relacional.
Características:

•	Creación, visualización y eliminación de reservas.
•	Validación de datos en el servidor.
•	Uso de sesiones para mantener la lista de reservas.
•	Persistencia de datos con JPA.
Tecnologías utilizadas

•	Javas
•	JPA (Java Persistence)
•	SQL Server (Base de datos)
•	NetBeans (IDE de desarrollo)
•	Tomcat (Servidor web)
Instalación y configuración
1. Clonar el repositorio
git clone 
2. Configurar la base de datos
•	Crear una base de datos en SQL Server con el nombre Javaweb_db con una tabla llamada reservas o si no el sistema .
3. Configurar el proyecto en NetBeans
•	Importar el proyecto en NetBeans.
•	Configurar el archivo persistence.xml con los datos de conexión a la base de datos.
4. Ejecutar el proyecto
•	Iniciar el servidor Tomcat desde NetBeans.
•	Acceder a la aplicación desde http://localhost:8080/primerservlet.
Uso de la aplicación
1. Crear una reserva
•	Ingresar datos en el formulario principal y enviar.
•	El sistema validará los datos y almacenará la reserva en la base de datos.
2. Visualizar reservas
•	Acceder a la lista de reservas desde la página ListaReservas.jsp.
•	Se mostrarán todas las reservas almacenadas en la base de datos.
3. Eliminar una reserva
•	Desde la lista de reservas, hacer clic en eliminar.
•	La reserva se elim
•	inará de la base de datos y se actualizará la lista.
Estructura del proyecto
 Autor
Juan Andres Guacaneme Oviedo
