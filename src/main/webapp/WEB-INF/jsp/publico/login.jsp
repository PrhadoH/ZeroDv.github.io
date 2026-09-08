<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html><html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Acceso | Panel Administrativo</title>


    <style>

        /* =========================================
           RESET
        ========================================= */

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }


        /* =========================================
           BODY
        ========================================= */

        body {

            min-height: 100vh;

            display: flex;

            align-items: center;

            justify-content: center;

            padding: 20px;

            font-family:
                    "Segoe UI",
                    Arial,
                    Helvetica,
                    sans-serif;

            background:
                    radial-gradient(
                            circle at 15% 20%,
                            rgba(59,130,246,0.25),
                            transparent 30%
                    ),
                    radial-gradient(
                            circle at 85% 80%,
                            rgba(99,102,241,0.25),
                            transparent 30%
                    ),
                    linear-gradient(
                            135deg,
                            #020617,
                            #0f172a,
                            #111827
                    );

            overflow: hidden;

        }


        /* =========================================
           FONDO DECORATIVO
        ========================================= */

        .background-circle {

            position: fixed;

            border-radius: 50%;

            filter: blur(2px);

            pointer-events: none;

        }


        .circle-one {

            width: 280px;

            height: 280px;

            top: -100px;

            left: -80px;

            border: 1px solid rgba(96,165,250,0.15);

            background:
                    rgba(59,130,246,0.04);

        }


        .circle-two {

            width: 350px;

            height: 350px;

            right: -130px;

            bottom: -130px;

            border: 1px solid rgba(129,140,248,0.15);

            background:
                    rgba(99,102,241,0.04);

        }


        /* =========================================
           CONTENEDOR
        ========================================= */

        .login-wrapper {

            position: relative;

            width: 100%;

            max-width: 430px;

            animation: containerAppear 0.6s ease;

        }


        @keyframes containerAppear {

            from {

                opacity: 0;

                transform:
                        translateY(25px)
                        scale(0.98);

            }

            to {

                opacity: 1;

                transform:
                        translateY(0)
                        scale(1);

            }

        }


        /* =========================================
           TARJETA
        ========================================= */

        .login-card {

            position: relative;

            padding: 42px;

            background:
                    rgba(15,23,42,0.88);

            border:
                    1px solid rgba(255,255,255,0.08);

            border-radius: 24px;

            box-shadow:
                    0 30px 80px rgba(0,0,0,0.45),
                    inset 0 1px 0 rgba(255,255,255,0.04);

            backdrop-filter: blur(18px);

            -webkit-backdrop-filter: blur(18px);

        }


        /* =========================================
           LOGO
        ========================================= */

        .logo {

            width: 65px;

            height: 65px;

            margin: 0 auto 20px;

            display: flex;

            align-items: center;

            justify-content: center;

            border-radius: 18px;

            background:
                    linear-gradient(
                            135deg,
                            #3b82f6,
                            #6366f1
                    );

            color: white;

            font-size: 28px;

            font-weight: 800;

            box-shadow:
                    0 12px 30px rgba(59,130,246,0.30);

            animation: logoFloat 3s ease-in-out infinite;

        }


        @keyframes logoFloat {

            0%,
            100% {

                transform: translateY(0);

            }

            50% {

                transform: translateY(-4px);

            }

        }


        /* =========================================
           TITULO
        ========================================= */

        .login-title {

            text-align: center;

            color: #f8fafc;

            font-size: 27px;

            font-weight: 750;

            letter-spacing: -0.5px;

        }


        .login-subtitle {

            margin-top: 8px;

            margin-bottom: 32px;

            text-align: center;

            color: #94a3b8;

            font-size: 14px;

            line-height: 1.5;

        }


        /* =========================================
           ALERTAS
        ========================================= */

        .notification {

            display: flex;

            align-items: center;

            gap: 11px;

            margin-bottom: 20px;

            padding: 12px 14px;

            border-radius: 11px;

            font-size: 13px;

            animation:
                    notificationIn 0.35s ease;

        }


        @keyframes notificationIn {

            from {

                opacity: 0;

                transform: translateY(-8px);

            }

            to {

                opacity: 1;

                transform: translateY(0);

            }

        }


        .notification.hide {

            animation:
                    notificationOut 0.35s ease forwards;

        }


        @keyframes notificationOut {

            from {

                opacity: 1;

                transform: translateY(0);

            }

            to {

                opacity: 0;

                transform: translateY(-8px);

            }

        }


        .notification-icon {

            width: 27px;

            height: 27px;

            flex-shrink: 0;

            display: flex;

            align-items: center;

            justify-content: center;

            border-radius: 8px;

            font-weight: bold;

        }


        .notification.error {

            color: #fecaca;

            background:
                    rgba(239,68,68,0.10);

            border:
                    1px solid rgba(239,68,68,0.18);

        }


        .notification.error
        .notification-icon {

            background:
                    rgba(239,68,68,0.18);

            color: #f87171;

        }


        .notification.success {

            color: #bbf7d0;

            background:
                    rgba(34,197,94,0.10);

            border:
                    1px solid rgba(34,197,94,0.18);

        }


        .notification.success
        .notification-icon {

            background:
                    rgba(34,197,94,0.18);

            color: #4ade80;

        }


        /* =========================================
           FORMULARIO
        ========================================= */

        .form-group {

            margin-bottom: 20px;

        }


        .form-label {

            display: block;

            margin-bottom: 8px;

            color: #e2e8f0;

            font-size: 13px;

            font-weight: 600;

        }


        /* =========================================
           INPUT
        ========================================= */

        .input-wrapper {

            position: relative;

        }


        .input-icon {

            position: absolute;

            left: 15px;

            top: 50%;

            transform: translateY(-50%);

            color: #64748b;

            font-size: 17px;

            pointer-events: none;

            transition: color 0.2s ease;

        }


        input {

            width: 100%;

            height: 50px;

            padding:
                    0 15px 0 45px;

            border:
                    1px solid #334155;

            border-radius: 11px;

            outline: none;

            background:
                    rgba(15,23,42,0.75);

            color: #f8fafc;

            font-size: 14px;

            transition:
                    border-color 0.2s ease,
                    box-shadow 0.2s ease,
                    background 0.2s ease;

        }


        input::placeholder {

            color: #64748b;

        }


        input:hover {

            border-color: #475569;

        }


        input:focus {

            border-color: #3b82f6;

            background:
                    rgba(15,23,42,0.95);

            box-shadow:
                    0 0 0 3px rgba(59,130,246,0.12);

        }


        .input-wrapper:focus-within
        .input-icon {

            color: #60a5fa;

        }


        /* =========================================
           OJITO PASSWORD
        ========================================= */

        .password-input {

            padding-right: 48px;

        }


        .toggle-password {

            position: absolute;

            right: 8px;

            top: 50%;

            transform: translateY(-50%);

            width: 36px;

            height: 36px;

            display: flex;

            align-items: center;

            justify-content: center;

            border: none;

            border-radius: 8px;

            background: transparent;

            color: #64748b;

            cursor: pointer;

            font-size: 17px;

            transition:
                    color 0.2s ease,
                    background 0.2s ease;

        }


        .toggle-password:hover {

            color: #60a5fa;

            background:
                    rgba(59,130,246,0.10);

        }


        /* =========================================
           BOTÓN LOGIN
        ========================================= */

        .login-button {

            position: relative;

            width: 100%;

            height: 52px;

            margin-top: 8px;

            border: none;

            border-radius: 11px;

            background:
                    linear-gradient(
                            135deg,
                            #2563eb,
                            #4f46e5
                    );

            color: white;

            font-size: 14px;

            font-weight: 700;

            letter-spacing: 0.2px;

            cursor: pointer;

            overflow: hidden;

            box-shadow:
                    0 10px 25px rgba(37,99,235,0.22);

            transition:
                    transform 0.2s ease,
                    box-shadow 0.2s ease;

        }


        .login-button:hover {

            transform: translateY(-2px);

            box-shadow:
                    0 14px 30px rgba(37,99,235,0.30);

        }


        .login-button:active {

            transform: translateY(0);

        }


        .button-content {

            position: relative;

            z-index: 2;

            display: flex;

            align-items: center;

            justify-content: center;

            gap: 9px;

        }


        /* =========================================
           FOOTER
        ========================================= */

        .login-footer {

            margin-top: 28px;

            padding-top: 20px;

            border-top:
                    1px solid rgba(255,255,255,0.06);

            text-align: center;

            color: #475569;

            font-size: 11px;

        }


        .login-footer strong {

            color: #64748b;

        }


        /* =========================================
           SEGURIDAD
        ========================================= */

        .security-info {

            display: flex;

            align-items: center;

            justify-content: center;

            gap: 7px;

            margin-top: 10px;

            color: #475569;

            font-size: 10px;

        }


        .security-dot {

            width: 6px;

            height: 6px;

            border-radius: 50%;

            background: #22c55e;

            box-shadow:
                    0 0 0 3px rgba(34,197,94,0.08);

        }


        /* =========================================
           RESPONSIVE
        ========================================= */

        @media (max-width: 500px) {

            body {

                padding: 15px;

            }


            .login-card {

                padding: 32px 25px;

                border-radius: 20px;

            }


            .login-title {

                font-size: 24px;

            }


            .logo {

                width: 58px;

                height: 58px;

                font-size: 24px;

            }

        }

    </style>

</head>


<body>


<!-- =========================================
     DECORACIÓN
========================================= -->

<div class="background-circle circle-one"></div>

<div class="background-circle circle-two"></div>


<!-- =========================================
     LOGIN
========================================= -->

<div class="login-wrapper">

    <div class="login-card">


        <!-- LOGO -->

        <div class="logo">
            P
        </div>


        <!-- TITULO -->

        <h1 class="login-title">
            Bienvenido
        </h1>


        <p class="login-subtitle">
            Ingresa al panel administrativo<br>
            de tu portafolio
        </p>


        <!-- =====================================
             ERROR LOGIN
        ====================================== -->

        <div
                style="${not empty param.error ? '' : 'display:none'}"
                class="notification error"
                id="errorNotification">

            <div class="notification-icon">
                !
            </div>

            <span>
                Usuario o contraseña incorrectos.
            </span>

        </div>


        <!-- =====================================
             LOGOUT
        ====================================== -->

        <div
                style="${not empty param.logout ? '' : 'display:none'}"
                class="notification success"
                id="logoutNotification">

            <div class="notification-icon">
                ✓
            </div>

            <span>
                Has cerrado sesión correctamente.
            </span>

        </div>


        <!-- =====================================
             FORMULARIO
        ====================================== -->

        <form method="post"
              action="${pageContext.request.contextPath}/login">


            <!-- USUARIO -->

            <div class="form-group">

                <label
                        class="form-label"
                        for="username">

                    Usuario

                </label>


                <div class="input-wrapper">

                    <span class="input-icon">
                        ◉
                    </span>

                    <input
                            type="text"
                            id="username"
                            name="username"
                            placeholder="Ingrese su usuario"
                            autocomplete="username"
                            required
                    >

                </div>

            </div>


            <!-- CONTRASEÑA -->

            <div class="form-group">

                <label
                        class="form-label"
                        for="password">

                    Contraseña

                </label>


                <div class="input-wrapper">

                    <span class="input-icon">
                        ◆
                    </span>


                    <input
                            class="password-input"
                            type="password"
                            id="password"
                            name="password"
                            placeholder="Ingrese su contraseña"
                            autocomplete="current-password"
                            required
                    >


                    <!-- OJITO -->

                    <button
                            type="button"
                            class="toggle-password"
                            id="togglePassword"
                            aria-label="Mostrar contraseña">

                        👁

                    </button>

                </div>

            </div>


            <!-- BOTÓN -->

            <button
                    type="submit"
                    class="login-button">

                <span class="button-content">

                    <span>
                        Iniciar sesión
                    </span>

                    <span>
                        →
                    </span>

                </span>

            </button>

        </form>


        <!-- =====================================
             FOOTER
        ====================================== -->

        <div class="login-footer">

            <strong>
                PORTAFOLIO ADMIN
            </strong>

            <div class="security-info">

                <span class="security-dot"></span>

                Acceso protegido

            </div>

        </div>

    </div>

</div>


<!-- =========================================
     JAVASCRIPT
========================================= -->

<script>

    /* =========================================
       MOSTRAR / OCULTAR CONTRASEÑA
    ========================================= */

    const passwordInput =
        document.getElementById("password");

    const togglePassword =
        document.getElementById("togglePassword");


    if (togglePassword && passwordInput) {

        togglePassword.addEventListener(
            "click",
            function () {

                if (passwordInput.type === "password") {

                    passwordInput.type = "text";

                    togglePassword.textContent = "🙈";

                    togglePassword.setAttribute(
                        "aria-label",
                        "Ocultar contraseña"
                    );

                } else {

                    passwordInput.type = "password";

                    togglePassword.textContent = "👁";

                    togglePassword.setAttribute(
                        "aria-label",
                        "Mostrar contraseña"
                    );

                }

            }
        );

    }


    /* =========================================
       NOTIFICACIONES
       DESAPARECEN EN 1 SEGUNDO
    ========================================= */

    const notifications =
        document.querySelectorAll(".notification");


    notifications.forEach(function(notification) {

        setTimeout(function() {

            notification.classList.add("hide");

        }, 1000);


        setTimeout(function() {

            notification.remove();

        }, 1400);

    });

</script>


</body>
</html>







