<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Bienvenido | AprHd</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/login.css">
</head>

<body>

<main class="login-page">

    <section class="login-panel" aria-label="Inicio de sesión">

        <div class="login-brand">
            <div class="login-logo" aria-hidden="true">
                <svg viewBox="0 0 24 24">
                    <path d="m8 9-4 3 4 3"/>
                    <path d="m16 9 4 3-4 3"/>
                    <path d="m14 5-4 14"/>
                </svg>
            </div>

            <span>AprHd</span>
        </div>

        <header class="login-header">
            <h1>Bienvenido</h1>
            <p>Inicia sesión para acceder al portafolio</p>
        </header>

        <div class="login-alert login-alert-error"
             style="${not empty param.error ? '' : 'display:none'}">
            <span aria-hidden="true">!</span>
            <p>Usuario o contraseña incorrectos.</p>
        </div>

        <div class="login-alert login-alert-success"
             style="${not empty param.logout ? '' : 'display:none'}">
            <span aria-hidden="true">✓</span>
            <p>Sesión cerrada correctamente.</p>
        </div>

        <form class="login-form"
              method="post"
              action="${pageContext.request.contextPath}/login">

            <input type="hidden"
                   name="${_csrf.parameterName}"
                   value="${_csrf.token}">

            <div class="field-group">
                <label for="username">Usuario</label>

                <div class="field-control">
                    <span class="field-icon" aria-hidden="true">
                        <svg viewBox="0 0 24 24">
                            <circle cx="12" cy="8" r="4"/>
                            <path d="M4.5 21a7.5 7.5 0 0 1 15 0"/>
                        </svg>
                    </span>

                    <input type="text"
                           id="username"
                           name="username"
                           placeholder="Ingresa tu usuario"
                           autocomplete="username"
                           required>
                </div>
            </div>

            <div class="field-group">
                <label for="password">Contraseña</label>

                <div class="field-control">
                    <span class="field-icon" aria-hidden="true">
                        <svg viewBox="0 0 24 24">
                            <rect x="5" y="10" width="14" height="10" rx="2"/>
                            <path d="M8 10V7a4 4 0 0 1 8 0v3"/>
                        </svg>
                    </span>

                    <input class="password-input"
                           type="password"
                           id="password"
                           name="password"
                           placeholder="Ingresa tu contraseña"
                           autocomplete="current-password"
                           required>

                    <button type="button"
                            class="toggle-password"
                            id="togglePassword"
                            aria-label="Mostrar contraseña">
                        <svg class="icon-eye" viewBox="0 0 24 24" aria-hidden="true">
                            <path d="M2 12s3.5-6 10-6 10 6 10 6-3.5 6-10 6S2 12 2 12Z"/>
                            <circle cx="12" cy="12" r="3"/>
                        </svg>
                        <svg class="icon-eye-off" viewBox="0 0 24 24" aria-hidden="true">
                            <path d="m3 3 18 18"/>
                            <path d="M10.6 10.6A3 3 0 0 0 12 15a3 3 0 0 0 2.4-4.8"/>
                            <path d="M9.8 5.3A10.9 10.9 0 0 1 12 5c6.5 0 10 7 10 7a15.4 15.4 0 0 1-3.1 4.1"/>
                            <path d="M6.6 6.8C3.8 8.7 2 12 2 12s3.5 7 10 7a10.8 10.8 0 0 0 5.1-1.3"/>
                        </svg>
                    </button>
                </div>
            </div>

            <button type="submit"
                    class="login-button">
                Iniciar sesión
            </button>

        </form>

        <footer class="login-footer">
            <span>Acceso seguro · Portafolio académico</span>
        </footer>

    </section>

</main>

<script src="${pageContext.request.contextPath}/js/login.js"></script>
</body>
</html>
