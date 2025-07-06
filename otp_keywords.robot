#English version
*** Keywords ***
Get Last PIN From Backend
    [Arguments]    ${phone}    ${country}
    # Determine the international prefix based on the received country.
    # This allows the flow to adapt to different supported countries.
    Run Keyword If    '${country}' == 'ar'    Set Test Variable    ${prefix}    54
    ...    ELSE IF    '${country}' == 'br'    Set Test Variable    ${prefix}    55
    ...    ELSE    Fail    Country not supported for PIN query: ${country}
    # Concatenate the prefix with the local number to form the international number.
    # This is necessary because the backend expects the number in international format.
    ${phone_for_query}=    Catenate    SEPARATOR=    ${prefix}    ${phone}
    # Log the number to be queried in the backend for debugging.
    Log    Querying PIN for: ${phone_for_query}
    # Create an HTTP session called 'backend' with the base URL and defined headers.
    # This allows reusing the session for multiple requests if needed.
    Create Session    backend    ${API_URL}    headers=${HEADERS}    verify=False
    # Make a GET request to the PIN query endpoint, using the international number.
    # The endpoint and parameters should be adapted to your real backend.
    ${response}=    GET On Session    backend    url=/example-endpoint/pin?number=${phone_for_query}
    # Convert the JSON response into a list/dictionary variable.
    ${data}=    Set Variable    ${response.json()}
    # Log the full response for debugging.
    Log    Response: ${data}
    # Get the number of elements in the response (should be 1 if there is a PIN).
    ${count}=    Get Length    ${data}
    # If the response is empty, fail the test with a clear message.
    Run Keyword If    ${count} == 0    Fail    No PIN found for number ${phone_for_query}
    # Take the first element from the result list.
    ${item}=    Get From List    ${data}    0
    # Extract the PIN value from the dictionary.
    ${pin}=    Get From Dictionary    ${item}    pin
    # Log the obtained PIN for debugging.
    Log    Entered PIN: ${pin}
    # Return the PIN so it can be used in the main flow.
    [Return]    ${pin}


#Spanish version
*** Keywords ***
Obtener Último PIN Desde Backend
    [Arguments]    ${telefono}    ${pais}
    # Determina el prefijo internacional según el país recibido.
    # Esto permite adaptar el flujo a diferentes países soportados.
    Run Keyword If    '${pais}' == 'ar'    Set Test Variable    ${prefijo}    54
    ...    ELSE IF    '${pais}' == 'br'    Set Test Variable    ${prefijo}    55
    ...    ELSE    Fail    País no soportado para consulta de PIN: ${pais}
    # Concatena el prefijo con el número local para formar el número internacional.
    # Esto es necesario porque el backend espera el número en formato internacional.
    ${telefono_consulta}=    Catenate    SEPARATOR=    ${prefijo}    ${telefono}
    # Loguea el número que se va a consultar en el backend para depuración.
    Log    Consultando PIN para: ${telefono_consulta}
    # Crea una sesión HTTP llamada 'backend' con la URL base y los headers definidos.
    # Esto permite reutilizar la sesión para múltiples requests si es necesario.
    Create Session    backend    ${URL_API}    headers=${HEADERS}    verify=False
    # Realiza una petición GET al endpoint de consulta de PIN, usando el número internacional.
    # El endpoint y parámetros deben adaptarse a tu backend real.
    ${respuesta}=    GET On Session    backend    url=/endpoint-ejemplo/pin?numero=${telefono_consulta}
    # Convierte la respuesta JSON en una variable de tipo lista/diccionario.
    ${datos}=    Set Variable    ${respuesta.json()}
    # Loguea la respuesta completa para depuración.
    Log    Respuesta: ${datos}
    # Obtiene la cantidad de elementos en la respuesta (debería ser 1 si hay PIN).
    ${cantidad}=    Get Length    ${datos}
    # Si la respuesta está vacía, falla el test con un mensaje claro.
    Run Keyword If    ${cantidad} == 0    Fail    No se encontró PIN para el número ${telefono_consulta}
    # Toma el primer elemento de la lista de resultados.
    ${item}=    Get From List    ${datos}    0
    # Extrae el valor del PIN del diccionario.
    ${pin}=    Get From Dictionary    ${item}    pin
    # Loguea el PIN obtenido para depuración.
    Log    PIN ingresado: ${pin}
    # Devuelve el PIN para que lo use el flujo principal.
    [Return]    ${pin}


    