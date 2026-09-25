@m06 @ddt-tabla
Feature:

Background: 
    Given url baseUrl

Scenario Outline:
    And path 'productos/<id>'
    When method get
    Then status 200
    And match response.nombre == '<nombre>'
    And match response.categoria == '<categoria>'

    Examples:
      | id | nombre  | categoria  |
      | 1  | Teclado | periferico |
      | 2  | Monitor | pantalla   |
      | 3  | Webcam  | periferico |

# Para ejecutar tags con un and -> mvn test -Dkarate.options="--tags @m06 --tags  @ddt-tabla"
# Que se ejecuten únicamente los escenarios con los tags @m06 y @ddt-tabla
# Si queremos los que tengan una de las dos tags, un or sería las etiquetas separadas por comas 
# Ejemplo: mvn test -Dkarate.options="--tags @m06,@ddt-tabla"
