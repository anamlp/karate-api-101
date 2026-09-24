@m02
Feature: DSL de Karate sin HTTP

Background: 
    * def iva = 0.21
    * def conIva = function(precio){ return precio * (1 + iva) }

Scenario:
    Given def nombre = 'Teclado'
    And def precio = 25
    And def etiquetas = ['periferico', 'usb']
    And def producto = { nombre: 'Teclado', precio: 25, stock: 10 }
    Then match nombre == '#string'
    And match precio == '#number'
    And match etiquetas == ['#string', '#string']
    And match etiquetas == '#array'
    And match etiquetas == '#[2]'
    And match producto == '#object'
    And match producto.nombre == '#string'
    And match producto.precio == '#number'
    And match producto.stock == '#number'

Scenario: IVA de un teclado
    When def resultado = conIva(100)
    Then match resultado == 121