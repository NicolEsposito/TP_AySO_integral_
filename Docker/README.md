# R5 - Docker

Este directorio contiene la resolución del punto R5 del Trabajo Práctico Integral de Arquitectura y Sistemas Operativos.

## 🧾 Descripción

Se construyó una imagen Docker basada en `nginx` que sirve una página HTML (`index.html`) con los integrantes del grupo y sus respectivos roles.

## 🗂️ Archivos incluidos

- `Dockerfile`: crea una imagen basada en nginx y copia la carpeta `web/` al contenedor.
- `docker-compose.yml`: levanta el contenedor en el puerto 8081 con volumen.
- `web/index.html`: página HTML con los datos del grupo.
- `web/file/`: carpeta conectada como volumen para pruebas.

## 🔧 Cómo correrlo

Desde esta carpeta, ejecutar:

```bash
docker-compose up
