Feature: Create User API

Scenario: Use variables
    * def baseUrl = 'https://reqres.in/api'
    * def myName = 'Jayanthi'
    * header x-api-key = 'reqres-free-v1'
  Given url baseUrl + '/users'
  And request { name: '#(myName)', job: 'Trainer' }
  When method POST
  Then status 201
  And print response
    * def userId = response.id
    * print 'Created userId:', userId

Scenario: Use variables trial 2
    * def baseUrl = 'https://reqres.in/api'
    * def myName = 'demo1'
    * header x-api-key = 'reqres-free-v1'
  Given url baseUrl + '/users'
  And request { name: '#(myName)', job: 'Trainer' }
  When method POST
  Then status 201
  And print response
    * def userId = response.id
    * def userJob = response.job
    * print 'Created userId:', userId
    * print  'Crated Jog:',userJob