package com.portafolio.Taeha.controller.admin;

import com.portafolio.Taeha.repository.MensajeRepository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice(basePackages = "com.portafolio.Taeha.controller.admin")
public class AdminModelAdvice {

    private final MensajeRepository mensajeRepository;

    public AdminModelAdvice(MensajeRepository mensajeRepository) {
        this.mensajeRepository = mensajeRepository;
    }

    @ModelAttribute
    public void agregarDatosAdmin(Model model) {
        model.addAttribute(
                "mensajesNoLeidos",
                mensajeRepository.countByLeidoFalse()
        );
    }
}
