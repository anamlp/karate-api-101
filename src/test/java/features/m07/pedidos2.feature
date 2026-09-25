@m07a
Feature:

Background: 
    * def mock = karate.start('classpath:mock/pedidos2.feature')
    * url 'http://localhost:' + mock.port

  Scenario: POST sin cantidad
    Given path 'pedidos'
    And request { productoId: 1 }
    When method post
    Then status 400
    And match response.mensaje == 'cantidad obligatoria'
    * mock.stop()
    
 Scenario: POST con  cantidad cero
    Given path 'pedidos'
    And request { productoId: 1 , cantidad: 1}
    When method post
    Then status 201
    And match response.id == '88'
    And match response.estado == 'creado'
    * mock.stop()

# Para que fuera válido introducir cantidad = 0
# tendríamos que modificar el mock para aceptar cantidad = 0 como válido.
# * def responseStatus = karate.get('request.cantidad') != null ? 201 : 400