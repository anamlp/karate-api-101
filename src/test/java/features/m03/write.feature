@m03 @http-write
Feature: Peticiones POST contra la tienda

Background:
    Given url baseUrl
    And header Content-Type = 'application/json'
Scenario:
    And path 'productos'
    And request { nombre: 'Dock USB', precio: 60, categoria: 'periferico', stock: 5 }
    When method POST
    Then status 201
    And match response.id == 99
    And match response.nombre == 'Dock USB'
    And match response.precio == 60

Scenario:
    And path 'productos', 1
    And request {nombre: 'Teclado mecánico', precio: 90, categoria: 'periferico', stock: 3}
    When method PUT
    Then status 200
    And match response.nombre == 'Teclado mecánico'

Scenario: 
    And path 'productos', 3
    When method GET
    Then status 200
    And match response.stock == 8
    And match response.id == 3

Scenario: 
    And path 'productos', 3
    And request {stock: 1}
    When method PATCH
    Then status 200
    And match response.stock == 1
    And match response.id == 3

Scenario: 
    And path 'productos', 2
    When method delete
    Then status 204

Scenario: 
    And path 'productos'
    And request {nombre: 'Cable', categoria: 'periferico', stock: 20}
    When method POST
    Then status 201
    And match response.precio == '#null'