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
# URL base del backend de Frubana para las consultas de PIN.
${API_URL}    https://federate-public-qa-services.federate-qa.frubana.com
# Token de autenticación para el backend.
${API_KEY}    XFY^^CUC@$UY@t6%6e(m!*31,Qd./I{fC;I|(WL[j-!YUn:7vHV}7ohyQvyA6C1
# Diccionario de headers HTTP para las requests (incluye el token y el tipo de respuesta esperada).
&{HEADERS}    Authorization=${API_KEY}    Accept=application/json

*** Keywords ***
Open Frubana App
    # Abre la aplicación móvil de Frubana usando los parámetros de configuración.
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    app=${APP}    automationName=UiAutomator2
    # Espera a que desaparezca la pantalla de carga inicial.
    Wait Until Page Does Not Contain    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]
    # Espera hasta que la pantalla de selección de ciudad esté visible.
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="city_screen"]    timeout=10s

Select City
    [Arguments]    ${city}
    # Espera hasta que la pantalla de selección de ciudad esté visible.
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="city_screen"]    timeout=10s
    # Si la ciudad es 'sp' (São Paulo), hace click en el botón correspondiente.
    Run Keyword If    '${city}' == 'sp'
    ...    Click Element    xpath=//android.view.ViewGroup[@content-desc="button_option_Sao Paulo"]/android.view.ViewGroup
    # Si la ciudad es 'bl' (Belo Horizonte), hace click en el botón correspondiente.
    ...    ELSE IF    '${city}' == 'bl'
    ...    Click Element    xpath=//android.widget.TextView[@text="Belo Horizonte"]
    # Si la ciudad no es soportada, falla el test.
    ...    ELSE
    ...    Fail    Ciudad no soportada: ${city}
    # Loguea la ciudad seleccionada.
    Log    Ciudad seleccionada: ${city}

Number phone loguin
    [Arguments]    ${country}    ${phone}
    # Espera hasta que el formulario de ingreso de teléfono esté visible.
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup    timeout=10s
    # Espera hasta que el botón para seleccionar el prefijo esté visible.
    Wait Until Element Is Visible    xpath=//android.widget.Button[@content-desc="input_phone_prefix_toggle"]/com.horcrux.svg.SvgView    timeout=10s
    # Hace click en el botón para desplegar la lista de prefijos.
    Click Element    xpath=//android.widget.Button[@content-desc="input_phone_prefix_toggle"]/com.horcrux.svg.SvgView
    # Espera hasta que la lista de prefijos esté visible.
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="input_phone_prefix_item"]    timeout=10s
    # Selecciona el prefijo según el país: +54 para Argentina, +55 para Brasil.
    Run Keyword If    '${country}' == 'ar'
    ...    Click Element    xpath=//android.widget.Button[@text="+54"]
    ...    ELSE IF    '${country}' == 'br'
    ...    Click Element    xpath=//android.widget.Button[@text="+55"]
    ...    ELSE
    ...    Fail    País no soportado: ${country}
    # Espera a que desaparezca la lista de prefijos.
    Wait Until Page Does Not Contain    //android.view.ViewGroup[@content-desc="input_phone_prefix_item"]
    # Espera hasta que el campo de ingreso de teléfono esté visible.
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="input_phone_signup_wrapper"]
    # Hace click en el campo de texto para ingresar el número de teléfono.
    Click Element    //android.widget.EditText[@content-desc="input_phone_signup"]
    # Ingresa el número de teléfono local (sin prefijo).
    Input Text   //android.widget.EditText[@content-desc="input_phone_signup"]    ${phone}
    # Espera hasta que el botón para enviar el OTP por WhatsApp esté visible.
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="button_send_otp_whatsapp"]/android.view.ViewGroup    timeout=10s
    # Hace click en el botón para enviar el OTP.
    Click Element    xpath=//android.view.ViewGroup[@content-desc="button_send_otp_whatsapp"]/android.view.ViewGroup
    # Espera hasta que la pantalla de ingreso de OTP esté visible.
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="otp_code_screen"]    timeout=10s
    # Espera 3 segundos para dar tiempo a que llegue el OTP.
    Sleep    3s
    # Espera hasta que el campo de ingreso de OTP esté visible.
    Wait Until Element Is Visible    xpath=//android.widget.EditText    timeout=10s
    # Hace click en el campo de texto para ingresar el OTP.
    Click Element    //android.widget.EditText[@content-desc="input_otp_code"]
    # --- Aquí obtenemos el PIN directamente del backend usando el número local y el país ---
    ${pin}=    Get Last PIN From Backend    ${phone}    ${country}
    # Ingresa el PIN recibido en el campo de OTP.
    Input Text    //android.widget.EditText[@content-desc="input_otp_code"]    ${pin}
    #esperar un elemento de la pantalla de inicio para saber que hicimos loguin correctamente
    Wait Until Element Is Visible    //android.widget.TextView[@text="Início"]