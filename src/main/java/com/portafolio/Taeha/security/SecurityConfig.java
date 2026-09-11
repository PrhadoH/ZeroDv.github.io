package com.portafolio.Taeha.security;

import jakarta.servlet.DispatcherType;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(
            HttpSecurity http) throws Exception {

        http

                // ======================================
                // AUTORIZACIONES
                // ======================================

                .authorizeHttpRequests(auth -> auth

                        .dispatcherTypeMatchers(
                                DispatcherType.FORWARD,
                                DispatcherType.ERROR
                        ).permitAll()

                        // ==================================
                        // RECURSOS Y LOGIN
                        // ==================================

                        .requestMatchers(
                                "/css/**",
                                "/js/**",
                                "/images/**",
                                "/login",
                                "/error"
                        ).permitAll()

                        // ==================================
                        // PANEL ADMIN
                        // ==================================

                        .requestMatchers("/admin/**")
                        .hasRole("ADMIN")

                        .requestMatchers("/mensaje/**")
                        .hasRole("ADMIN")

                        // ==================================
                        // PORTAFOLIO AUTENTICADO
                        // ==================================

                        .requestMatchers(
                                HttpMethod.GET,
                                "/",
                                "/semana/**",
                                "/publico/**",
                                "/trabajos/imagen/**",
                                "/trabajos/archivo/**"
                        ).authenticated()


                        // ==================================
                        // RESTO
                        // ==================================

                        .anyRequest()
                        .authenticated()
                )


                // ======================================
                // LOGIN
                // ======================================

                .formLogin(form -> form

                        .loginPage("/login")

                        .defaultSuccessUrl("/", true)

                        .permitAll()
                )


                // ======================================
                // LOGOUT
                // ======================================

                .logout(logout -> logout

                        .logoutSuccessUrl("/login?logout")

                        .permitAll()
                );


        return http.build();
    }


    // ==========================================
    // PASSWORD ENCODER
    // ==========================================

    @Bean
    public PasswordEncoder passwordEncoder() {

        return new BCryptPasswordEncoder();
    }
}
