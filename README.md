# MoBreak AI (Mobile)
Jhorman Andrés Galindo Polania

Leiner Jose Barrios Medina

## Instalación y configuración del entorno Flutter

### 1. Requisitos previos
Antes de instalar Flutter, asegúrate de tener lo siguiente:

- **Sistema operativo:** Windows, macOS o Linux
- **Git:** Instalado y configurado en el sistema
- **Android Studio o Xcode:** Para emuladores y herramientas de desarrollo
- **VS Code o cualquier IDE compatible con Flutter**

### 2. Instalación de Flutter

#### Windows
1. Descarga el SDK de Flutter desde [aquí](https://docs.flutter.dev/get-started/install/windows).
2. Extrae el contenido en `C:\flutter`.
3. Agrega `C:\flutter\bin` a la variable de entorno `PATH`.

#### macOS
1. Ejecuta el siguiente comando en la terminal:
   ```sh
   brew install --cask flutter
   ```
2. Agrega Flutter a tu `PATH`:
   ```sh
   export PATH="$PATH:`pwd`/flutter/bin"
   ```

#### Linux
1. Descarga el SDK de Flutter desde [aquí](https://docs.flutter.dev/get-started/install/linux).
2. Extrae el contenido y mueve la carpeta a `/opt/flutter`.
3. Agrega `/opt/flutter/bin` al `PATH`.
   ```sh
   export PATH="$PATH:/opt/flutter/bin"
   ```

### 3. Verificar instalación
Ejecuta el siguiente comando para verificar que todo esté correctamente instalado:
```sh
flutter doctor
```
Si hay errores, sigue las recomendaciones que aparecen en la salida del comando.

---

## Clonar y ejecutar el proyecto

### 1. Clonar el repositorio
```sh
git clone https://github.com/galindojhorman/mobreakai-mobil.git
cd MoBreakAI
```

### 2. Instalar dependencias
```sh
flutter pub get
```

### 3. Configurar dispositivo o emulador
- Para dispositivos físicos, activa la depuración USB y conéctalo a la PC.
- Para emuladores, abre Android Studio y ejecuta un dispositivo virtual.

### 4. Ejecutar el proyecto
```sh
flutter run
```
Si hay más de un dispositivo disponible, usa:
```sh
flutter devices
flutter run -d <ID_DEL_DISPOSITIVO>
```

---

## Generar APK
Para generar un APK de producción, ejecuta:
```sh
flutter build apk
```
El archivo generado se encontrará en `build/app/outputs/flutter-apk/app-release.apk`.

---
