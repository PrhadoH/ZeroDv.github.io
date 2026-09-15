package com.portafolio.Taeha.controller.admin;

import com.portafolio.Taeha.model.Semana;
import com.portafolio.Taeha.model.Trabajo;
import com.portafolio.Taeha.repository.SemanaRepository;
import com.portafolio.Taeha.repository.TrabajoRepository;
import com.portafolio.Taeha.service.ArchivoService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/admin/trabajos")
public class TrabajoAdminController {

    private final TrabajoRepository trabajoRepository;
    private final SemanaRepository semanaRepository;
    private final ArchivoService archivoService;

    public TrabajoAdminController(
            TrabajoRepository trabajoRepository,
            SemanaRepository semanaRepository,
            ArchivoService archivoService) {

        this.trabajoRepository = trabajoRepository;
        this.semanaRepository = semanaRepository;
        this.archivoService = archivoService;
    }


    // =========================================================
    // INICIO DE TRABAJOS
    // =========================================================

    @GetMapping
    public String inicioTrabajos(Model model) {

        model.addAttribute(
                "semanas",
                semanaRepository.findAllByOrderByNumeroAsc()
        );

        return "admin/trabajos-index";
    }


    // =========================================================
    // LISTAR TRABAJOS DE UNA SEMANA
    // =========================================================

    @GetMapping("/semana/{semanaId}")
    public String listarTrabajos(
            @PathVariable Long semanaId,
            Model model) {

        Semana semana = semanaRepository.findById(semanaId)
                .orElseThrow(() ->
                        new IllegalArgumentException(
                                "Semana no encontrada: " + semanaId
                        )
                );

        model.addAttribute(
                "semana",
                semana
        );

        model.addAttribute(
                "trabajos",
                trabajoRepository.findBySemanaIdOrderByIdAsc(semanaId)
        );

        return "admin/trabajos";
    }


    // =========================================================
    // NUEVO TRABAJO
    // =========================================================

    @GetMapping("/nuevo/{semanaId}")
    public String nuevoTrabajo(
            @PathVariable Long semanaId,
            Model model) {

        Semana semana = semanaRepository.findById(semanaId)
                .orElseThrow(() ->
                        new IllegalArgumentException(
                                "Semana no encontrada: " + semanaId
                        )
                );

        Trabajo trabajo = new Trabajo();

        trabajo.setSemana(semana);

        model.addAttribute(
                "trabajo",
                trabajo
        );

        model.addAttribute(
                "semana",
                semana
        );

        model.addAttribute(
                "nuevo",
                true
        );

        return "admin/trabajo-form";
    }


    // =========================================================
    // GUARDAR / ACTUALIZAR TRABAJO
    // =========================================================

    @PostMapping("/guardar")
    public String guardarTrabajo(
            @ModelAttribute Trabajo trabajo,

            @RequestParam(
                    value = "imagenArchivo",
                    required = false
            )
            MultipartFile imagenArchivo,

            @RequestParam(
                    value = "archivoTrabajo",
                    required = false
            )
            MultipartFile archivoTrabajo) {


        // =====================================================
        // EDITAR TRABAJO EXISTENTE
        // =====================================================

        if (trabajo.getId() != null) {

            Trabajo trabajoExistente =
                    trabajoRepository.findById(
                            trabajo.getId()
                    ).orElseThrow(() ->
                            new IllegalArgumentException(
                                    "Trabajo no encontrado: "
                                            + trabajo.getId()
                            )
                    );


            // -------------------------------------------------
            // ACTUALIZAR DATOS
            // -------------------------------------------------

            trabajoExistente.setTitulo(
                    trabajo.getTitulo()
            );

            trabajoExistente.setDescripcion(
                    trabajo.getDescripcion()
            );

            trabajoExistente.setEnlace(
                    trabajo.getEnlace()
            );

            trabajoExistente.setSemana(
                    trabajo.getSemana()
            );


            // -------------------------------------------------
            // NUEVA IMAGEN
            // CLOUDINARY
            // -------------------------------------------------

            if (imagenArchivo != null &&
                    !imagenArchivo.isEmpty()) {

                String imagenAnterior =
                        trabajoExistente.getImagen();

                String nuevaImagen =
                        archivoService.guardarImagen(
                                imagenArchivo
                        );

                trabajoExistente.setImagen(
                        nuevaImagen
                );


                // Por ahora ArchivoService no elimina
                // físicamente de Cloudinary.
                if (imagenAnterior != null &&
                        !imagenAnterior.isBlank()) {

                    archivoService.eliminarImagen(
                            imagenAnterior
                    );
                }
            }


            // -------------------------------------------------
            // NUEVO ARCHIVO
            // PDF / WORD / EXCEL / POWERPOINT / TXT
            // CLOUDINARY
            // -------------------------------------------------

            if (archivoTrabajo != null &&
                    !archivoTrabajo.isEmpty()) {

                String archivoAnterior =
                        trabajoExistente.getArchivo();

                String nuevoArchivo =
                        archivoService.guardarArchivo(
                                archivoTrabajo
                        );

                trabajoExistente.setArchivo(
                        nuevoArchivo
                );


                // Por ahora ArchivoService no elimina
                // físicamente de Cloudinary.
                if (archivoAnterior != null &&
                        !archivoAnterior.isBlank()) {

                    archivoService.eliminarArchivo(
                            archivoAnterior
                    );
                }
            }


            // -------------------------------------------------
            // GUARDAR CAMBIOS EN AIVEN / MYSQL
            // -------------------------------------------------

            trabajoRepository.save(
                    trabajoExistente
            );


            return "redirect:/admin/trabajos/semana/"
                    + trabajoExistente
                    .getSemana()
                    .getId();
        }


        // =====================================================
        // CREAR NUEVO TRABAJO
        // =====================================================


        // -----------------------------------------------------
        // GUARDAR IMAGEN EN CLOUDINARY
        // -----------------------------------------------------

        if (imagenArchivo != null &&
                !imagenArchivo.isEmpty()) {

            String urlImagen =
                    archivoService.guardarImagen(
                            imagenArchivo
                    );

            trabajo.setImagen(
                    urlImagen
            );
        }


        // -----------------------------------------------------
        // GUARDAR ARCHIVO EN CLOUDINARY
        // PDF / WORD / EXCEL / POWERPOINT / TXT
        // -----------------------------------------------------

        if (archivoTrabajo != null &&
                !archivoTrabajo.isEmpty()) {

            String urlArchivo =
                    archivoService.guardarArchivo(
                            archivoTrabajo
                    );

            trabajo.setArchivo(
                    urlArchivo
            );
        }


        // -----------------------------------------------------
        // GUARDAR URL Y DATOS EN AIVEN / MYSQL
        // -----------------------------------------------------

        trabajoRepository.save(
                trabajo
        );


        return "redirect:/admin/trabajos/semana/"
                + trabajo.getSemana().getId();
    }


    // =========================================================
    // EDITAR TRABAJO
    // =========================================================

    @GetMapping("/editar/{id}")
    public String editarTrabajo(
            @PathVariable Long id,
            Model model) {

        Trabajo trabajo =
                trabajoRepository.findById(id)
                        .orElseThrow(() ->
                                new IllegalArgumentException(
                                        "Trabajo no encontrado: "
                                                + id
                                )
                        );

        model.addAttribute(
                "trabajo",
                trabajo
        );

        model.addAttribute(
                "semana",
                trabajo.getSemana()
        );

        model.addAttribute(
                "nuevo",
                false
        );

        return "admin/trabajo-form";
    }


    // =========================================================
    // ELIMINAR TRABAJO
    // =========================================================

    @GetMapping("/eliminar/{id}")
    public String eliminarTrabajo(
            @PathVariable Long id) {

        Trabajo trabajo =
                trabajoRepository.findById(id)
                        .orElseThrow(() ->
                                new IllegalArgumentException(
                                        "Trabajo no encontrado: "
                                                + id
                                )
                        );

        Long semanaId =
                trabajo.getSemana().getId();


        // -----------------------------------------------------
        // OBTENER URL DE IMAGEN
        // -----------------------------------------------------

        String imagen =
                trabajo.getImagen();

        String archivo =
                trabajo.getArchivo();


        // -----------------------------------------------------
        // IMAGEN
        // -----------------------------------------------------

        if (imagen != null &&
                !imagen.isBlank()) {

            archivoService.eliminarImagen(
                    imagen
            );
        }


        // -----------------------------------------------------
        // ARCHIVO
        // -----------------------------------------------------

        if (archivo != null &&
                !archivo.isBlank()) {

            archivoService.eliminarArchivo(
                    archivo
            );
        }


        // -----------------------------------------------------
        // ELIMINAR REGISTRO DE AIVEN / MYSQL
        // -----------------------------------------------------

        trabajoRepository.deleteById(
                id
        );


        return "redirect:/admin/trabajos/semana/"
                + semanaId;
    }
}