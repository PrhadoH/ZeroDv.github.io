package com.portafolio.Taeha.controller.admin;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.portafolio.Taeha.model.Perfil;
import com.portafolio.Taeha.repository.PerfilRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

@Controller
@RequestMapping("/admin/perfil")
public class PerfilAdminController {

    private final PerfilRepository perfilRepository;
    private final Cloudinary cloudinary;

    public PerfilAdminController(
            PerfilRepository perfilRepository,
            Cloudinary cloudinary) {

        this.perfilRepository = perfilRepository;
        this.cloudinary = cloudinary;
    }

    @GetMapping
    public String mostrarPerfil(Model model) {

        Perfil perfil;

        if (perfilRepository.count() == 0) {
            perfil = new Perfil();
        } else {
            perfil = perfilRepository.findAll().get(0);
        }

        model.addAttribute("perfil", perfil);

        return "admin/perfil";
    }

    @PostMapping("/guardar")
    public String guardarPerfil(
            @ModelAttribute Perfil perfil,
            @RequestParam(value = "archivoFoto", required = false)
            MultipartFile archivoFoto) {

        Perfil perfilGuardar;

        if (perfilRepository.count() > 0) {
            perfilGuardar = perfilRepository.findAll().get(0);
        } else {
            perfilGuardar = new Perfil();
        }

        perfilGuardar.setNombre(perfil.getNombre());
        perfilGuardar.setApellidos(perfil.getApellidos());
        perfilGuardar.setCarrera(perfil.getCarrera());
        perfilGuardar.setInstituto(perfil.getInstituto());

        perfilGuardar.setDescripcion(perfil.getDescripcion());
        perfilGuardar.setSobreMi(perfil.getSobreMi());

        perfilGuardar.setCorreo(perfil.getCorreo());
        perfilGuardar.setTelefono(perfil.getTelefono());

        perfilGuardar.setGithub(perfil.getGithub());
        perfilGuardar.setLinkedin(perfil.getLinkedin());

        // FOTO EN CLOUDINARY
        if (archivoFoto != null && !archivoFoto.isEmpty()) {

            try {
                Map resultado = cloudinary.uploader().upload(
                        archivoFoto.getBytes(),
                        ObjectUtils.asMap(
                                "folder", "taeha/perfiles",
                                "resource_type", "image"
                        )
                );

                String urlFoto =
                        resultado.get("secure_url").toString();

                perfilGuardar.setFoto(urlFoto);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        perfilRepository.save(perfilGuardar);

        return "redirect:/admin/perfil";
    }
}