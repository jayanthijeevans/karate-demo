Feature: Reusable - Create User

  Background:
    * url baseUrl

  Scenario:
    Given path '/users/add'
    And request { firstName: 'Jayanthi', lastName: 'Trainer QA', age: 49 }
    When method post
    Then status 201
    * def userId = response.id
    * def userResponse = response
    * print 'Reusable created ID:', userId
  