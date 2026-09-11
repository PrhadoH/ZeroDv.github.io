package com.portafolio.Taeha.security;

import com.portafolio.Taeha.model.Usuario;
import com.portafolio.Taeha.repository.UsuarioRepository;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    private final UsuarioRepository usuarioRepository;

    public CustomUserDetailsService(UsuarioRepository usuarioRepository) {
        this.usuarioRepository = usuarioRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {

        Usuario usuario = usuarioRepository.findByUsuario(username)
                .orElseThrow(() ->
                        new UsernameNotFoundException("Usuario no encontrado"));

        return User.builder()
                .username(usuario.getUsuario())
                .password(usuario.getPassword())
                .authorities(
                        new SimpleGrantedAuthority(
                                normalizarRol(usuario.getRol())
                        )
                )
                .disabled(!usuario.getEstado())
                .build();
    }

    private String normalizarRol(String rol) {

        if (rol == null || rol.isBlank()) {
            return "ROLE_USER";
        }

        String rolLimpio =
                rol.trim().toUpperCase();

        if (rolLimpio.startsWith("ROLE_")) {
            return rolLimpio;
        }

        return "ROLE_" + rolLimpio;
    }
}
