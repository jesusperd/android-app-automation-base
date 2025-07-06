android-app-automation-base
Base template for native Android app automation using Appium, Robot Framework, and AppiumLibrary. Includes a comprehensive setup guide and a robust, scalable login automation script. Easily adaptable for various project needs, demonstrating end-to-end testing for mobile applications.

# Automatización base para app nativa de Android con Appium, Android Studio, Robot Framework y AppiumLibrary

Este proyecto es una plantilla base para automatizar el login de una aplicación móvil nativa de Android utilizando Appium, Robot Framework y AppiumLibrary. El flujo automatizado incluye la gestión de modales iniciales, selección de ciudad, login con número de teléfono, recuperación de PIN vía API y validación de acceso exitoso.

---

## Estructura del proyecto



. ├── README.md ├── test_loguin.robot ├── keywords.robot ├── otp_keywords.robot ├── config_variables.py ├── requirements.txt └── output/


---

## Requisitos previos

- **Java JDK 8+**  
- **Node.js y npm**
- **Android Studio** (con emulador configurado)
- **Appium** y **Appium Inspector**
- **Python 3.8+**
- **Visual Studio Code** (opcional, recomendado)

---

## Instalación y configuración rápida

1. **Clona el repositorio:**
   ```sh
   git clone <URL-del-repo>
   cd <nombre-del-repo>


Crea y activa un entorno virtual:

python3 -m venv venv
source venv/bin/activate


Instala las dependencias:

pip install robotframework robotframework-appiumlibrary robotframework-requests


Configura el emulador Android y Appium:

Inicia el emulador desde Android Studio.
Inicia Appium en la terminal:
appium


Configura las variables necesarias en config_variables.py
(Rutas, nombres de dispositivo, APK, etc.)

Ejecuta el test principal:

robot --outputdir output test_loguin.robot


Revisa los resultados en output/log.html y output/report.html.

Flujo automatizado (resumen)
Apertura de la app y cierre de modal de anuncio inicial.
Selección de ciudad.
Ingreso de número de teléfono y selección de prefijo.
Envío de OTP y recuperación del PIN vía API (GET).
Ingreso del PIN y validación de login exitoso.
Ejemplo de test automatizado

Notas
Este proyecto es una base didáctica y escalable para automatización de login en apps nativas Android.
Personaliza los selectores, endpoints y variables según tu aplicación y entorno.
No incluye datos sensibles ni endpoints reales de empresas.
Créditos

Plantilla creada para fines educativos y de portafolio personal.



