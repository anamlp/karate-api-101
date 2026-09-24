@m04 @validaciones
Feature: match sobre producto

# Este caso siempre conecta, en cada escenario, ya con productos/1
Background: 
    Given url baseUrl
    And path 'productos', 1
    When method get
    Then status 200

Scenario:
    And match response.nombre == 'Teclado'
    And match response.precio == 25
    And match response.id == '#number'

Scenario:
    And match response contains { id: 1, categoria: 'periferico' }

# CUidado en los siguiente casos pues no es id == '#number', es id: '#number'
Scenario: 
    And match response == {id : '#number', nombre : '#string', precio : '#number', categoria : '#string', stock : '#number'}

Scenario: 
    And match response == 
        """
        {
            id : '#number', 
            nombre : '#string', 
            precio : '#number', 
            categoria : '#string', 
            stock : '#number'
        }
        """

# Este caso fallo pues no cumple el esquema, no contiene el atributo color. 
@ignore
Scenario: Caso que debe fallar (esquema incompleto) Ignoramos su ejecución con @ignore tras comprobar resultados
    And match response == 
        """
        {
            id : '#number', 
            nombre : '#string', 
            precio : '#number', 
            categoria : '#string', 
            stock : '#number', 
            color: '#string'
        }
        """
Scenario: 
    Given url baseUrl
    And header Content-Type = 'application/json'
    And path 'usuarios', 1
    When method GET
    Then status 200
    And match response.id == '#number'
    And match response.nombre == '#string'
    And match response.rol == '#string'
    And match response.activo == '#boolean'

Scenario:
    And match response.precio == '#number'
    And assert response.precio  > 0
