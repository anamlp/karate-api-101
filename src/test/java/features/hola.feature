@m01
Feature: DSL de Karate sin HTTP

Scenario: Comprobar una variable string con match
    * def mensaje = 'hola'
    * match mensaje == 'hola'
    * match mensaje == '#string' 
    # La línea anterior comprueba que el mensaje sea una cadena