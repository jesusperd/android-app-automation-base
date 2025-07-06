#English version
*** Settings ***
# Import the necessary libraries for mobile automation, HTTP requests, collections handling, and Robot Framework utilities.
Library    AppiumLibrary
Library    RequestsLibrary
Library    Collections
Library    BuiltIn
# Import external variables and custom keyword resources.
Variables    config_variables.py
Resource    otp_keywords.robot

*** Variables ***
# Base URL of the backend for PIN queries.
${API_URL}    https://api-backend-example.com
# Authentication token for the backend (fictitious).
${API_KEY}    DEMO_TOKEN_123456
# HTTP headers dictionary for requests (includes the token and expected response type).
&{HEADERS}    Authorization=${API_KEY}    Accept=application/json

*** Keywords ***
Open App
    # Open the mobile application using the configuration parameters.
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM}    deviceName=${DEVICE}    app=${APK_PATH}    automationName=UiAutomator2
    # Wait until the initial loading screen disappears.
    Wait Until Page Does Not Contain    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]
    # Wait until the city selection screen is visible.
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="city_screen"]    timeout=10s

Select City
    [Arguments]    ${city}
    # Wait until the city selection screen is visible.
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="city_screen"]    timeout=10s
    # If the city is 'ar' (Argentina), click the corresponding button.
    Run Keyword If    '${city}' == 'ar'
    ...    Click Element    xpath=//android.view.ViewGroup[@content-desc="button_option_BuenosAires"]/android.view.ViewGroup
    # If the city is 'br' (Brazil), click the corresponding button.
    ...    ELSE IF    '${city}' == 'br'
    ...    Click Element    xpath=//android.widget.TextView[@text="São Paulo"]
    # If the city is not supported, fail the test.
    ...    ELSE
    ...    Fail    City not supported: ${city}
    # Log the selected city.
    Log    Selected city: ${city}

Login With Phone
    [Arguments]    ${country}    ${phone}
    # Wait until the phone input form is visible.
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup    timeout=10s
    # Wait until the button to select the prefix is visible.
    Wait Until Element Is Visible    xpath=//android.widget.Button[@content-desc="input_phone_prefix_toggle"]/com.horcrux.svg.SvgView    timeout=10s
    # Click the button to display the prefix list.
    Click Element    xpath=//android.widget.Button[@content-desc="input_phone_prefix_toggle"]/com.horcrux.svg.SvgView
    # Wait until the prefix list is visible.
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="input_phone_prefix_item"]    timeout=10s
    # Select the prefix according to the country: +54 for Argentina, +55 for Brazil.
    Run Keyword If    '${country}' == 'ar'
    ...    Click Element    xpath=//android.widget.Button[@text="+54"]
    ...    ELSE IF    '${country}' == 'br'
    ...    Click Element    xpath=//android.widget.Button[@text="+55"]
    ...    ELSE
    ...    Fail    Country not supported: ${country}
    # Wait until the prefix list disappears.
    Wait Until Page Does Not Contain    //android.view.ViewGroup[@content-desc="input_phone_prefix_item"]
    # Wait until the phone input field is visible.
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="input_phone_signup_wrapper"]
    # Click the text field to enter the phone number.
    Click Element    //android.widget.EditText[@content-desc="input_phone_signup"]
    # Enter the local phone number (without prefix).
    Input Text   //android.widget.EditText[@content-desc="input_phone_signup"]    ${phone}
    # Wait until the button to send the OTP is visible.
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="button_send_otp"]/android.view.ViewGroup    timeout=10s
    # Click the button to send the OTP.
    Click Element    xpath=//android.view.ViewGroup[@content-desc="button_send_otp"]/android.view.ViewGroup
    # Wait until the OTP input screen is visible.
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="otp_screen"]    timeout=10s
    # Wait 3 seconds to allow time for the OTP to arrive.
    Sleep    3s
    # Wait until the OTP input field is visible.
    Wait Until Element Is Visible    xpath=//android.widget.EditText    timeout=10s
    # Click the text field to enter the OTP.
    Click Element    //android.widget.EditText[@content-desc="input_otp_code"]
    # --- Here we get the PIN directly from the backend using the local number and country ---
    ${pin}=    Get Last PIN From Backend    ${phone}    ${country}
    # Enter the received PIN in the OTP field.
    Input Text    //android.widget.EditText[@content-desc="input_otp_code"]    ${pin}
    # Wait for an element on the home screen to confirm successful login.
    Wait Until Element Is Visible    //android.widget.TextView[@text="Home"]


#Spanish version
*** Settings ***
# Importa las librerías necesarias para automatización móvil, requests HTTP, manejo de colecciones y utilidades de Robot Framework.
Library    AppiumLibrary
Library    RequestsLibrary
Library    Collections
Library    BuiltIn
# Importa variables externas y recursos de keywords personalizados.
Variables    config_variables.py
Resource    otp_keywords.robot

*** Variables ***
# URL base del backend para las consultas de PIN.
${URL_API}    https://api-backend-ejemplo.com
# Token de autenticación para el backend (ficticio).
${API_KEY}    TOKEN_DEMO_123456
# Diccionario de headers HTTP para las requests (incluye el token y el tipo de respuesta esperada).
&{HEADERS}    Authorization=${API_KEY}    Accept=application/json

*** Keywords ***
Abrir App
    # Abre la aplicación móvil usando los parámetros de configuración.
    Open Application    ${REMOTE_URL}    platformName=${PLATAFORMA}    deviceName=${DISPOSITIVO}    app=${RUTA_APK}    automationName=UiAutomator2
    # Espera a que desaparezca la pantalla de carga inicial.
    Wait Until Page Does Not Contain    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]
    # Espera hasta que la pantalla de selección de ciudad esté visible.
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="pantalla_ciudad"]    timeout=10s

Seleccionar Ciudad
    [Arguments]    ${ciudad}
    # Espera hasta que la pantalla de selección de ciudad esté visible.
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="pantalla_ciudad"]    timeout=10s
    # Si la ciudad es 'ar' (Argentina), hace click en el botón correspondiente.
    Run Keyword If    '${ciudad}' == 'ar'
    ...    Click Element    xpath=//android.view.ViewGroup[@content-desc="boton_opcion_BuenosAires"]/android.view.ViewGroup
    # Si la ciudad es 'br' (Brasil), hace click en el botón correspondiente.
    ...    ELSE IF    '${ciudad}' == 'br'
    ...    Click Element    xpath=//android.widget.TextView[@text="São Paulo"]
    # Si la ciudad no es soportada, falla el test.
    ...    ELSE
    ...    Fail    Ciudad no soportada: ${ciudad}
    # Loguea la ciudad seleccionada.
    Log    Ciudad seleccionada: ${ciudad}

Login con Teléfono
    [Arguments]    ${pais}    ${telefono}
    # Espera hasta que el formulario de ingreso de teléfono esté visible.
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup    timeout=10s
    # Espera hasta que el botón para seleccionar el prefijo esté visible.
    Wait Until Element Is Visible    xpath=//android.widget.Button[@content-desc="input_phone_prefix_toggle"]/com.horcrux.svg.SvgView    timeout=10s
    # Hace click en el botón para desplegar la lista de prefijos.
    Click Element    xpath=//android.widget.Button[@content-desc="input_phone_prefix_toggle"]/com.horcrux.svg.SvgView
    # Espera hasta que la lista de prefijos esté visible.
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="input_phone_prefix_item"]    timeout=10s
    # Selecciona el prefijo según el país: +54 para Argentina, +55 para Brasil.
    Run Keyword If    '${pais}' == 'ar'
    ...    Click Element    xpath=//android.widget.Button[@text="+54"]
    ...    ELSE IF    '${pais}' == 'br'
    ...    Click Element    xpath=//android.widget.Button[@text="+55"]
    ...    ELSE
    ...    Fail    País no soportado: ${pais}
    # Espera a que desaparezca la lista de prefijos.
    Wait Until Page Does Not Contain    //android.view.ViewGroup[@content-desc="input_phone_prefix_item"]
    # Espera hasta que el campo de ingreso de teléfono esté visible.
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="input_phone_signup_wrapper"]
    # Hace click en el campo de texto para ingresar el número de teléfono.
    Click Element    //android.widget.EditText[@content-desc="input_phone_signup"]
    # Ingresa el número de teléfono local (sin prefijo).
    Input Text   //android.widget.EditText[@content-desc="input_phone_signup"]    ${telefono}
    # Espera hasta que el botón para enviar el OTP esté visible.
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="boton_enviar_otp"]/android.view.ViewGroup    timeout=10s
    # Hace click en el botón para enviar el OTP.
    Click Element    xpath=//android.view.ViewGroup[@content-desc="boton_enviar_otp"]/android.view.ViewGroup
    # Espera hasta que la pantalla de ingreso de OTP esté visible.
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="pantalla_otp"]    timeout=10s
    # Espera 3 segundos para dar tiempo a que llegue el OTP.
    Sleep    3s
    # Espera hasta que el campo de ingreso de OTP esté visible.
    Wait Until Element Is Visible    xpath=//android.widget.EditText    timeout=10s
    # Hace click en el campo de texto para ingresar el OTP.
    Click Element    //android.widget.EditText[@content-desc="input_otp_code"]
    # --- Aquí obtenemos el PIN directamente del backend usando el número local y el país ---
    ${pin}=    Obtener Último PIN Desde Backend    ${telefono}    ${pais}
    # Ingresa el PIN recibido en el campo de OTP.
    Input Text    //android.widget.EditText[@content-desc="input_otp_code"]    ${pin}
    # Espera un elemento de la pantalla de inicio para saber que hicimos login correctamente.
    Wait Until Element Is Visible    //android.widget.TextView[@text="Inicio"]