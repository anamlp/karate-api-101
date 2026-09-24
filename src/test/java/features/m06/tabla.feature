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