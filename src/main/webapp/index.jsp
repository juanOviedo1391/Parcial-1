<!DOCTYPE html>
<html lang="en">
 <!-- Se utilizo una plantilla de boostrat para implementar el html pero se cambio a jsp -->
    <%@include file="layout/header.jsp"%> <!-- Incluye el encabezado com�n de la p�gina (header.jsp) -->
    <body class="starter-page-page">

        <main class="main">

            <!-- Page Title -->
            <div class="page-title" data-aos="fade">  <!-- T�tulo de la p�gina con animaci�n fade -->
                <div class="heading">
                    <div class="container">
                        <div class="row d-flex justify-content-center text-center">
                            <div class="col-lg-8">
                                <h1>Bienvenido</h1>  <!-- T�tulo principal -->
                                <p class="mb-0">"Reserva f�cilmente tu espacio de coworking y disfruta de un ambiente ideal para trabajar y colaborar. �Elige la fecha, el horario y el espacio que mejor se adapte a ti!"</p>  <!-- Descripci�n del servicio -->
                            </div>
                        </div>
                    </div>
                </div>
                <nav class="breadcrumbs"> 
                    <div class="container">
                        <ol>
                            <li><a href="index.jsp">Home</a></li>  <!-- Enlace a la p�gina de inicio -->
                        </ol>
                    </div>
                </nav>
            </div>
            <section id="starter-section" class="starter-section section">

                <div class="container section-title" data-aos="fade-up">
                    <h2>Agenda tu espacio</h2> 
                    <p>En este espacio agendaras tu espacio para trabajar, debes llenar todos los campos antes de poder continuar</p>  <!-- Descripci�n de la secci�n -->
                </div>
                <div class="container" data-aos="fade-up">
                    <!-- Formulario para realizar una reserva, enviando los datos al servlet "ReservaServlets" mediante el m�todo POST -->
                    <form action="ReservaServlets" method="POST">

                        <!-- Campo de entrada para el nombre del usuario -->
                        <div class="form-floating mb-3">
                            <input class="form-control" id="nombre" type="text" name="nombre" required>  <!-- Campo de texto para el nombre -->
                            <label for="nombre">Nombre Del Usuario</label>  <!-- Etiqueta del campo -->
                        </div>

                        <!-- Campo de entrada para la fecha de inicio de la reserva -->
                        <div class="form-floating mb-3">
                            <input class="form-control" id="fechaInicial" type="datetime-local" name="fechaInicial" required>  <!-- Campo de fecha y hora para la fecha de inicio -->
                            <label for="fechaInicial">Fecha de Inicio de reserva</label>  <!-- Etiqueta del campo -->
                        </div>

                        <!-- Campo de entrada para la fecha de finalizaci�n de la reserva -->
                        <div class="form-floating mb-3">
                            <input class="form-control" id="fechaFinal" type="datetime-local" name="fechaFinal" required>  <!-- Campo de fecha y hora para la fecha final -->
                            <label for="fechaFinal">Fecha de Final de reserva</label>  <!-- Etiqueta del campo -->
                        </div>

                        <!-- Selector para elegir el tipo de espacio a reservar -->
                        <div class="form-floating mb-3">
                            <select class="form-control" id="espacio" name="espacio" required>  <!-- Selector para elegir el tipo de espacio -->
                                <option value="" disabled selected>Selecciona un espacio de trabajo:</option>  <!-- Opci�n por defecto -->
                                <option value="escritorio">Escritorio</option>  <!-- Opci�n de espacio: Escritorio -->
                                <option value="sala_reuniones">Sala de reuniones</option>  <!-- Opci�n de espacio: Sala de reuniones -->
                                <option value="oficina_privada">Oficina privada</option>  <!-- Opci�n de espacio: Oficina privada -->
                            </select>
                        </div>

                        <!-- Campo de entrada para la duraci�n de la reserva -->
                        <div class="form-floating mb-3">
                            <input class="form-control" id="tiempoDuracion" type="text" name="tiempoDuracion">  <!-- Campo de texto para la duraci�n -->
                            <label for="tiempoDuracion">Cu�nto tiempo van a durar</label>  <!-- Etiqueta del campo -->
                        </div>

                        <!-- Bot�n para enviar el formulario -->
                        <div class="d-grid">
                            <button class="btn btn-primary btn-lg" type="submit">Enviar</button>  <!-- Bot�n para enviar el formulario -->
                        </div>
                    </form>
                </div>

                <!-- En este espacio se realiza el envio de los datos gracias al post que esta incluido en el formulario y envia todos los datos que estan dentro del formulario -->
                <%@include file="layout/scriptsmios.jsp"%>  <!-- Incluye los scripts personalizados necesarios -->

            </section><!-- /Starter Section -->

        </main>

        <%@include file="ListaReservas.jsp"%>  <!-- Incluye la lista de reservas (ListaReservas.jsp) -->

        <%@include file="layout/footer.jsp"%>  <!-- Incluye el pie de p�gina (footer.jsp) -->
        <!-- Scroll Top -->
        <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>  <!-- Enlace para volver arriba -->

        <!-- Preloader -->
        <div id="preloader"></div>  <!-- Carga previa de la p�gina -->

        <%@include file="layout/scriptspag.jsp"%>  <!-- Incluye los scripts generales de la p�gina -->

    </body>

</html>
