package com.portafolio.Taeha.controller.admin;

import com.portafolio.Taeha.repository.MensajeRepository;
import com.portafolio.Taeha.repository.SemanaRepository;
import com.portafolio.Taeha.repository.TrabajoRepository;
import com.portafolio.Taeha.repository.UsuarioRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class DashboardController {

    private final MensajeRepository mensajeRepository;
    private final SemanaRepository semanaRepository;
    private final TrabajoRepository trabajoRepository;
    private final UsuarioRepository usuarioRepository;

    public DashboardController(
            MensajeRepository mensajeRepository,
            SemanaRepository semanaRepository,
            TrabajoRepository trabajoRepository,
            UsuarioRepository usuarioRepository) {
        this.mensajeRepository = mensajeRepository;
        this.semanaRepository = semanaRepository;
        this.trabajoRepository = trabajoRepository;
        this.usuarioRepository = usuarioRepository;
    }

    @GetMapping
    public String dashboard(Model model) {

        // ==========================================
        // DATOS DEL DASHBOARD
        // ==========================================

        long totalSemanas = semanaRepository.count();

        // Mensajes registrados en MySQL
        long totalMensajes = mensajeRepository.count();

        // Mensajes que todavía no han sido leídos
        long mensajesNoLeidos = mensajeRepository.countByLeidoFalse();

        model.addAttribute(
                "totalSemanas",
                totalSemanas
        );

        model.addAttribute(
                "totalTrabajos",
                trabajoRepository.count()
        );

        model.addAttribute(
                "totalAdministradores",
                usuarioRepository.countByRolAndEstadoTrue("ADMIN")
        );

        model.addAttribute(
                "totalMensajes",
                totalMensajes
        );

        model.addAttribute(
                "mensajesNoLeidos",
                mensajesNoLeidos
        );

        return "admin/dashboard";
    }
}
