
document.addEventListener("DOMContentLoaded", () => {

    console.log("Portafolio público cargado correctamente");


    // =====================================================
    // ANIMACIÓN DE APARICIÓN AL HACER SCROLL
    // =====================================================

    const elementos = document.querySelectorAll(
        ".about-main-card, .mini-card, .skill-card, .journey-card, .project-card, .contact-item, .contact-button"
    );

    const observer = new IntersectionObserver(
        (entradas) => {

            entradas.forEach((entrada) => {

                if (entrada.isIntersecting) {

                    entrada.target.style.opacity = "1";

                    entrada.target.style.transform =
                        "translateY(0)";

                }

            });

        },
        {
            threshold: 0.15
        }
    );


    elementos.forEach((elemento) => {

        elemento.style.opacity = "0";

        elemento.style.transform =
            "translateY(40px)";

        elemento.style.transition =
            "all 0.7s ease";

        observer.observe(elemento);

    });


    // =====================================================
    // ELEMENTOS DEL MODAL
    // =====================================================

    const btnAbrirMensaje =
        document.getElementById("btnAbrirMensaje");

    const btnCerrarMensaje =
        document.getElementById("btnCerrarMensaje");

    const btnCancelarMensaje =
        document.getElementById("btnCancelarMensaje");

    const modalMensaje =
        document.getElementById("modalMensaje");

    const formulario =
        document.getElementById("formularioContacto");

    const navToggle =
        document.querySelector(".nav-toggle");

    const navLinks =
        document.querySelector(".nav-links");

    const navMenu =
        navLinks ? navLinks.closest("nav") : null;

    const enlacesNav =
        document.querySelectorAll(".nav-links a");


    // =====================================================
    // NAVEGACIÓN RESPONSIVE Y ESTADO ACTIVO
    // =====================================================

    if (navToggle && navLinks) {

        navToggle.addEventListener("click", () => {

            const abierto =
                navLinks.classList.toggle("is-open");

            navToggle.classList.toggle(
                "is-open",
                abierto
            );

            if (navMenu) {
                navMenu.classList.toggle(
                    "is-open",
                    abierto
                );
            }

            navToggle.setAttribute(
                "aria-expanded",
                String(abierto)
            );
        });
    }


    enlacesNav.forEach((enlace) => {

        enlace.addEventListener("click", () => {

            enlacesNav.forEach((item) =>
                item.classList.remove("active")
            );

            enlace.classList.add("active");

            if (navToggle && navLinks) {
                navLinks.classList.remove("is-open");
                if (navMenu) {
                    navMenu.classList.remove("is-open");
                }
                navToggle.classList.remove("is-open");
                navToggle.setAttribute("aria-expanded", "false");
            }
        });
    });


    const secciones =
        document.querySelectorAll(
            "section[id]"
        );

    if (secciones.length) {

        const navObserver =
            new IntersectionObserver(
                (entradas) => {

                    entradas.forEach((entrada) => {

                        if (!entrada.isIntersecting) {
                            return;
                        }

                        const enlaceActivo =
                            document.querySelector(
                                `.nav-links a[href="#${entrada.target.id}"]`
                            );

                        if (!enlaceActivo) {
                            return;
                        }

                        enlacesNav.forEach((item) =>
                            item.classList.remove("active")
                        );

                        enlaceActivo.classList.add("active");
                    });
                },
                {
                    rootMargin: "-45% 0px -45% 0px",
                    threshold: 0
                }
            );

        secciones.forEach((seccion) =>
            navObserver.observe(seccion)
        );
    }


    // =====================================================
    // ABRIR MODAL
    // =====================================================

    if (btnAbrirMensaje && modalMensaje) {

        btnAbrirMensaje.addEventListener("click", () => {

            modalMensaje.classList.add("active");

            document.body.style.overflow = "hidden";

        });

    }


    // =====================================================
    // CERRAR MODAL
    // =====================================================

    function cerrarModal() {

        if (modalMensaje) {

            modalMensaje.classList.remove("active");

        }

        document.body.style.overflow = "";

    }


    // =====================================================
    // BOTÓN X
    // =====================================================

    if (btnCerrarMensaje) {

        btnCerrarMensaje.addEventListener("click", () => {

            cerrarModal();

        });

    }


    // =====================================================
    // BOTÓN CANCELAR
    // =====================================================

    if (btnCancelarMensaje) {

        btnCancelarMensaje.addEventListener("click", () => {

            cerrarModal();

        });

    }


    // =====================================================
    // CERRAR AL HACER CLIC FUERA
    // =====================================================

    if (modalMensaje) {

        modalMensaje.addEventListener("click", (event) => {

            if (event.target === modalMensaje) {

                cerrarModal();

            }

        });

    }


    // =====================================================
    // CERRAR CON ESC
    // =====================================================

    document.addEventListener("keydown", (event) => {

        if (event.key === "Escape") {

            cerrarModal();

        }

    });


    // =====================================================
    // ENVIAR FORMULARIO SIN RECARGAR
    // =====================================================

    if (formulario) {

        formulario.addEventListener("submit", async (event) => {

            event.preventDefault();


            const boton =
                formulario.querySelector(".btn-send");


            // Desactivar botón

            boton.disabled = true;

            boton.textContent = "Enviando...";


            // Obtener datos

            const datos =
                new FormData(formulario);


            try {

                const respuesta = await fetch(
                    "/mensaje/enviar",
                    {
                        method: "POST",
                        body: datos
                    }
                );


                // Comprobar respuesta

                if (!respuesta.ok) {

                    throw new Error(
                        "Error al enviar el mensaje"
                    );

                }


                const resultado =
                    await respuesta.json();


                // =================================================
                // MENSAJE ENVIADO CORRECTAMENTE
                // =================================================

                if (resultado.exito) {


                    // Limpiar formulario

                    formulario.reset();


                    // Cerrar modal

                    cerrarModal();


                    // Mostrar notificación

                    mostrarNotificacion(
                        "✓ ¡Mensaje enviado correctamente!"
                    );

                }


            } catch (error) {

                console.error(
                    "Error al enviar:",
                    error
                );


                mostrarNotificacion(
                    "✕ No se pudo enviar el mensaje.",
                    true
                );


            } finally {

                // Reactivar botón

                boton.disabled = false;

                boton.textContent =
                    "Enviar mensaje";

            }

        });

    }

});


// =====================================================
// NOTIFICACIÓN
// =====================================================

function mostrarNotificacion(
    texto,
    error = false
) {

    // Crear notificación

    const notificacion =
        document.createElement("div");


    notificacion.className =
        "notificacion";


    // Si es error

    if (error) {

        notificacion.classList.add("error");

    }


    // Contenido

    notificacion.innerHTML = `

<span>${texto}</span>

<button
    type="button"
    aria-label="Cerrar notificación">
    ×
</button>

    `;


    // Agregar al documento

    document.body.appendChild(
        notificacion
    );


    // Botón cerrar

    const botonCerrar =
        notificacion.querySelector("button");


    botonCerrar.addEventListener(
        "click",
        () => {

            cerrarNotificacion(
                notificacion
            );

        }
    );


    // Animación de entrada

    setTimeout(() => {

        notificacion.classList.add(
            "mostrar"
        );

    }, 10);


    // Desaparecer después de 4 segundos

    setTimeout(() => {

        cerrarNotificacion(
            notificacion
        );

    }, 4000);

}


// =====================================================
// CERRAR NOTIFICACIÓN
// =====================================================

function cerrarNotificacion(
    notificacion
) {

    if (!notificacion) return;


    notificacion.classList.remove(
        "mostrar"
    );


    setTimeout(() => {

        if (notificacion.parentElement) {

            notificacion.remove();

        }

    }, 400);

}
/* =====================================================
   MATRIX RAIN
   ===================================================== */

document.addEventListener("DOMContentLoaded", () => {

    const canvas =
        document.getElementById("matrixCanvas");

    if (!canvas) {
        return;
    }

    const ctx =
        canvas.getContext("2d");

    const reducirMovimiento =
        window.matchMedia("(prefers-reduced-motion: reduce)");

    const caracteres =
        "01ABCDEFGHIJKLMNOPQRSTUVWXYZ<>{}[]#$%&+=アイウエオカキクケコサシスセソ";

    const columnas = [];

    let ancho = 0;
    let alto = 0;
    let escala = 1;
    let tamanoFuente = 18;
    let ultimoTiempo = 0;
    let animacionId = null;

    function caracterAleatorio() {

        return caracteres[
            Math.floor(
                Math.random() *
                caracteres.length
            )
        ];
    }

    function crearColumna(indice) {

        return {
            x: indice * tamanoFuente,
            y: Math.random() * -alto,
            velocidad:
                70 +
                Math.random() * 125,
            longitud:
                8 +
                Math.floor(Math.random() * 18),
            brillo:
                Math.random()
        };
    }

    function ajustarCanvas() {

        escala =
            Math.min(
                window.devicePixelRatio || 1,
                2
            );

        ancho =
            window.innerWidth;

        alto =
            window.innerHeight;

        tamanoFuente =
            ancho < 640 ? 15 : 18;

        canvas.width =
            Math.floor(ancho * escala);

        canvas.height =
            Math.floor(alto * escala);

        canvas.style.width =
            `${ancho}px`;

        canvas.style.height =
            `${alto}px`;

        ctx.setTransform(
            escala,
            0,
            0,
            escala,
            0,
            0
        );

        const totalColumnas =
            Math.ceil(ancho / tamanoFuente);

        columnas.length = 0;

        for (let i = 0; i < totalColumnas; i++) {
            columnas.push(
                crearColumna(i)
            );
        }

        ctx.fillStyle = "#000000";
        ctx.fillRect(0, 0, ancho, alto);
    }

    function dibujarColumna(columna) {

        ctx.font =
            `700 ${tamanoFuente}px Consolas, "Courier New", monospace`;

        ctx.textAlign = "center";
        ctx.textBaseline = "top";

        for (let i = 0; i < columna.longitud; i++) {

            const y =
                columna.y -
                i * tamanoFuente;

            if (y < -tamanoFuente || y > alto + tamanoFuente) {
                continue;
            }

            const intensidad =
                1 - i / columna.longitud;

            const esCabeza =
                i === 0;

            const esDestello =
                columna.brillo > 0.82 &&
                i < 2;

            ctx.shadowColor =
                esCabeza ? "#caffd1" : "#1eff42";

            ctx.shadowBlur =
                esCabeza ? 15 : 7 * intensidad;

            if (esCabeza) {
                ctx.fillStyle =
                    "#eaffec";
            } else if (esDestello) {
                ctx.fillStyle =
                    "#92ff9e";
            } else {
                ctx.fillStyle =
                    `rgba(31, 255, 67, ${Math.max(0.08, intensidad * 0.72)})`;
            }

            ctx.fillText(
                caracterAleatorio(),
                columna.x + tamanoFuente / 2,
                y
            );
        }

        ctx.shadowBlur = 0;
    }

    function dibujar(tiempo) {

        if (reducirMovimiento.matches) {
            return;
        }

        const delta =
            Math.min(
                (tiempo - ultimoTiempo) / 1000 || 0.016,
                0.05
            );

        ultimoTiempo =
            tiempo;

        ctx.fillStyle =
            "rgba(0, 0, 0, 0.145)";

        ctx.fillRect(
            0,
            0,
            ancho,
            alto
        );

        columnas.forEach((columna, indice) => {

            dibujarColumna(columna);

            columna.y +=
                columna.velocidad * delta;

            if (columna.y - columna.longitud * tamanoFuente > alto) {
                columnas[indice] =
                    crearColumna(indice);
            }
        });

        animacionId =
            requestAnimationFrame(dibujar);
    }

    function pintarEstadoReducido() {

        ctx.fillStyle = "#000000";
        ctx.fillRect(0, 0, ancho, alto);

        ctx.font =
            `700 ${tamanoFuente}px Consolas, "Courier New", monospace`;

        ctx.fillStyle =
            "rgba(31, 255, 67, 0.28)";

        columnas.forEach((columna) => {

            for (let i = 0; i < 5; i++) {
                ctx.fillText(
                    caracterAleatorio(),
                    columna.x + tamanoFuente / 2,
                    Math.random() * alto
                );
            }
        });
    }

    function iniciarMatrix() {

        if (animacionId) {
            cancelAnimationFrame(animacionId);
            animacionId = null;
        }

        ultimoTiempo =
            performance.now();

        if (reducirMovimiento.matches) {
            pintarEstadoReducido();
            return;
        }

        animacionId =
            requestAnimationFrame(dibujar);
    }

    ajustarCanvas();
    iniciarMatrix();

    window.addEventListener(
        "resize",
        () => {
            ajustarCanvas();
            iniciarMatrix();
        }
    );

    reducirMovimiento.addEventListener(
        "change",
        iniciarMatrix
    );
});
