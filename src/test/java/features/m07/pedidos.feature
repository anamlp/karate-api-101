@m07
Feature:

Background: 
    * def mock = karate.start('classpath:mock/pedidos.feature')
    * url 'http://localhost:' + mock.port

Scenario:
    Given path 'pedidos', 77
    When method get
    Then status 200
    And match response.id == '77'
    And match response.estado == 'enviado'
    * mock.stop()

Scenario:
    Given path 'pedidos'
    When method post
    Then status 201
    And match response.id == '88'
    And match response.estado == 'creado'
    * mock.stop()

    