Feature: Test call E2E

  Background:
    * url baseUrl

  Scenario:
    * def createResult = call read('classpath:com/jayanthi/reuseableCreateUser.feature')
    * def realId = 1

    Given path '/users', realId
    When method get
    Then status 200

    Given path '/users', realId
    And request { firstName: 'JayanthiJ' }
    When method put
    Then status 200

    Given path '/users', realId
    When method delete
    Then status 200