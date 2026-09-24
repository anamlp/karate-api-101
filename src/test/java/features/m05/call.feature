@m05
Feature:

Scenario: call pasa el id y devuelve la respuesta
    * def llamado = call read('classpath:features/helpers/get-producto.feature') { id: 2 }
    * match llamado.response.nombre == 'Monitor'
    * match llamado.response.id == 2

Scenario: call pasa el id y devuelve la respuesta
    * def llamado = call read('classpath:features/helpers/get-producto.feature') { id: 1 }
    * match llamado.response.nombre == 'Teclado'
    * match llamado.response.id == 1

Scenario: call pasa el id y devuelve la respuesta
    * def llamado = call read('classpath:features/helpers/get-usuario.feature') { id: 1 }
    * match llamado.response.nombre == 'Ana'
    * match llamado.response.id == 1

Scenario: Sin usar el call para poder comprobar un 404
    Given url baseUrl
    And path 'productos', 999
    When method GET
    Then status 404