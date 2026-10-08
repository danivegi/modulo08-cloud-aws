# Módulo 8 - Cloud: AWS + Docker Hub

App Vite + React desplegada en AWS EC2 a partir de una imagen publicada en Docker Hub.

## Enlaces

- **App desplegada:** http://13.60.205.126
- **Imagen en Docker Hub:** https://hub.docker.com/r/danivegi/modulo08-cloud-aws

## Cómo funciona

1. Cada merge a `main` ejecuta el workflow `.github/workflows/deploy.yml`, que construye la imagen con el `Dockerfile` (multi-stage: build con Node y servido con Nginx) y la publica en Docker Hub con los tags `latest` y el hash del commit.
2. En AWS hay una instancia EC2 (Amazon Linux 2023, t3.micro, región eu-north-1) con el puerto 80 abierto en su grupo de seguridad.
3. Al arrancar, la instancia ejecuta el script `aws/user-data.sh`, que instala Docker, descarga la imagen de Docker Hub y la ejecuta en el puerto 80.

## Credenciales del workflow

- `DOCKERHUB_USERNAME`: variable del repositorio.
- `DOCKERHUB_TOKEN`: secret del repositorio (token de acceso de Docker Hub).