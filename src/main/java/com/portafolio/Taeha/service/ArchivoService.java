package com.portafolio.Taeha.service;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

@Service
public class ArchivoService {

    private final Cloudinary cloudinary;

    public ArchivoService(Cloudinary cloudinary) {
        this.cloudinary = cloudinary;
    }

    // ==========================================
    // GUARDAR IMAGEN EN CLOUDINARY
    // ==========================================
    public String guardarImagen(MultipartFile archivo) {

        if (archivo == null || archivo.isEmpty()) {
            return null;
        }

        try {

            Map resultado = cloudinary.uploader().upload(
                    archivo.getBytes(),
                    ObjectUtils.asMap(
                            "folder", "taeha/trabajos/imagenes",
                            "resource_type", "image"
                    )
            );

            return resultado.get("secure_url").toString();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Error al subir la imagen a Cloudinary",
                    e
            );
        }
    }


    // ==========================================
    // GUARDAR PDF, WORD, PPT, EXCEL, ZIP, ETC.
    // ==========================================
    public String guardarArchivo(MultipartFile archivo) {

        if (archivo == null || archivo.isEmpty()) {
            return null;
        }

        try {

            String nombreOriginal = archivo.getOriginalFilename();

            boolean esPdf =
                    nombreOriginal != null &&
                            nombreOriginal.toLowerCase().endsWith(".pdf");


            // ==========================================
            // PDF
            // Se guarda como IMAGE para que Cloudinary
            // pueda mostrarlo directamente en navegador.
            // ==========================================

            if (esPdf) {

                Map resultado = cloudinary.uploader().upload(
                        archivo.getBytes(),
                        ObjectUtils.asMap(
                                "folder", "taeha/trabajos/archivos",
                                "resource_type", "image",
                                "use_filename", true,
                                "unique_filename", true
                        )
                );

                return resultado.get("secure_url").toString();
            }


            // ==========================================
            // OTROS ARCHIVOS
            // Word, Excel, PowerPoint, ZIP, TXT, etc.
            // ==========================================

            Map resultado = cloudinary.uploader().upload(
                    archivo.getBytes(),
                    ObjectUtils.asMap(
                            "folder", "taeha/trabajos/archivos",
                            "resource_type", "raw",
                            "use_filename", true,
                            "unique_filename", true
                    )
            );

            return resultado.get("secure_url").toString();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Error al subir el archivo a Cloudinary",
                    e
            );
        }
    }


    // ==========================================
    // ELIMINACIÓN
    // ==========================================

    public void eliminarImagen(String url) {
        // Se implementará después con public_id.
    }

    public void eliminarArchivo(String url) {
        // Se implementará después con public_id.
    }
}