
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html><html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>${semana.titulo} | ${perfil.nombre} ${perfil.apellidos}</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/publico.css">

    <style>

        /* =====================================================
           PÁGINA DE SEMANA
           ===================================================== */

        .week-page {

            min-height: 100vh;

            padding: 132px 7% 88px;

            background:
                    linear-gradient(
                            135deg,
                            rgba(57, 255, 82, .08),
                            transparent 34%
                    ),
                    linear-gradient(
                            215deg,
                            rgba(66, 232, 255, .08),
                            transparent 38%
                    ),
                    #080b12;

            position: relative;

            overflow: hidden;
        }


        .week-page::before {

            content: "";

            position: absolute;

            inset: 0;

            background-image:
                    linear-gradient(rgba(124,255,107,.045) 1px, transparent 1px),
                    linear-gradient(90deg, rgba(66,232,255,.035) 1px, transparent 1px);
            background-size: 56px 56px;
            mask-image: linear-gradient(to bottom, rgba(0,0,0,.75), transparent 68%);
            opacity: .55;
            pointer-events: none;
        }


        .week-container {

            max-width: 1250px;

            margin: auto;

            position: relative;

            z-index: 2;

        }


        /* =====================================================
           BOTÓN VOLVER
           ===================================================== */

        .week-back {

            display: inline-flex;

            align-items: center;

            gap: 10px;

            color: #42e8ff;

            text-decoration: none;

            font-size: 14px;

            font-weight: 700;

            letter-spacing: 1px;

            margin-bottom: 38px;

            transition: .3s;

        }


        .week-back:hover {

            color: #7cff6b;

            transform: translateX(-6px);

        }


        /* =====================================================
           CABECERA
           ===================================================== */

        .week-intro {

            display: grid;

            grid-template-columns: minmax(210px, 280px) minmax(0, 1fr);

            gap: clamp(28px, 5vw, 64px);

            align-items: center;

            margin-bottom: 70px;

            padding: clamp(26px, 4vw, 44px);

            border: 1px solid rgba(124,255,107,.16);

            border-radius: 8px;

            background:
                    linear-gradient(135deg, rgba(124,255,107,.07), rgba(66,232,255,.025) 48%, rgba(255,255,255,.018)),
                    rgba(5, 10, 16, .76);

            box-shadow:
                    0 24px 70px rgba(0,0,0,.32),
                    inset 0 1px 0 rgba(255,255,255,.04);

        }


        /* =====================================================
           NÚMERO
           ===================================================== */

        .week-number-box {

            position: relative;

            min-height: 210px;

            padding: 28px;

            border: 1px solid rgba(66,232,255,.18);

            border-left: 3px solid #7cff6b;

            border-radius: 8px;

            background:
                    linear-gradient(
                            135deg,
                            rgba(124, 255, 107, .09),
                            transparent
                    ),
                    rgba(4, 9, 14, .72);

            overflow: hidden;

        }


        .week-label {

            display: block;

            color: #7cff6b;

            font-size: 12px;

            font-weight: 800;

            letter-spacing: 4px;

            margin-bottom: 18px;

        }


        .week-number {

            font-size: clamp(86px, 9vw, 132px);

            line-height: .85;

            font-weight: 900;

            color: transparent;

            -webkit-text-stroke: 1px rgba(66, 232, 255, .55);

            letter-spacing: 0;

        }


        .week-number-box::after {

            content: "WEEK";

            position: absolute;

            bottom: 18px;

            right: 22px;

            font-size: 11px;

            letter-spacing: 4px;

            color: rgba(255,255,255,.24);

        }


        /* =====================================================
           INFORMACIÓN
           ===================================================== */

        .week-information {

            max-width: 800px;

        }


        .week-information .mini-title {

            color: #42e8ff;

            font-size: 13px;

            font-weight: 800;

            letter-spacing: 3px;

            margin-bottom: 14px;

        }


        .week-information h1 {

            margin: 0 0 18px;

            color: #ffffff;

            font-size: clamp(36px, 5vw, 64px);

            line-height: 1.04;

            letter-spacing: 0;

        }


        .week-information h1 span {

            color: #7cff6b;

        }


        .week-description {

            color: #9ca8b8;

            font-size: clamp(15px, 1.6vw, 17px);

            line-height: 1.75;

            max-width: 720px;

        }


        /* =====================================================
           LÍNEA DECORATIVA
           ===================================================== */

        .week-line {

            width: 100%;

            height: 1px;

            background:
                    linear-gradient(
                            90deg,
                            #7cff6b,
                            #42e8ff,
                            transparent
                    );

            margin-bottom: 52px;

            opacity: .6;

        }


        /* =====================================================
           ENCABEZADO TRABAJOS
           ===================================================== */

        .works-heading {

            display: flex;

            justify-content: space-between;

            align-items: flex-end;

            gap: 30px;

            margin-bottom: 32px;

        }


        .works-heading small {

            display: block;

            color: #7cff6b;

            font-size: 12px;

            font-weight: 800;

            letter-spacing: 4px;

            margin-bottom: 12px;

        }


        .works-heading h2 {

            margin: 0;

            color: white;

            font-size: clamp(30px, 4vw, 40px);

            letter-spacing: 0;

        }


        .works-heading p {

            margin: 0;

            color: #8b96a7;

            max-width: 350px;

            line-height: 1.6;

            text-align: right;

        }


        /* =====================================================
           GRID DE TRABAJOS
           ===================================================== */

        .works-grid {

            display: grid;

            grid-template-columns:
                    repeat(auto-fit, minmax(min(100%, 310px), 380px));

            gap: 28px;

            justify-content: start;

            align-items: stretch;

        }


        /* =====================================================
           TARJETA
           ===================================================== */

        .work-card {

            background:
                    linear-gradient(
                            145deg,
                            rgba(16, 21, 30, .96),
                            rgba(8, 13, 20, .96)
                    );

            border: 1px solid rgba(124,255,107,.12);

            border-radius: 8px;

            overflow: hidden;

            position: relative;

            transition:
                    transform .4s ease,
                    border-color .4s ease,
                    box-shadow .4s ease,
                    background .4s ease;

        }


        .work-card:hover {

            transform: translateY(-6px);

            border-color: rgba(124,255,107,.45);

            box-shadow:
                    0 22px 52px rgba(0,0,0,.34),
                    0 0 24px rgba(124,255,107,.08);

        }


        /* =====================================================
           IMAGEN
           ===================================================== */

        .work-image-container {

            position: relative;

            aspect-ratio: 16 / 10;

            overflow: hidden;

            background: #0a0e15;

        }


        .work-image {

            width: 100%;

            height: 100%;

            object-fit: cover;

            display: block;

            transition: transform .6s ease;

        }


        .work-card:hover .work-image {

            transform: scale(1.05);

        }


        .image-overlay {

            position: absolute;

            inset: 0;

            background:
                    linear-gradient(
                            to bottom,
                            transparent 45%,
                            rgba(8,11,18,.8)
                    );

            pointer-events: none;

        }


        /* =====================================================
           SIN IMAGEN
           ===================================================== */

        .no-image {

            aspect-ratio: 16 / 10;

            display: flex;

            flex-direction: column;

            align-items: center;

            justify-content: center;

            background:
                    repeating-linear-gradient(
                            45deg,
                            #0c1119,
                            #0c1119 10px,
                            #101620 10px,
                            #101620 20px
                    );

            color: #687486;

            font-size: 15px;

            letter-spacing: 1px;

        }


        .no-image-icon {

            font-size: 38px;

            margin-bottom: 12px;

            opacity: .5;

        }


        /* =====================================================
           CONTENIDO
           ===================================================== */

        .work-content {

            padding: 26px;

        }


        .work-index {

            color: #42e8ff;

            font-size: 11px;

            font-weight: 800;

            letter-spacing: 3px;

            margin-bottom: 10px;

        }


        .work-content h3 {

            margin: 0 0 12px;

            color: #ffffff;

            font-size: 22px;

            line-height: 1.25;

        }


        .work-content p {

            margin: 0 0 22px;

            color: #8b96a7;

            line-height: 1.75;

            white-space: pre-line;

        }


        /* =====================================================
           RECURSOS
           ===================================================== */

        .work-resources {

            display: flex;

            flex-wrap: wrap;

            gap: 10px;

            padding-top: 20px;

            border-top: 1px solid rgba(255,255,255,.07);

        }


        .work-link {

            display: inline-flex;

            align-items: center;

            gap: 8px;

            min-height: 42px;

            padding: 10px 16px;

            border: 1px solid rgba(66,232,255,.28);

            border-radius: 6px;

            color: #42e8ff;

            text-decoration: none;

            font-size: 13px;

            font-weight: 700;

            transition:
                    background .3s ease,
                    color .3s ease,
                    border-color .3s ease,
                    transform .3s ease;

        }


        .work-link:hover {

            background: #42e8ff;

            color: #080b12;

            border-color: #42e8ff;

            transform: translateY(-2px);

        }


        /* =====================================================
           SIN TRABAJOS
           ===================================================== */

        .no-works {

            border: 1px dashed rgba(124,255,107,.25);

            padding: 80px 30px;

            text-align: center;

            background: rgba(124,255,107,.025);

        }


        .no-works .icon {

            font-size: 45px;

            margin-bottom: 20px;

            opacity: .7;

        }


        .no-works h3 {

            color: white;

            font-size: 24px;

            margin-bottom: 12px;

        }


        .no-works p {

            color: #778294;

            max-width: 550px;

            margin: auto;

            line-height: 1.7;

        }


        /* =====================================================
           FOOTER DE SEMANA
           ===================================================== */

        .week-end {

            margin-top: 110px;

            padding-top: 35px;

            border-top: 1px solid rgba(255,255,255,.08);

            display: flex;

            justify-content: space-between;

            align-items: center;

            gap: 30px;

        }


        .week-end span {

            color: #687486;

            font-size: 13px;

        }


        .week-end strong {

            color: #7cff6b;

            font-weight: 700;

        }


        /* =====================================================
           RESPONSIVE
           ===================================================== */

        @media (max-width: 900px) {

            .week-intro {

                grid-template-columns: 1fr;

                gap: 24px;

            }


            .week-number-box {

                width: fit-content;

            }


            .week-number {

                font-size: 100px;

            }


            .works-heading {

                align-items: start;

                flex-direction: column;

            }


            .works-heading p {

                text-align: left;

            }

        }


        @media (max-width: 600px) {

            .week-page {

                padding: 120px 20px 70px;

            }


            .week-back {

                margin-bottom: 35px;

            }


            .week-intro {

                margin-bottom: 48px;

                padding: 22px;

            }


            .week-number {

                font-size: 80px;

            }


            .week-information h1 {

                font-size: 34px;

            }


            .week-description {

                font-size: 15px;

            }


            .works-heading h2 {

                font-size: 30px;

            }


            .work-content {

                padding: 22px;

            }


            .work-link {

                width: 100%;

                justify-content: center;

            }


            .week-end {

                flex-direction: column;

                align-items: flex-start;

            }

        }

    </style>

</head>


<body>


<!-- =====================================================
     NAVBAR
     ===================================================== -->

<header class="navbar">

    <div class="logo">

        <span>${perfil.apellidos}</span>

        <span>.</span>

    </div>


    <nav>

        <ul class="nav-links">

            <li>
                <a href="${pageContext.request.contextPath}/#inicio">
                    Inicio
                </a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/#sobre-mi">
                    Sobre mí
                </a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/#habilidades">
                    Habilidades
                </a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/#semanas">
                    Semanas
                </a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/#contacto">
                    Contacto
                </a>
            </li>

        </ul>

    </nav>

</header>


<!-- =====================================================
     CONTENIDO
     ===================================================== -->

<main class="week-page">

    <div class="week-container">


        <!-- VOLVER -->

        <a href="${pageContext.request.contextPath}/#semanas"
           class="week-back">

            <span>←</span>

            VOLVER A MI CAMINO

        </a>


        <!-- =================================================
             CABECERA
             ================================================= -->

        <section class="week-intro">


            <!-- NÚMERO -->

            <div class="week-number-box">

                <span class="week-label">
                    SEMANA
                </span>

                <div
                        class="week-number"
                        ><fmt:formatNumber value="${semana.numero}" minIntegerDigits="2" groupingUsed="false" /></div>

            </div>


            <!-- INFORMACIÓN -->

            <div class="week-information">

                <div class="mini-title">

                    APRENDIZAJE · PROCESO · PRÁCTICA

                </div>


                <h1>

                    <span>
                        <c:choose>
                            <c:when test="${not empty semana.titulo}">
                                ${semana.titulo}
                            </c:when>
                            <c:otherwise>
                                Semana ${semana.numero}
                            </c:otherwise>
                        </c:choose>
                    </span>

                </h1>


                <p
                        class="week-description"
                       >${semana.descripcion}</p>

            </div>

        </section>


        <!-- LÍNEA -->

        <div class="week-line"></div>


        <!-- =================================================
             TRABAJOS
             ================================================= -->

        <section>


            <div class="works-heading">

                <div>

                    <small>
                        PORTAFOLIO ACADÉMICO
                    </small>

                    <h2>
                        Lo que hice esta semana
                    </h2>

                </div>


                <p>

                    Aquí puedes explorar los trabajos,
                    proyectos y recursos que desarrollé
                    durante esta etapa de aprendizaje.

                </p>

            </div>


            <!-- =================================================
                 GRID
                 ================================================= -->

            <div
                    class="works-grid"
                    style="${not empty trabajos ? '' : 'display:none'}">


                <c:forEach var="trabajo" items="${trabajos}" varStatus="iter"><article
                        class="work-card"
                       >


                    <!-- IMAGEN -->

                    <div
                            class="work-image-container"
                            style="${not empty trabajo.imagen ? '' : 'display:none'}">

                        <img
                                class="work-image"

                                src="${trabajo.imagen}"

                                alt="${trabajo.titulo}">

                        <div class="image-overlay"></div>

                    </div>


                    <!-- SIN IMAGEN -->

                    <div
                            class="no-image"

                            style="${empty trabajo.imagen ? '' : 'display:none'}">

                        <div class="no-image-icon">
                            ◈
                        </div>

                        Sin imagen disponible

                    </div>


                    <!-- CONTENIDO -->

                    <div class="work-content">


                        <div class="work-index"
                             >PROYECTO <fmt:formatNumber value="${iter.index + 1}" minIntegerDigits="2" groupingUsed="false" /></div>


                        <h3
                               >${trabajo.titulo}</h3>


                        <p
                                style="${not empty trabajo.descripcion ? '' : 'display:none'}"

                               >${trabajo.descripcion}</p>


                        <!-- RECURSOS -->

                        <div class="work-resources">


                            <!-- PROYECTO -->

                            <a
                                    style="${not empty trabajo.enlace ? '' : 'display:none'}"

                                    href="${trabajo.enlace}"

                                    target="_blank"

                                    rel="noopener noreferrer"

                                    class="work-link">

                                <span>↗</span>

                                Ver proyecto

                            </a>


                            <!-- ARCHIVO -->

                            <a
                                    style="${not empty trabajo.archivo ? '' : 'display:none'}"

                                    href="${trabajo.archivo}"

                                    target="_blank"

                                    rel="noopener noreferrer"

                                    class="work-link">

                                <span>↓</span>

                                Ver archivo

                            </a>


                        </div>

                    </div>


                </article></c:forEach>


            </div>


            <!-- =================================================
                 SIN TRABAJOS
                 ================================================= -->

            <div
                    class="no-works"

                    style="${empty trabajos ? '' : 'display:none'}">

                <div class="icon">
                    ◇
                </div>

                <h3>
                    Todavía no hay trabajos
                </h3>

                <p>

                    Los trabajos de esta semana aparecerán
                    aquí cuando sean agregados desde el
                    panel administrativo.

                </p>

            </div>


        </section>


        <!-- =================================================
             FINAL
             ================================================= -->

        <div class="week-end">

            <span>

                Portafolio académico · 2026

            </span>

            <span>

                <strong
                       >${perfil.apellidos}</strong>

                ,

                <strong
                       >${perfil.nombre}</strong>

            </span>

        </div>


    </div>

</main>


<!-- =====================================================
     FOOTER
     ===================================================== -->

<footer>

    <p>

        © 2026

        <span>${perfil.nombre} ${perfil.apellidos}</span>

        · Diseño y Programación Web

    </p>

</footer>


<!-- JAVASCRIPT -->

<script src="${pageContext.request.contextPath}/js/publico.js"></script>

</body>

</html>









