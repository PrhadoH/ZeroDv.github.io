document.addEventListener("DOMContentLoaded", () => {
    const passwordInput =
        document.getElementById("password");

    const togglePassword =
        document.getElementById("togglePassword");

    if (!passwordInput || !togglePassword) {
        return;
    }

    togglePassword.addEventListener("click", () => {
        const visible =
            passwordInput.type === "password";

        passwordInput.type =
            visible ? "text" : "password";

        togglePassword.classList.toggle(
            "is-visible",
            visible
        );

        togglePassword.setAttribute(
            "aria-label",
            visible
                    ? "Ocultar contraseña"
                    : "Mostrar contraseña"
        );
    });
});
