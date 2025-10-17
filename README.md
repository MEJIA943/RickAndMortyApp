# Rick & Morty - App iOS Nativa

Este proyecto fue desarrollado como parte de un examen técnico para la posición de Desarrollador iOS SR.
La aplicación permite explorar personajes del universo de Rick and Morty, gestionar favoritos, ver ubicaciones en mapa, marcar episodios vistos y más, cumpliendo con buenas prácticas de arquitectura, persistencia, pruebas y seguridad.

## Cómo ejecutar el proyecto

## Requisitos
- macOS con Xcode 14.0 o superior instalado
- iOS 15+
- Tener habilitado el uso de Face ID o Touch ID en el simulador si se desea probar autenticación biométrica

*Pasos para ejecutar el proyecto

1. Abre la Terminal y navega hasta la carpeta donde quieres clonar el proyecto, por ejemplo:

cd ~/Documentos/Proyectos

2. Clona el repositorio desde GitHub:

git clone https://github.com/MEJIA943/RickAndMortyApp.git

3. Entra a la carpeta del proyecto:

cd RickAndMortyApp

4. Abre el proyecto en Xcode:

open RickAndMortyAPI.xcodeproj

5. En Xcode:

Selecciona un simulador, por ejemplo: iPhone 16 Pro.

6. Presiona Cmd + R para compilar y ejecutar la app.

Si es la primera vez que corres el proyecto:

Acepta los permisos necesarios.

7. Habilita Face ID o Touch ID en el simulador si deseas probar la autenticación biométrica:

En el simulador, ve a Device > Face ID > Enrolled.

API utilizada

Rick and Morty API – API REST pública y gratuita para obtener información sobre personajes, ubicaciones y episodios.
https://rickandmortyapi.com/
