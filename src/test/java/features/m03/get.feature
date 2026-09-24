@m03 @http-get
Feature: Peticiones GET contra la tienda

Background:
    Given url baseUrl

Scenario: Listar todos los productos
    And path 'productos'
    When method get
    Then status 200
    And match response == '#[3]'
    And match response[0].id == 1

Scenario: Producto 2
    And path 'productos', 2
    When method GET
    Then status 200
    And match response.nombre == 'Monitor'
    And match response.categoria == 'pantalla'

Scenario: 
    And path 'productos'
    And param categoria = 'periferico'
    When method GET
    Then status 200
    And match response == '#[2]'
    And match each response contains {categoria:'periferico'}

Scenario: 
    And path 'productos', 999
    When method GET
    Then status 404
    And match response.mensaje == 'Producto no encontrado'

Scenario:
    And path 'usuarios/1'
    When method GET
    Then status 200
    And match response.nombre == 'Ana'

Scenario:
    And path 'usuarios', 1    
    When method GET
    Then status 200
    And match response.nombre == 'Ana'

Scenario: 
    And path 'usuarios/9'
    When method GET
    Then status 404
    And match response.mensaje == 'Usuario no encontrado' 

# Si no encuentra la categoría devuelve una lista vacía, no un 404
Scenario: 
    And path 'productos'
    And param categoria = 'audio'
    When method GET
    Then status 200
    And match response == '#[0]'