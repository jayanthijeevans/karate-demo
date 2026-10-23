Feature: update user
  Scenario: update user details
    * def baseUrl = 'https://dummyjson.com'
    * def userId = 2
    Given url baseUrl + '/users/' + userId
    And request { "firstName": "Jayanthi", "lastName": "Trainer QA" }
    When method put
    Then status 200
    * print 'Updated user details:', response
    * match response.firstName == 'Jayanthi'
    * match response.lastName == 'Trainer QA'
