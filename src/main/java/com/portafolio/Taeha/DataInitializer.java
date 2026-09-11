package com.portafolio.Taeha;

import com.portafolio.Taeha.model.Perfil;
import com.portafolio.Taeha.model.Semana;
import com.portafolio.Taeha.model.Usuario;
import com.portafolio.Taeha.repository.PerfilRepository;
import com.portafolio.Taeha.repository.SemanaRepository;
import com.portafolio.Taeha.repository.UsuarioRepository;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class DataInitializer {

    @Bean
    CommandLineRunner inicializarDatos(
            UsuarioRepository usuarioRepository,
            PerfilRepository perfilRepository,
            SemanaRepository semanaRepository,
            PasswordEncoder passwordEncoder,
            Environment environment) {

        return args -> {

            // ==========================================
            // ADMINISTRADOR
            // ==========================================

            if (usuarioRepository.findByUsuario("admin").isEmpty()) {

                String adminPassword =
                        obtenerPasswordInicial(
                                "ADMIN_PASSWORD",
                                environment
                        );

                Usuario admin = new Usuario();

                admin.setUsuario("admin");
                admin.setPassword(
                        passwordEncoder.encode(
                                adminPassword
                        )
                );
                admin.setNombre("Antonio Prado H");
                admin.setRol("ADMIN");
                admin.setEstado(true);

                usuarioRepository.save(admin);

                System.out.println(
                        "Usuario administrador creado correctamente."
                );
            }


            // ==========================================
            // RESTABLECER CONTRASEÑA DEL ADMIN
            // ==========================================

            String adminResetPassword =
                    environment.getProperty(
                            "ADMIN_RESET_PASSWORD"
                    );

            if (adminResetPassword != null
                    && !adminResetPassword.isBlank()) {

                Usuario adminExistente =
                        usuarioRepository
                                .findByUsuario("admin")
                                .orElseThrow(() ->
                                        new IllegalStateException(
                                                "No existe el usuario admin."
                                        )
                                );

                adminExistente.setPassword(
                        passwordEncoder.encode(
                                adminResetPassword
                        )
                );

                usuarioRepository.save(adminExistente);

                System.out.println(
                        "Contraseña del administrador actualizada correctamente."
                );
            }


            // ==========================================
            // USUARIO NORMAL
            // ==========================================

            if (usuarioRepository.findByUsuario("user").isEmpty()) {

                String userPassword =
                        obtenerPasswordInicial(
                                "USER_PASSWORD",
                                environment
                        );

                Usuario user = new Usuario();

                user.setUsuario("user");
                user.setPassword(
                        passwordEncoder.encode(
                                userPassword
                        )
                );

                user.setNombre("Antonio Prado");
                user.setRol("USER");
                user.setEstado(true);

                usuarioRepository.save(user);

                System.out.println(
                        "Usuario normal creado correctamente."
                );
            }


            // ==========================================
            // PERFIL
            // ==========================================

            Perfil perfil = perfilRepository.findAll()
                    .stream()
                    .findFirst()
                    .orElseGet(Perfil::new);

            if (perfil.getId() == null
                    || contieneDatoAnterior(perfil.getNombre())
                    || contieneDatoAnterior(perfil.getApellidos())
                    || "Antonio Prado".equalsIgnoreCase(perfil.getNombre())
                    || "H".equalsIgnoreCase(perfil.getApellidos())) {

                perfil.setNombre("Antonio");
                perfil.setApellidos("PRADO H");
                perfil.setCarrera(
                        "Diseño y Programación Web"
                );

                perfil.setDescripcion(
                        "Estudiante de Diseño y Programación Web. " +
                                "Portafolio académico correspondiente " +
                                "a las 16 semanas de clase."
                );

                if (perfil.getInstituto() == null
                        || perfil.getInstituto().isBlank()
                        || contieneDatoAnterior(
                        perfil.getInstituto()
                )) {

                    perfil.setInstituto(
                            "Instituto de Educación Superior"
                    );
                }

                if (perfil.getSobreMi() == null
                        || perfil.getSobreMi().isBlank()
                        || contieneDatoAnterior(
                        perfil.getSobreMi()
                )) {

                    perfil.setSobreMi(
                            "Soy Antonio Prado H, desarrollador AprHd. " +
                                    "Me interesa construir soluciones web claras, " +
                                    "profesionales y bien organizadas."
                    );
                }

                perfilRepository.save(perfil);
            }


            // ==========================================
            // SEMANAS
            // ==========================================

            if (semanaRepository.count() == 0) {

                for (int i = 1; i <= 16; i++) {

                    Semana semana = new Semana();

                    semana.setNumero(i);
                    semana.setTitulo(
                            "Semana " + i
                    );

                    semana.setDescripcion(
                            "Contenido académico de la semana " + i
                    );

                    semanaRepository.save(semana);
                }

                System.out.println(
                        "================================="
                );

                System.out.println(
                        "16 SEMANAS CREADAS"
                );

                System.out.println(
                        "================================="
                );
            }
        };
    }


    // ==========================================
    // DETECTAR DATOS ANTERIORES
    // ==========================================

    private boolean contieneDatoAnterior(
            String valor) {

        if (valor == null) {
            return false;
        }

        String texto =
                valor.toLowerCase();

        int[][] marcadores = {

                {109, 111, 105, 115, 101, 115},

                {109, 111, 105, 115, 233, 115},

                {109, 111, 108, 105, 110, 97},

                {115, 101, 98, 97, 115, 116, 105, 97, 110},

                {115, 101, 98, 97, 115, 116, 105, 225, 110},

                {114, 105, 118, 97, 115}
        };

        for (int[] marcador : marcadores) {

            if (texto.contains(
                    textoDesdeCodigos(
                            marcador
                    ))) {

                return true;
            }
        }

        return false;
    }


    // ==========================================
    // CONVERTIR CÓDIGOS A TEXTO
    // ==========================================

    private String textoDesdeCodigos(
            int[] codigos) {

        StringBuilder texto =
                new StringBuilder();

        for (int codigo : codigos) {

            texto.append(
                    (char) codigo
            );
        }

        return texto.toString();
    }


    // ==========================================
    // OBTENER CONTRASEÑA INICIAL
    // ==========================================

    private String obtenerPasswordInicial(
            String variableEntorno,
            Environment environment) {

        String valor =
                environment.getProperty(
                        variableEntorno
                );

        if (valor != null
                && !valor.isBlank()) {

            return valor;
        }

        throw new IllegalStateException(
                variableEntorno
                        + " debe estar configurada "
                        + "para crear el usuario inicial."
        );
    }
}