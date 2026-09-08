<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html><html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Antonio Prado H | AprHd</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/publico.css">

</head>

<body>
<canvas id="matrixCanvas"></canvas>

<div class="matrix-glow matrix-glow-left"></div>
<div class="matrix-glow matrix-glow-right"></div>


<!-- =====================================================
     NAVEGACIÓN
     ===================================================== -->

<header class="navbar">

    <div class="navbar-container">

        <a href="#inicio" class="brand">

            <span class="brand-symbol">AP</span>

            <span class="brand-name">
                AprHd
            </span>

        </a>

        <button class="nav-toggle"
                type="button"
                aria-label="Abrir menú"
                aria-expanded="false">
            <span></span>
            <span></span>
            <span></span>
        </button>

        <nav>

            <ul class="nav-links">

                <li>
                    <a href="#inicio" class="active">
                        <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                            <path d="M3 11.5 12 4l9 7.5"/>
                            <path d="M5.5 10.5V20h13v-9.5"/>
                            <path d="M9.5 20v-5h5v5"/>
                        </svg>
                        Inicio
                    </a>
                </li>

                <li>
                    <a href="#sobre-mi">
                        <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                            <circle cx="12" cy="8" r="4"/>
                            <path d="M4.5 21a7.5 7.5 0 0 1 15 0"/>
                        </svg>
                        Perfil
                    </a>
                </li>

                <li>
                    <a href="#habilidades">
                        <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                            <path d="m8 8-4 4 4 4"/>
                            <path d="m16 8 4 4-4 4"/>
                            <path d="m14 4-4 16"/>
                        </svg>
                        Tecnologías
                    </a>
                </li>

                <li>
                    <a href="#semanas">
                        <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                            <path d="M4 19V5"/>
                            <path d="M4 7h8a3 3 0 0 1 3 3v9"/>
                            <path d="M15 11h5"/>
                            <path d="M15 15h5"/>
                        </svg>
                        Mi recorrido
                    </a>
                </li>

                <li>
                    <a href="#contacto">
                        <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                            <path d="M4 5h16v14H4z"/>
                            <path d="m4 7 8 6 8-6"/>
                        </svg>
                        Hablemos
                    </a>
                </li>

            </ul>

        </nav>

        <a href="#contacto"
           class="nav-cta">
            <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                <path d="M22 2 11 13"/>
                <path d="m22 2-7 20-4-9-9-4 20-7Z"/>
            </svg>
            Contactar
        </a>

    </div>

</header>


<!-- =====================================================
     INICIO / HERO
     ===================================================== -->

<section class="hero"
         id="inicio">

    <div class="hero-container">


        <!-- PANEL SISTEMA -->

        <aside class="system-panel">

            <div class="system-identity">
                <span>AP</span>
                <strong>AprHd</strong>
            </div>

            <div class="system-row">
                <span>ESTADO</span>
                <strong>ONLINE</strong>
            </div>

            <div class="system-row">
                <span>PORTAFOLIO</span>
                <strong>2026</strong>
            </div>

            <div class="system-row">
                <span>SEMESTRE</span>
                <strong>16 SEMANAS</strong>
            </div>

            <div class="system-dots" aria-hidden="true">
                <span></span>
                <span></span>
                <span></span>
            </div>

        </aside>


        <!-- TEXTO PRINCIPAL -->

        <div class="hero-content">

            <div class="hero-label">

                <span class="status-dot"></span>

                PORTAFOLIO ACADÉMICO

            </div>


            <h1>

                <span class="hero-kicker">Hola, soy</span>

                <span class="hero-name">${perfil.nombre}</span>

                <strong>${perfil.apellidos}</strong>

            </h1>


            <div class="hero-role">

                <span class="role-line"></span>

                <span>${perfil.carrera}</span>

            </div>


            <p class="hero-description"
              >${perfil.descripcion}</p>


            <div class="hero-actions">

                <a href="#semanas"
                   class="btn-main">

                    <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                        <path d="M5 12h14"/>
                        <path d="m13 6 6 6-6 6"/>
                    </svg>

                    Ver mi trabajo

                    <span class="btn-arrow">
                        <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                            <path d="M5 12h14"/>
                            <path d="m13 6 6 6-6 6"/>
                        </svg>
                    </span>

                </a>


                <a href="#sobre-mi"
                   class="btn-secondary">

                    <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                        <circle cx="12" cy="12" r="9"/>
                        <path d="M12 8v4"/>
                        <path d="M12 16h.01"/>
                    </svg>

                    Conocer más

                </a>

            </div>


            <!-- PEQUEÑOS DATOS -->

            <div class="hero-info">

                <div>

                    <span class="info-number">
                        <svg class="ui-icon stat-icon" viewBox="0 0 24 24" aria-hidden="true">
                            <path d="M8 3v3"/>
                            <path d="M16 3v3"/>
                            <path d="M4 8h16"/>
                            <path d="M5 5h14v16H5z"/>
                        </svg>
                        <span>16</span>
                    </span>

                    <span class="info-text">
                        SEMANAS
                    </span>

                </div>


                <div>

                    <span class="info-number">
                        <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                            <path d="M7 8c-3 0-5 2-5 4s2 4 5 4c2.6 0 4.2-2.4 5-4 .8-1.6 2.4-4 5-4 3 0 5 2 5 4s-2 4-5 4c-2.6 0-4.2-2.4-5-4-.8-1.6-2.4-4-5-4Z"/>
                        </svg>
                        <span>∞</span>
                    </span>

                    <span class="info-text">
                        APRENDIZAJE
                    </span>

                </div>


                <div>

                    <span class="info-number">
                        <svg class="ui-icon stat-icon" viewBox="0 0 24 24" aria-hidden="true">
                            <path d="M4 4h16v16H4z"/>
                            <path d="M8 9h8"/>
                            <path d="M8 13h5"/>
                        </svg>
                        <span>01</span>
                    </span>

                    <span class="info-text">
                        PORTAFOLIO
                    </span>

                </div>

            </div>

        </div>


        <!-- FOTO -->

        <div class="hero-visual">

            <div class="visual-decoration decoration-one"></div>

            <div class="visual-decoration decoration-two"></div>


            <div class="profile-container">

                <div class="profile-scan"></div>

                <div class="profile-ring"></div>

                <div class="hud-ring hud-ring-one"></div>

                <div class="hud-ring hud-ring-two"></div>

                <div class="hud-dot dot-one"></div>

                <div class="hud-dot dot-two"></div>

                <div class="hud-dot dot-three"></div>


                <div class="profile-image-box">

                    <img
                            class="profile-photo"

                            style="${not empty perfil.foto ? '' : 'display:none'}"

                            src="${pageContext.request.contextPath}/publico/imagen/${perfil.foto}"

                            alt="${perfil.nombre} ${perfil.apellidos}">


                    <img
                            class="profile-photo"

                            style="${empty perfil.foto ? '' : 'display:none'}"

                            src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=700&q=80"

                            alt="Foto de perfil">

                </div>


                <div class="tech-orbit tech-html">
                    <span>HTML</span>
                    <svg class="tech-logo html-logo" viewBox="0 0 128 128" aria-hidden="true">
                        <path fill="#E44D26" d="M19 3h90l-8 99-37 10-37-10L19 3Z"/>
                        <path fill="#F16529" d="M64 104l30-8 7-85H64v93Z"/>
                        <path fill="#EBEBEB" d="M64 47H49l-1-12h16V23H35l3 36h26V47Zm0 31-13-4-1-10H38l2 20 24 7V78Z"/>
                        <path fill="#FFFFFF" d="M64 47v12h14l-1 15-13 4v13l24-7 3-37H64Zm0-24v12h28l1-12H64Z"/>
                    </svg>
                </div>

                <div class="tech-orbit tech-css">
                    <span>CSS</span>
                    <svg class="tech-logo css-logo" viewBox="0 0 128 128" aria-hidden="true">
                        <path fill="#1572B6" d="M19 3h90l-8 99-37 10-37-10L19 3Z"/>
                        <path fill="#33A9DC" d="M64 104l30-8 7-85H64v93Z"/>
                        <path fill="#FFFFFF" d="M64 49h15l1-12H64V25h29l-3 36H64V49Zm0 29 13-4 1-10h12l-2 20-24 7V78Z"/>
                        <path fill="#EBEBEB" d="M64 25v12H36l-1-12h29Zm0 24v12H51l1 13 12 4v13l-24-7-3-35h27Z"/>
                    </svg>
                </div>

                <div class="tech-orbit tech-js">
                    <span>JS</span>
                    <svg class="tech-logo js-logo" viewBox="0 0 128 128" aria-hidden="true">
                        <path fill="#F7DF1E" d="M14 14h100v100H14z"/>
                        <path fill="#000000" d="M40 91l8-5c2 4 4 7 9 7 4 0 7-2 7-9V43h13v41c0 14-8 21-20 21-11 0-17-6-20-13l3-1Zm44-1 8-5c3 5 6 8 12 8 5 0 8-2 8-6 0-5-4-6-10-9l-3-1c-10-4-16-9-16-19 0-9 7-17 19-17 8 0 14 3 19 10l-8 6c-2-4-5-5-9-5s-7 2-7 5c0 4 2 5 9 8l3 1c11 5 17 10 17 20 0 12-9 19-22 19-12 0-20-6-24-14l4-1Z"/>
                    </svg>
                </div>

                <div class="tech-orbit tech-java">
                    <span>Java</span>
                    <svg class="tech-logo java-logo" viewBox="0 0 128 128" aria-hidden="true">
                        <path fill="#F89820" d="M67 7c9 10-4 17-4 25 0 6 6 10 6 10s-17-5-15-16C56 17 72 14 67 7Z"/>
                        <path fill="#5382A1" d="M81 38c0 0-28 7-15 22 4 5-1 9-1 9s13-6 7-14c-6-9 9-17 9-17Z"/>
                        <path fill="#5382A1" d="M38 76s-6 4 4 6c12 3 37 2 50-1 0 0 4 2 9 4-32 14-73-1-63-9Z"/>
                        <path fill="#5382A1" d="M35 91s-7 5 4 8c15 5 67 6 81-1 0 0 5 4 6 5-37 22-101 2-91-12Z"/>
                        <path fill="#5382A1" d="M47 62s-5 4 3 5c10 2 31 2 41-1 0 0 3 3 8 4-29 9-61 1-52-8Z"/>
                        <path fill="#F89820" d="M93 102s4 3-4 5c-16 5-66 6-80 0-5-2 4-6 7-6 3-1 5-1 5-1-6-4-38 8-16 12 59 10 108-5 88-10Z"/>
                    </svg>
                </div>

            </div>

            <div class="terminal-card">
                <div class="terminal-title">&gt; ESTUDIANTE.EXE</div>
                <div class="terminal-line">&gt; Diseño Web....... <span>[OK]</span></div>
                <div class="terminal-line">&gt; Programación..... <span>[OK]</span></div>
                <div class="terminal-line">&gt; Nuevos proyectos. <span>[OK]</span></div>
                <div class="terminal-line">&gt; Mejor versión.... <span>[Loading]</span></div>
                <div class="terminal-progress">
                    <span></span>
                </div>
            </div>

            <div class="quote-card">
                <p>“La tecnología no solo se aprende,<br>se vive.”</p>
                <span>// AprHd</span>
            </div>

        </div>

    </div>

</section>


<!-- =====================================================
     SOBRE MÍ
     ===================================================== -->

<section class="about-section"
         id="sobre-mi">

    <div class="section-heading">

        <span class="section-tag">
            01 / PERFIL
        </span>

        <h2>
            Conóceme un poco
        </h2>

        <p>
            Una mirada a mi formación, intereses y forma
            de entender el desarrollo web.
        </p>

    </div>


    <div class="about-layout">


        <!-- DESCRIPCIÓN PRINCIPAL -->

        <div class="about-main-card">

            <div class="card-number">
                01
            </div>

            <h3>
                Sobre mí
            </h3>

            <p>${perfil.sobreMi}</p>

            <div class="card-line"></div>

            <span class="card-caption">
                CREATIVIDAD + TECNOLOGÍA
            </span>

        </div>


        <!-- TARJETAS -->

        <div class="about-side">


            <div class="mini-card">

                <span class="mini-icon">
                    <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                        <path d="M12 3 4 8l8 5 8-5-8-5Z"/>
                        <path d="m4 13 8 5 8-5"/>
                    </svg>
                </span>

                <div>

                    <h3>
                        Diseño
                    </h3>

                    <p>
                        Me enfoco en interfaces claras,
                        atractivas y cómodas para el usuario.
                    </p>

                </div>

            </div>


            <div class="mini-card">

                <span class="mini-icon">
                    <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                        <path d="m8 9-4 3 4 3"/>
                        <path d="m16 9 4 3-4 3"/>
                        <path d="m14 5-4 14"/>
                    </svg>
                </span>

                <div>

                    <h3>
                        Desarrollo
                    </h3>

                    <p>
                        Transformo conceptos en aplicaciones
                        web funcionales y dinámicas.
                    </p>

                </div>

            </div>


            <div class="mini-card">

                <span class="mini-icon">
                    <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                        <path d="M5 19 19 5"/>
                        <path d="M9 5h10v10"/>
                    </svg>
                </span>

                <div>

                    <h3>
                        Evolución
                    </h3>

                    <p>
                        Cada proyecto representa una nueva
                        oportunidad para mejorar mis habilidades.
                    </p>

                </div>

            </div>

        </div>

    </div>

</section>


<!-- =====================================================
     TECNOLOGÍAS
     ===================================================== -->

<section class="skills-section"
         id="habilidades">


    <div class="section-heading">

        <span class="section-tag">
            02 / STACK
        </span>

        <h2>
            Arsenal tecnológico
        </h2>

        <p>
            Tecnologías que forman parte de mi proceso
            de formación como desarrollador web.
        </p>

    </div>


    <div class="skills-grid">


        <div class="skill-card">

            <span class="skill-index">
                01
            </span>

            <div class="skill-icon">
                <svg class="tech-logo html-logo" viewBox="0 0 128 128" aria-hidden="true">
                    <path fill="#E44D26" d="M19 3h90l-8 99-37 10-37-10L19 3Z"/>
                    <path fill="#F16529" d="M64 104l30-8 7-85H64v93Z"/>
                    <path fill="#EBEBEB" d="M64 47H49l-1-12h16V23H35l3 36h26V47Zm0 31-13-4-1-10H38l2 20 24 7V78Z"/>
                    <path fill="#FFFFFF" d="M64 47v12h14l-1 15-13 4v13l24-7 3-37H64Zm0-24v12h28l1-12H64Z"/>
                </svg>
            </div>

            <h3>
                HTML
            </h3>

            <p>
                Construcción de estructuras web semánticas
                y organizadas.
            </p>

            <span class="skill-arrow">
                <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                    <path d="M5 12h14"/>
                    <path d="m13 6 6 6-6 6"/>
                </svg>
            </span>

        </div>


        <div class="skill-card">

            <span class="skill-index">
                02
            </span>

            <div class="skill-icon">
                <svg class="tech-logo css-logo" viewBox="0 0 128 128" aria-hidden="true">
                    <path fill="#1572B6" d="M19 3h90l-8 99-37 10-37-10L19 3Z"/>
                    <path fill="#33A9DC" d="M64 104l30-8 7-85H64v93Z"/>
                    <path fill="#FFFFFF" d="M64 49h15l1-12H64V25h29l-3 36H64V49Zm0 29 13-4 1-10h12l-2 20-24 7V78Z"/>
                    <path fill="#EBEBEB" d="M64 25v12H36l-1-12h29Zm0 24v12H51l1 13 12 4v13l-24-7-3-35h27Z"/>
                </svg>
            </div>

            <h3>
                CSS
            </h3>

            <p>
                Creación de interfaces visuales, diseños
                adaptables y efectos modernos.
            </p>

            <span class="skill-arrow">
                <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                    <path d="M5 12h14"/>
                    <path d="m13 6 6 6-6 6"/>
                </svg>
            </span>

        </div>


        <div class="skill-card">

            <span class="skill-index">
                03
            </span>

            <div class="skill-icon">
                <svg class="tech-logo js-logo" viewBox="0 0 128 128" aria-hidden="true">
                    <path fill="#F7DF1E" d="M14 14h100v100H14z"/>
                    <path fill="#000000" d="M40 91l8-5c2 4 4 7 9 7 4 0 7-2 7-9V43h13v41c0 14-8 21-20 21-11 0-17-6-20-13l3-1Zm44-1 8-5c3 5 6 8 12 8 5 0 8-2 8-6 0-5-4-6-10-9l-3-1c-10-4-16-9-16-19 0-9 7-17 19-17 8 0 14 3 19 10l-8 6c-2-4-5-5-9-5s-7 2-7 5c0 4 2 5 9 8l3 1c11 5 17 10 17 20 0 12-9 19-22 19-12 0-20-6-24-14l4-1Z"/>
                </svg>
            </div>

            <h3>
                JavaScript
            </h3>

            <p>
                Interactividad y comportamiento dinámico
                para las aplicaciones web.
            </p>

            <span class="skill-arrow">
                <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                    <path d="M5 12h14"/>
                    <path d="m13 6 6 6-6 6"/>
                </svg>
            </span>

        </div>


        <div class="skill-card">

            <span class="skill-index">
                04
            </span>

            <div class="skill-icon">
                <svg class="tech-logo java-logo" viewBox="0 0 128 128" aria-hidden="true">
                    <path fill="#F89820" d="M67 7c9 10-4 17-4 25 0 6 6 10 6 10s-17-5-15-16C56 17 72 14 67 7Z"/>
                    <path fill="#5382A1" d="M81 38c0 0-28 7-15 22 4 5-1 9-1 9s13-6 7-14c-6-9 9-17 9-17Z"/>
                    <path fill="#5382A1" d="M38 76s-6 4 4 6c12 3 37 2 50-1 0 0 4 2 9 4-32 14-73-1-63-9Z"/>
                    <path fill="#5382A1" d="M35 91s-7 5 4 8c15 5 67 6 81-1 0 0 5 4 6 5-37 22-101 2-91-12Z"/>
                    <path fill="#5382A1" d="M47 62s-5 4 3 5c10 2 31 2 41-1 0 0 3 3 8 4-29 9-61 1-52-8Z"/>
                    <path fill="#F89820" d="M93 102s4 3-4 5c-16 5-66 6-80 0-5-2 4-6 7-6 3-1 5-1 5-1-6-4-38 8-16 12 59 10 108-5 88-10Z"/>
                </svg>
            </div>

            <h3>
                Java
            </h3>

            <p>
                Programación orientada a objetos y desarrollo
                de aplicaciones.
            </p>

            <span class="skill-arrow">
                <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                    <path d="M5 12h14"/>
                    <path d="m13 6 6 6-6 6"/>
                </svg>
            </span>

        </div>


        <div class="skill-card">

            <span class="skill-index">
                05
            </span>

            <div class="skill-icon">
                <svg class="tech-logo spring-logo" viewBox="0 0 128 128" aria-hidden="true">
                    <path fill="#6DB33F" d="M116 13c-10 3-18 4-29 3C48 13 18 37 18 70c0 22 16 40 39 44 25 5 48-8 59-31 9-19 8-44 0-70Z"/>
                    <path fill="#FFFFFF" d="M35 82c14 18 45 19 63-3-9 8-25 10-39 6-12-3-21-11-24-22-5 21 0 19 0 19Z" opacity=".9"/>
                    <path fill="#FFFFFF" d="M25 92c22 22 61 20 82-4-15 33-63 40-90 12 3-3 5-6 8-8Z"/>
                    <path fill="#FFFFFF" d="M82 28c13 7 21 19 24 34-10-20-29-30-51-28 8-5 18-7 27-6Z" opacity=".75"/>
                </svg>
            </div>

            <h3>
                Spring Boot
            </h3>

            <p>
                Construcción de aplicaciones web y servicios
                utilizando el ecosistema Spring.
            </p>

            <span class="skill-arrow">
                <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                    <path d="M5 12h14"/>
                    <path d="m13 6 6 6-6 6"/>
                </svg>
            </span>

        </div>


        <div class="skill-card">

            <span class="skill-index">
                06
            </span>

            <div class="skill-icon">
                <svg class="tech-logo mysql-logo" viewBox="0 0 128 128" aria-hidden="true">
                    <path fill="#00618A" d="M19 77c0-21 25-38 55-38 12 0 24 3 33 8-8-12-25-21-45-21-30 0-54 18-54 40 0 11 6 21 17 28-4-5-6-11-6-17Z"/>
                    <path fill="#E48E00" d="M103 53c9 4 15 10 16 18 1 8-3 14-12 18 3-6 1-13-5-19-7-7-19-11-33-11-18 0-35 7-45 18 8-15 27-25 49-25 11 0 21 2 30 1Z"/>
                    <path fill="#00618A" d="M60 72c9-10 24-12 36-4-14-2-27 2-36 15-5 7-8 16-10 27-5-17-2-30 10-38Z"/>
                    <path fill="#FFFFFF" d="M93 71c3 1 5 3 5 6 0 2-2 4-5 4-4 0-6-2-6-5 0-2 3-5 6-5Z"/>
                </svg>
            </div>

            <h3>
                MySQL
            </h3>

            <p>
                Organización, almacenamiento y gestión
                de información mediante bases de datos.
            </p>

            <span class="skill-arrow">
                <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                    <path d="M5 12h14"/>
                    <path d="m13 6 6 6-6 6"/>
                </svg>
            </span>

        </div>


        <div class="skill-card">

            <span class="skill-index">
                07
            </span>

            <div class="skill-icon">
                <svg class="tech-logo intellij-logo" viewBox="0 0 128 128" aria-hidden="true">
                    <defs>
                        <linearGradient id="ideaGradient" x1="14" x2="114" y1="114" y2="14">
                            <stop offset="0" stop-color="#FE2857"/>
                            <stop offset=".45" stop-color="#7F52FF"/>
                            <stop offset="1" stop-color="#00C4FF"/>
                        </linearGradient>
                    </defs>
                    <path fill="url(#ideaGradient)" d="M14 14h100v100H14z"/>
                    <path fill="#000000" d="M35 31h58v58H35z"/>
                    <path fill="#FFFFFF" d="M43 79h22v5H43zM44 44h6v27h-6V44Zm10 0h21v5h-8v22h-6V49h-7v-5Zm25 0h6v27h-6V44Z"/>
                </svg>
            </div>

            <h3>
                IntelliJ IDEA
            </h3>

            <p>
                Entorno de desarrollo utilizado para organizar
                y trabajar este proyecto.
            </p>

            <span class="skill-arrow">
                <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                    <path d="M5 12h14"/>
                    <path d="m13 6 6 6-6 6"/>
                </svg>
            </span>

        </div>

    </div>

</section>


<!-- =====================================================
     SEMANAS
     ===================================================== -->

<section class="journey-section"
         id="semanas">


    <div class="section-heading">

        <span class="section-tag">
            03 / RECORRIDO
        </span>

        <h2>
            Mi camino de aprendizaje
        </h2>

        <p>
            Explora las 16 etapas de mi formación y descubre
            los trabajos realizados en cada semana.
        </p>

    </div>


    <div class="journey-grid">


        <c:forEach var="semana" items="${semanas}"><a
               

                href="${pageContext.request.contextPath}/semana/${semana.id}"

                class="journey-card">


            <div class="journey-top">

                <span class="journey-number"
                      ><fmt:formatNumber value="${semana.numero}" minIntegerDigits="2" groupingUsed="false" /></span>

                <span class="journey-arrow">
                    <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                        <path d="M5 19 19 5"/>
                        <path d="M9 5h10v10"/>
                    </svg>
                </span>

            </div>


            <div class="journey-content">

                <span>
                    SEMANA
                </span>

                <h3>${semana.titulo}</h3>

                <p>${semana.descripcion}</p>

            </div>


            <div class="journey-line"></div>

        </a></c:forEach>


    </div>

</section>


<!-- =====================================================
     PROYECTOS
     ===================================================== -->

<section class="projects-section"
         id="proyectos">


    <div class="section-heading">

        <span class="section-tag">
            04 / PROYECTOS
        </span>

        <h2>
            Lo que estoy construyendo
        </h2>

        <p>
            Algunos de los proyectos que representan mi
            evolución durante la carrera.
        </p>

    </div>


    <div class="projects-grid">


        <article class="project-card project-large">

            <div class="project-number">
                01
            </div>

            <div class="project-icon">
                <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                    <path d="m8 9-4 3 4 3"/>
                    <path d="m16 9 4 3-4 3"/>
                    <path d="m14 5-4 14"/>
                </svg>
            </div>

            <div class="project-content">

                <span>
                    DESARROLLO WEB
                </span>

                <h3>
                    Aplicaciones digitales
                </h3>

                <p>
                    Proyectos orientados a resolver necesidades
                    mediante aplicaciones web funcionales.
                </p>

            </div>

            <span class="project-symbol">
                <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                    <path d="M5 19 19 5"/>
                    <path d="M9 5h10v10"/>
                </svg>
            </span>

        </article>


        <article class="project-card">

            <div class="project-number">
                02
            </div>

            <div class="project-icon">
                <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                    <path d="M4 5h16v14H4z"/>
                    <path d="M8 9h8"/>
                    <path d="M8 13h5"/>
                    <path d="M16 16h.01"/>
                </svg>
            </div>

            <div class="project-content">

                <span>
                    INTERFAZ
                </span>

                <h3>
                    Experiencias visuales
                </h3>

                <p>
                    Diseños pensados para combinar estética,
                    claridad y facilidad de navegación.
                </p>

            </div>

            <span class="project-symbol">
                <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                    <path d="M5 19 19 5"/>
                    <path d="M9 5h10v10"/>
                </svg>
            </span>

        </article>


        <article class="project-card">

            <div class="project-number">
                03
            </div>

            <div class="project-icon">
                <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                    <ellipse cx="12" cy="6" rx="7" ry="3"/>
                    <path d="M5 6v6c0 1.7 3.1 3 7 3s7-1.3 7-3V6"/>
                    <path d="M5 12v6c0 1.7 3.1 3 7 3s7-1.3 7-3v-6"/>
                </svg>
            </div>

            <div class="project-content">

                <span>
                    BACKEND
                </span>

                <h3>
                    Sistemas y datos
                </h3>

                <p>
                    Aplicaciones conectadas a bases de datos
                    para gestionar información.
                </p>

            </div>

            <span class="project-symbol">
                <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                    <path d="M5 19 19 5"/>
                    <path d="M9 5h10v10"/>
                </svg>
            </span>

        </article>


    </div>

</section>


<!-- =====================================================
     CONTACTO
     ===================================================== -->

<section class="contact-section"
         id="contacto">


    <div class="contact-container">


        <div class="contact-heading">

            <span class="section-tag">
                05 / CONTACTO
            </span>

            <h2>
                ¿Tienes una idea?
                <strong>
                    Hablemos.
                </strong>
            </h2>

            <p>
                Si quieres conocer mis proyectos, compartir
                una propuesta o simplemente conversar,
                puedes escribirme.
            </p>

        </div>


        <div class="contact-details">


            <!-- CORREO -->

            <div
                    class="contact-item"

                    style="${not empty perfil.correo ? '' : 'display:none'}">

                <span class="contact-label">
                    CORREO
                </span>

                <a
                        href="mailto:${perfil.correo}"

                       >${perfil.correo}</a>

            </div>


            <!-- TELÉFONO -->

            <div
                    class="contact-item"

                    style="${not empty perfil.telefono ? '' : 'display:none'}">

                <span class="contact-label">
                    TELÉFONO
                </span>

                <span>${perfil.telefono}</span>

            </div>


            <button
                    type="button"

                    id="btnAbrirMensaje"

                    class="contact-button">

                <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                    <path d="M4 5h16v14H4z"/>
                    <path d="m4 7 8 6 8-6"/>
                </svg>

                <span>
                    Enviar un mensaje
                </span>

                <strong>
                    <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                        <path d="M5 12h14"/>
                        <path d="m13 6 6 6-6 6"/>
                    </svg>
                </strong>

            </button>

        </div>

    </div>

</section>


<!-- =====================================================
     MODAL DE CONTACTO
     ===================================================== -->

<div id="modalMensaje"
     class="modal-overlay">


    <div class="modal-contacto">


        <button
                type="button"

                id="btnCerrarMensaje"

                class="modal-close"

                aria-label="Cerrar">

            ×

        </button>


        <div class="modal-header">

            <span class="modal-number">
                CONTACTO
            </span>

            <div class="modal-icon">
                <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                    <path d="M4 5h16v14H4z"/>
                    <path d="m4 7 8 6 8-6"/>
                </svg>
            </div>

            <h2>
                Escríbeme
            </h2>

            <p>
                Déjame tus datos y tu mensaje. Revisaré
                tu solicitud y responderé lo antes posible.
            </p>

        </div>


        <form
                id="formularioContacto"

                action="${pageContext.request.contextPath}/mensaje/enviar"

                method="post">


            <div class="form-group">

                <label for="nombre">
                    Nombre completo
                </label>

                <input
                        type="text"

                        id="nombre"

                        name="nombre"

                        placeholder="Tu nombre"

                        required>

            </div>


            <div class="form-group">

                <label for="correo">
                    Correo electrónico
                </label>

                <input
                        type="email"

                        id="correo"

                        name="correo"

                        placeholder="tu@email.com"

                        required>

            </div>


            <div class="form-group">

                <label for="asunto">
                    Asunto
                </label>

                <input
                        type="text"

                        id="asunto"

                        name="asunto"

                        placeholder="Motivo del mensaje"

                        required>

            </div>


            <div class="form-group">

                <label for="mensaje">
                    Mensaje
                </label>

                <textarea
                        id="mensaje"

                        name="mensaje"

                        placeholder="Cuéntame qué tienes en mente..."

                        required></textarea>

            </div>


            <div class="modal-buttons">


                <button
                        type="button"

                        id="btnCancelarMensaje"

                        class="btn-cancel">

                    Cancelar

                </button>


                <button
                        type="submit"

                        class="btn-send">

                    <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                        <path d="M4 5h16v14H4z"/>
                        <path d="m4 7 8 6 8-6"/>
                    </svg>

                    Enviar mensaje

                    <span>
                        <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                            <path d="M5 12h14"/>
                            <path d="m13 6 6 6-6 6"/>
                        </svg>
                    </span>

                </button>


            </div>

        </form>

    </div>

</div>


<!-- =====================================================
     FOOTER
     ===================================================== -->

<footer class="footer">


    <div class="footer-container">


        <div class="footer-brand">

            <span class="brand-symbol">
                AP
            </span>

            <span>
                AprHd
            </span>

        </div>


        <p>

            © 2026 Antonio Prado H · AprHd · Diseño y Programación Web

        </p>


        <a href="#inicio"
           class="footer-top">

            <svg class="ui-icon" viewBox="0 0 24 24" aria-hidden="true">
                <path d="M12 19V5"/>
                <path d="m6 11 6-6 6 6"/>
            </svg>
            Volver arriba

        </a>

    </div>

</footer>


<!-- =====================================================
     JAVASCRIPT
     ===================================================== -->

<script src="${pageContext.request.contextPath}/js/publico.js"></script>


</body>

</html>








