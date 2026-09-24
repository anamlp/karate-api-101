@ignore
Feature: Helper — obtener un producto por id

Scenario:
    Given url baseUrl 
    And path 'productos', id
    When method GET
    Then status 200
