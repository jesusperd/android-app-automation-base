#English version
*** Settings ***
# Import the necessary libraries and resources for automation.
Library    AppiumLibrary
Variables    config_variables.py
Resource     keywords.robot
Library    RequestsLibrary
Resource    otp_keywords.robot

*** Test Cases ***
Successful login
    # Open the mobile application.
    Open App
    # Select the test city (you can change the code as needed).
    Select City    city_code
    # Perform login with a phone number and country.
    Login With Phone    country_code    phone_number
    # Close the application at the end of the test.
    Close App


#Spanish version
*** Settings ***
# Importa las librerías y recursos necesarios para la automatización.
Library    AppiumLibrary
Variables    config_variables.py
Resource     keywords.robot
Library    RequestsLibrary
Resource    otp_keywords.robot

*** Test Cases ***
Login exitoso
    # Abre la aplicación móvil.
    Abrir App
    # Selecciona la ciudad de prueba (puedes cambiar el código según tu caso).
    Seleccionar Ciudad    codigo_ciudad
    # Realiza el login con un número de teléfono y país.
    Login con Teléfono    codigo_pais    numero_telefono
    # Cierra la aplicación al finalizar el test.
    Cerrar App