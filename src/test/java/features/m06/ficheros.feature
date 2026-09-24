@m06 @ddt-ficheros
Feature:

Background: 
    Given url baseUrl

Scenario Outline:
    And path 'productos', <id>
    When method get
    Then status 200
    And match response.nombre == '<nombre>'
    And match response.precio == <precio>

    Examples:
        | read('productos.csv') |

Scenario Outline:
    And path 'productos', <id>
    When method get
    Then status 200
    And match response.nombre == '<nombre>'

    Examples:
        | read('casos.json') |