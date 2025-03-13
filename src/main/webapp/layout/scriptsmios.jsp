
<%@page contentType="text/html" pageEncoding="UTF-8"%>
                
                <script>
                    document.getElementById("fechaInicial").addEventListener("change", calcularDuracion);
                    document.getElementById("fechaFinal").addEventListener("change", calcularDuracion);

                    function calcularDuracion() {
                        let inicio = document.getElementById("fechaInicial").value;
                        let fin = document.getElementById("fechaFinal").value;
                        let duracionInput = document.getElementById("tiempoDuracion"); // Corregido

                        if (inicio && fin) {
                            let fechaInicio = new Date(inicio);
                            let fechaFin = new Date(fin);

                            if (fechaFin > fechaInicio) {
                                let diferenciaMs = fechaFin - fechaInicio;
                                let horas = diferenciaMs / (1000 * 60 * 60); // Convertir ms a horas
                                duracionInput.value = horas.toFixed(2) + " horas";
                            } else {
                                duracionInput.value = "Error: Fecha final debe ser posterior";
                            }
                        } else {
                            duracionInput.value = "";
                        }
                    }
                </script>