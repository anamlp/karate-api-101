@m02 @expr
Feature: Expresiones extra del DSL

Scenario: regex y assert
    * def nombre = 'Teclado'
    * match nombre == '#regex T.*'
    * def precio = 25
    * assert precio * 2 == 50

Scenario: funcion JS en bloque. Convertir a minúsculas
    * def etiqueta =
      """
      function(texto) {
        return texto.toLowerCase()
      }
      """
    * match etiqueta('Monitor') == 'monitor'

Scenario: funcion JS en bloque. Convertir a minúsculas
    * def etiqueta =
      """
      function(texto) {
        return texto.toUpperCase()
      }
      """
    * match etiqueta('Monitor') == 'MONITOR'


@ignore
Scenario: regex y assert
    * def nombre = 'Teclado'
    * match nombre == '#regex M.*'
    * def precio = 25
    * assert precio * 2 == 50