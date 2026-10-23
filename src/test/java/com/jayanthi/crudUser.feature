# this is to demonstrate how to use Karate for CRUD operations on a user API
Feature: CRUD operations on user API
Background:
  * def baseUrl = 'https://dummyjson.com'
  Scenario: Create a new user
    Given url baseUrl + '/users/add'
    And request { firstName: 'Jayanthi', lastName: 'Trainer QA' }
    When method post
    Then status 201
    * print 'Created user details:', response
    * match response.firstName == 'Jayanthi'
    * match response.lastName == 'Trainer QA'
  Scenario: Get user details
    * def userId = 2
    Given url baseUrl + '/users/' + userId
    When method get
    Then status 200
    * print 'User details:', response
    * match response.id == userId
    
  Scenario: Update user details
    * def userId = 2
    Given url baseUrl + '/users/' + userId
    And request { "firstName": "JayanthiJ", "lastName": "QA Automation Trainer" }
    When method put
    Then status 200
    * print 'Updated user details:', response
    * match response.firstName == 'JayanthiJ'
    * match response.lastName == 'QA Automation Trainer'
  Scenario: Delete user details
    * def userId = 2
    Given url baseUrl + '/users/' + userId
    When method delete
    Then status 200
    * print 'Deleted user details:', response
    * match response.isDeleted == true