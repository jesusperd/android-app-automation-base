![image](https://github.com/user-attachments/assets/b4d2b5a2-4c21-4ba5-af74-2713c61bd077)


**APP Frubana**

El objetivo principal de este documento es explicar detalladamente los pasos a seguir para
configurar las herramientas usadas para el desarrollo del proyecto de automatización en APP Movil Frubana, se
realizará un guía completa de la instalación para Sistema operativo MAC y Windows.

Este proyecto contine el codigo  automatizado de la App de frubana en Movil usando Appium y Python.

**Instalación en Mac**

1. Instalación del JDK descargar (versión 8 o superior): https://www.java.com/es/download/
Realizar la instalación guiada que se solicita al realizar la descarga en la url compartida anteriormente.
Instalación en Mac

![image](https://github.com/user-attachments/assets/a18d5030-e1a4-47eb-a2bd-b451825cfd85)


2. Luego de descargar JDK se debe configurar las variables de entorno como se
muestra a continuación:

**Java JDK JAVA_HOME**

Para MAC usar el siguiente comando:

```sh
/usr/libexec/java_home
```

Este mostrará la ruta donde se encuentra el JDK instalado, luego ingresamos a setear la
variable de entorno con el comando:

```sh
vim ~/.zshenv
```

Escribir en el archivo i
para poder editar, agregar y guardar las variables de entorno en MAC presionamos: tecla i o command
i para insertar texto tecla ESC :wq (que sería write and quit) tecla enter para salir del modo edición
para verificar podemos escribir el comando: 

```sh
cat ~/.zshenv
```
![image](https://github.com/user-attachments/assets/c6d28139-47b3-4e97-b856-281a79302caf)

Guardar los cambios del archivo anteriormente modificado

```sh
source ~/.zshenv
```

para verificar que los cambios hayan quedado aplicados usar el comando

```sh
echo $JAVA_HOME
```

Mostrará algo como la siguiente imagen:

![image](https://github.com/user-attachments/assets/0b53c103-186f-4f4f-b1b2-6c0fc5fd837b)


Los siguiente que es instalar Node para esto debemos antes Instalar npm

3. Instalar Node.js: https://nodejs.org/es/download dirigirse a esta url y hacer la descarga como
se realiza la descarga de cualquier programa siguiendo la guía de instalación.
Al final de la instalación mostrara algo como la siguiente imagen:

![image](https://github.com/user-attachments/assets/401afad9-d6ec-4f12-b2ff-a54c675fc44e)


4. Instalar y configurar Android SDK ingresando al siguiente Link:
https://developer.android.com/studio?hl=es-419

<img src="https://github.com/user-attachments/assets/89711dec-63f8-409b-9763-40d4c658daf5" width="500" height="300">

Descargado Android studio procederemos a configurar el emulador de Android lo cual es necesario
para correr la aplicación en un disposito emulado, a continuacion los pasos para configurar el
dispositivo.

<img src="https://github.com/user-attachments/assets/6acdd718-deb0-4233-8ebf-243da734b18322" width="500" height="300">


Seguir la instalacion dando clic en cada uno de los cuadros de dialogos hasta finalizar la instalación

<img src="https://github.com/user-attachments/assets/ad39fbd9-45f3-4abc-abbd-9ba30f249a56" width="500" height="300">

Abrir el emulador y configurar dispositivo

<img src="https://github.com/user-attachments/assets/d04463e9-4937-4c9d-a161-4354b56e0751" width="500" height="300">

Configrurar el dispositivo inicialmente se muestra algo como la siguiente imagen

<img src="https://github.com/user-attachments/assets/4c7c45de-e545-473b-a804-619032a12fb1" width="500" height="300">

Dar clic en la opcion virtual Device Manager y seguir las instrucciones, nombre Android y
dimensiones.
Seleccionar el dispositivo a configurar, importante configurar el tipo dispositivo que este acorde al
sistema operatuvo y tamaños que queremos probar

<img src="https://github.com/user-attachments/assets/a993d13b-6be3-49ea-ad96-aefbd6389a9e" width="500" height="300">

Se configura el nombre y las especificaciones con el Android que se desee colocar en el emulador
Luego descargar la imagen para Android, inmediatamente veras el dispositivo configurado

<img src="https://github.com/user-attachments/assets/04cbc6a4-85d7-4762-867a-e8d1f11cd4cf" width="500" height="300">


Luego podemos iniciar el emulador y probar conectividad en la APK de frubana

<img src="https://github.com/user-attachments/assets/2c131571-4b37-4b7d-b171-6d5d0d9709e3" width="500" height="300">


5. Configurar la variable de entorno de Android Studio seguimos los pasos anteriores al
configurar la variable de Java, importante saber la ruta en donde se encuentra instalado el
SDK de Android, posteriormente en el editor colocamos las siguientes líneas
Los archivos platform-tools y tools deben estar en la ruta correspondiente de la que se coloca
en las siguientes lineas.



```sh
export ANDROID_HOME="/Users/[USER]/Library/Android/sdk"
```


```sh
export PATH=$ANDROID_HOME/platform-tools:$PATH
```


```sh
export PATH=$ANDROID_HOME/tools:$PATH
```






![image](https://github.com/user-attachments/assets/e5dc0e0f-f70c-4fd1-8dd0-7c97a6680fff)



Para verificar que haya quedado correctamente configurada estas variables para Android
ejecutar el siguiente comando:


```sh
echo $ANDROID_HOME
```


Y veremos algo como la siguiente imagen

![image](https://github.com/user-attachments/assets/38c378b7-1962-4097-a98b-8dc5dc3e0c9a)


6. Instalar Appium
Utilizar el comando en Mac:


```sh
npm install -g appium
```


Para verificar que esta instalado


![image](https://github.com/user-attachments/assets/55bd8071-50ac-4d89-ab1c-3561ab48c752)


Para verificar que el servidor de Appium esta escuchando se debe colocar el siguiente
comando: 

```sh
appium
```

![image](https://github.com/user-attachments/assets/0af5c9b0-1350-4540-bab7-594077ef2d8c)


En caso de tener problemas para instalar Appium por permisos, usar el siguiente comando para
usar npm con permisos de administrador:

```sh
sudo npm install -g appium
```


7. **Appium Inspector**
Ir a la siguiente Ruta : https://github.com/appium/appium-inspector/releases
Donde se debe buscar el archivo .dmg de acuerdo al sistema operativo, para Mac el siguiente

![image](https://github.com/user-attachments/assets/a669b817-7ac9-4c5c-8cdd-fe5ee79dceb6)


Copiar en la carpeta aplicaciones, inmediatamente comenzara la instalación del
software

![image](https://github.com/user-attachments/assets/cd588d40-d821-43ff-a66a-0d4dc44564f1)


Veremos el siguiente icono después de instalar


![image](https://github.com/user-attachments/assets/ad48eca6-bf64-4457-bd85-ca004ede0b5a)



Dar doble clic en este icono para inicializar la aplicación la cual abrirá como la siguiente
imagen:


![image](https://github.com/user-attachments/assets/b97845d9-a83e-4954-aa31-60ae2512c9ff)


Luego configurar los capabilities de acuerdo a la configuración de Android Studio
Para configurarlos se deben colocar los nombres de acuerdo de las configuraciones realizadas
en emulador

`{
"platformName": "Android",
"appium:platformVersion": "16",
"appium:deviceName": "Automation",
"appium:app": "/Users/usuario/Documents/Automatizacion/app-release-bitrise-signed.apk",
"appium:automationName": "UIAutomator2"
}
`



![image](https://github.com/user-attachments/assets/3a9071fd-dcd8-47ff-a2da-123dc4d585f0)



Es importante inicializar el servicio de Appium para levantar el app que configuramos
anteriormente lo cual se realiza de la siguiente manera:

Inicializar Appium se ejecuta el siguiente comando:

```sh
appium -p 4724
```

![image](https://github.com/user-attachments/assets/a05f7b35-6a2c-48f0-8537-729ef4972edb)



8. Instalar Appium Drivers ejecutar los siguientes comandos
   
```sh
appium driver install xcuitest
appium driver install uiautomator2
```
![image](https://github.com/user-attachments/assets/c1c50bc6-3a77-4ec1-84a0-b808aaefa1de)



Para verificar los Drivers con el siguiente comando


```sh
appium driver list
```

9. **Instalar Visual studio Code** : https://code.visualstudio.com/ seguir los pasos y ejecutar
Crear un Proyecto en VS Code
Crear una Nueva Carpeta:
Usa la terminal para crear una nueva carpeta para tu proyecto:

```sh
mkdir mi_proyecto_robot
cd mi_proyecto_robot
```

Abrir VS Code:
Desde la terminal, abre VS Code con el siguiente comando:

```sh
Code
```

10. **Instalar Python**
Para instalar python solo necesitas ir al link https://www.python.org/ y descargar la última versión.
Ejecuta el instalador y asegúrate de marcar la opción “Add Python to PATH”.
Completa la instalación.
Instalar Plugins necesarios desde Visual Studio code


![image](https://github.com/user-attachments/assets/0251fca1-5e52-4331-b0a0-b7ffe407eae0)


Verificar la Instalación:
Abre la terminal (cmd) y ejecuta:

```sh
Python3 –versión
```


![image](https://github.com/user-attachments/assets/f91c77b9-2554-4094-bc29-e8d05f3ed89a)

Configurar entorno de Python que VSCode utilizar el comando:

```sh
python3 -m pip install Appium-Python-Client
```


**Instalación en Widows**
Se realizan las mismas configuraciones la unica diferencia es la configuracion de las
variable de entorno simplemente debemos ir a:
Sistema (Panel de control) Configuracion avanzada Variables de entorno
Instalar el cliente de Appium
Instalación desde VSC con el siguiente comando:

```sh
python3 -m pip install Appium-Python-Client
```

<img src="https://github.com/user-attachments/assets/e5a7ce42-d25f-47f2-8f41-09c799e1a924" width="300" height="200">
