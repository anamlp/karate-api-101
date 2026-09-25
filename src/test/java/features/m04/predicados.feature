@m04 @predicados
Feature: Predicados sobre numeros

  Background:
    Given url baseUrl
    And path 'productos', 2
    When method get
    Then status 200

# El nombre debe empezar con M
# El precio debe ser un número
# El precio debe ser mayor que 0, positivo
# El stock debe ser un número mayor o igual a 0
# La barra _ equivale al valor actual en el predicado
  Scenario: precio positivo y stock no negativo
    And match response.nombre == '#regex M.*'
    And match response.precio == '#number'
    And match response.precio == '#? _ > 0'
    And match response.stock == '#? _ >= 0'

  Scenario: El producto no trae claves de mas
    And match response contains only
      """
      {
        id: '#number',
        nombre: '#string',
        precio: '#number',
        categoria: '#string',
        stock: '#number'
      }
      """
  Scenario: El producto no trae claves de mas
    And match response contains 
      """
      {
        id: '#number',
        nombre: '#string',
        precio: '#number',
        categoria: '#string'
      }
      """

# Este debe fallar pues devolverá un atributo más a mayores de los indicados
# Haciendo que el contains only no se cumpla
@ignore
  Scenario: El producto no trae claves de mas
    And match response contains only
      """
      {
        id: '#number',
        nombre: '#string',
        precio: '#number',
        categoria: '#string'
      }
      """

# Obtenemos fallo pues el precio no cumple con la condición de ser mayor a 1000 (en este caso es 180)
@ignore
Scenario: precio positivo y stock no negativo
    And match response.nombre == '#regex M.*'
    And match response.precio == '#number'
    And match response.precio == '#? _ > 1000'
    And match response.stock == '#? _ >= 0'

Scenario: 
    Given url baseUrl
    And path 'productos'
    When method get
    Then status 200
    And match response[0] contains only
      """
      {
        id: '#number',
        nombre: '#string',
        precio: '#number',
        categoria: '#string',
        stock: '#number'
      }
      """
    And def id = response[0].id
    And def nombre = response[0].nombre
    And def precio = response[0].precio
    And def categoria = response[0].categoria
    And def stock = response[0].stock
    And match id == '#number'
    And match nombre == '#string'
    And match precio == '#number'
    And match categoria == '#string'
    And match stock == '#number'
    And match nombre == '#regex T.*'
    And match precio == '#? _ > 0'
    And match stock == '#? _ >= 0'