*** Keywords ***
Get Last PIN From Backend
    [Arguments]    ${phone}    ${country}
    # Determina el prefijo internacional según el país recibido.
    Run Keyword If    '${country}' == 'ar'    Set Test Variable    ${prefix}    54
    ...    ELSE IF    '${country}' == 'br'    Set Test Variable    ${prefix}    55
    ...    ELSE    Fail    País no soportado para consulta de PIN: ${country}
    # Concatena el prefijo con el número local para formar el número internacional.
    ${phone_for_query}=    Catenate    SEPARATOR=    ${prefix}    ${phone}
    # Loguea el número que se va a consultar en el backend.
    Log    Consultando PIN para: ${phone_for_query}
    # Crea una sesión HTTP llamada 'backend' con la URL base y los headers definidos.
    Create Session    backend    ${API_URL}    headers=${HEADERS}    verify=False
    # Realiza una petición GET al endpoint de consulta de PIN, usando el número internacional.
    ${response}=    GET On Session    backend    url=/queries-repository/query/1?1=${phone_for_query}
    # Convierte la respuesta JSON en una variable de tipo lista/diccionario.
    ${data}=    Set Variable    ${response.json()}
    # Loguea la respuesta completa para depuración.
    Log    Respuesta: ${data}
    # Obtiene la cantidad de elementos en la respuesta (debería ser 1 si hay PIN).
    ${count}=    Get Length    ${data}
    # Si la respuesta está vacía, falla el test con un mensaje claro.
    Run Keyword If    ${count} == 0    Fail    No se encontró PIN para el número ${phone_for_query}
    # Toma el primer elemento de la lista de resultados.
    ${item}=    Get From List    ${data}    0
    # Extrae el valor del PIN del diccionario.
    ${pin}=    Get From Dictionary    ${item}    pin
    # Loguea el PIN obtenido.
    Log    PIN ingresado: ${pin}
    # Devuelve el PIN para que lo use el flujo principal.
    [Return]    ${pin}