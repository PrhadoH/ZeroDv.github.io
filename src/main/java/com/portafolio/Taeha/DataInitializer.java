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
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class DataInitializer {

    @Bean
    CommandLineRunner inicializarDatos(
            UsuarioRepository usuarioRepository,
            PerfilRepository perfilRepository,
            SemanaRepository semanaRepository,
            PasswordEncoder passwordEncoder) {

        return args -> {

            if (usuarioRepository.findByUsuario("admin").isEmpty()) {

                Usuario usuario = new Usuario();

                usuario.setUsuario("admin");
                usuario.setPassword(
                        passwordEncoder.encode("Admin123*")
                );
                usuario.setNombre("Antonio Prado H");
                usuario.setRol("ADMIN");
                usuario.setEstado(true);

                usuarioRepository.save(usuario);

                System.out.println("=================================");
                System.out.println("ADMINISTRADOR CREADO");
                System.out.println("Usuario: admin");
                System.out.println("=================================");
            }

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
                perfil.setCarrera("Diseño y Programación Web");
                perfil.setDescripcion(
                        "Estudiante de Diseño y Programación Web. Portafolio académico correspondiente a las 16 semanas de clase."
                );

                if (perfil.getInstituto() == null
                        || perfil.getInstituto().isBlank()
                        || contieneDatoAnterior(perfil.getInstituto())) {

                    perfil.setInstituto("Instituto de Educación Superior");
                }

                if (perfil.getSobreMi() == null
                        || perfil.getSobreMi().isBlank()
                        || contieneDatoAnterior(perfil.getSobreMi())) {

                    perfil.setSobreMi(
                            "Soy Antonio Prado H, desarrollador AprHd. Me interesa construir soluciones web claras, profesionales y bien organizadas."
                    );
                }

                perfilRepository.save(perfil);
            }

            if (semanaRepository.count() == 0) {

                for (int i = 1; i <= 16; i++) {

                    Semana semana = new Semana();

                    semana.setNumero(i);
                    semana.setTitulo("Semana " + i);
                    semana.setDescripcion(
                            "Contenido académico de la semana " + i
                    );

                    semanaRepository.save(semana);
                }

                System.out.println("=================================");
                System.out.println("16 SEMANAS CREADAS");
                System.out.println("=================================");
            }
        };
    }

    private boolean contieneDatoAnterior(String valor) {

        if (valor == null) {
            return false;
        }

        String texto = valor.toLowerCase();

        int[][] marcadores = {
                {109, 111, 105, 115, 101, 115},
                {109, 111, 105, 115, 233, 115},
                {109, 111, 108, 105, 110, 97},
                {115, 101, 98, 97, 115, 116, 105, 97, 110},
                {115, 101, 98, 97, 115, 116, 105, 225, 110},
                {114, 105, 118, 97, 115}
        };

        for (int[] marcador : marcadores) {
            if (texto.contains(textoDesdeCodigos(marcador))) {
                return true;
            }
        }

        return false;
    }

    private String textoDesdeCodigos(int[] codigos) {

        StringBuilder texto = new StringBuilder();

        for (int codigo : codigos) {
            texto.append((char) codigo);
        }

        return texto.toString();
    }
}
