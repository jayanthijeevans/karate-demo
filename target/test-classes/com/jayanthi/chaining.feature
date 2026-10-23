Feature: Chaining Demo
Scenario: Chaining - Create and reuse ID
    * def baseUrl = 'https://reqres.in/api'
    * header x-api-key = 'reqres-free-v1'
  Given url baseUrl + '/users'
  And request { name: 'Jayanthi', job: 'QA Trainer' }
  When method POST
  Then status 201
    * def createdId = response.id
    * def myName = response.name
    * print 'My created ID:', createdId
    * print 'My name:', myName