@m04 @listas
Feature:

Background: 
    Given url baseUrl
    And path 'productos'
    When method get
    Then status 200

Scenario:
    And match response == '#[3]'
    And match response[0].nombre == 'Teclado'

Scenario:
    And match each response == 
        """
        {
            id : '#number', 
            nombre : '#string', 
            precio : '#number', 
            categoria : '#string', 
            stock : '#number'
        }
        """

Scenario: 
    And match response[*].id contains 2
    And match response[*].categoria contains 'pantalla'
    And match response[*].nombre contains 'Webcam'

Scenario: 
    And match each response[*].stock == '#number'
    And match each response[*].stock == '#? _ >= 0'