<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<aside class="sidebar" id="adminSidebar">

    <button class="admin-menu-toggle"
            type="button"
            aria-label="Abrir menú administrativo"
            aria-expanded="false">
        <span></span>
        <span></span>
        <span></span>
    </button>

    <div class="sidebar-shell">

        <div class="sidebar-header">
            <div class="brand-icon">AP</div>

            <div class="brand-info">
                <h2>AprHd</h2>
                <span>ADMIN PANEL</span>
            </div>
        </div>

        <div class="admin-card">
            <div class="admin-avatar">AP</div>

            <div class="admin-info">
                <strong>Antonio</strong>
                <span>SYSTEM ONLINE</span>
            </div>

            <div class="online-dot"></div>
        </div>

        <div class="menu-title">
            CONTROL CENTER
        </div>

        <nav class="menu" aria-label="Navegación administrativa">

            <a href="${pageContext.request.contextPath}/admin"
               class="menu-item ${activePage == 'dashboard' ? 'active' : ''}">
                <span class="menu-icon">
                    <svg viewBox="0 0 24 24" aria-hidden="true">
                        <rect x="3" y="3" width="7" height="7"/>
                        <rect x="14" y="3" width="7" height="7"/>
                        <rect x="3" y="14" width="7" height="7"/>
                        <rect x="14" y="14" width="7" height="7"/>
                    </svg>
                </span>
                <span class="menu-text">Dashboard</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/perfil"
               class="menu-item ${activePage == 'perfil' ? 'active' : ''}">
                <span class="menu-icon">
                    <svg viewBox="0 0 24 24" aria-hidden="true">
                        <circle cx="12" cy="8" r="4"/>
                        <path d="M4.5 21a7.5 7.5 0 0 1 15 0"/>
                    </svg>
                </span>
                <span class="menu-text">Perfil</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/semanas"
               class="menu-item ${activePage == 'semanas' ? 'active' : ''}">
                <span class="menu-icon">
                    <svg viewBox="0 0 24 24" aria-hidden="true">
                        <path d="M4 19V5"/>
                        <path d="M4 7h8a3 3 0 0 1 3 3v9"/>
                        <path d="M15 11h5"/>
                        <path d="M15 15h5"/>
                    </svg>
                </span>
                <span class="menu-text">Semanas</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/trabajos"
               class="menu-item ${activePage == 'trabajos' ? 'active' : ''}">
                <span class="menu-icon">
                    <svg viewBox="0 0 24 24" aria-hidden="true">
                        <path d="M4 6h16"/>
                        <path d="M4 12h16"/>
                        <path d="M4 18h10"/>
                        <path d="m16 16 2 2 3-4"/>
                    </svg>
                </span>
                <span class="menu-text">Trabajos</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/mensajes"
               class="menu-item ${activePage == 'mensajes' ? 'active' : ''}">
                <span class="menu-icon">
                    <svg viewBox="0 0 24 24" aria-hidden="true">
                        <path d="M4 5h16v14H4z"/>
                        <path d="m4 7 8 6 8-6"/>
                    </svg>
                </span>
                <span class="menu-text">Mensajes</span>
                <span class="message-badge"
                      style="${mensajesNoLeidos > 0 ? '' : 'display:none'}">${mensajesNoLeidos}</span>
            </a>

        </nav>

        <div class="sidebar-bottom">

            <div class="menu-title">
                CUENTA
            </div>

            <form method="post"
                  action="${pageContext.request.contextPath}/logout">
                <button class="logout-button"
                        type="submit">
                    <span class="menu-icon">
                        <svg viewBox="0 0 24 24" aria-hidden="true">
                            <path d="M10 17l5-5-5-5"/>
                            <path d="M15 12H3"/>
                            <path d="M14 4h5v16h-5"/>
                        </svg>
                    </span>
                    <span class="menu-text">Cerrar sesión</span>
                </button>
            </form>

            <div class="sidebar-version">
                <span>SYSTEM STATUS: ONLINE</span>
                <small>PORTFOLIO v1.0</small>
            </div>

        </div>

    </div>

</aside>

<script>
    (() => {
        const sidebar = document.getElementById("adminSidebar");
        const toggle = sidebar ? sidebar.querySelector(".admin-menu-toggle") : null;

        if (!sidebar || !toggle) {
            return;
        }

        toggle.addEventListener("click", () => {
            const open = sidebar.classList.toggle("is-open");
            toggle.setAttribute("aria-expanded", String(open));
        });

        sidebar.querySelectorAll(".menu-item").forEach((item) => {
            item.addEventListener("click", () => {
                sidebar.classList.remove("is-open");
                toggle.setAttribute("aria-expanded", "false");
            });
        });
    })();
</script>
