Feature: Delete user
Scenario: Delete user details
    * def baseUrl = 'https://dummyjson.com'
    * def userId = 2
    Given url baseUrl + '/users/' + userId
    When method delete
    Then status 200
    * print 'Deleted user details:', response
    * match response.isDeleted == true  