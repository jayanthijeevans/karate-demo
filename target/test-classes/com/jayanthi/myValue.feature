Feature: My Value - Quick Win

Background:
    * def baseUrl = 'https://reqres.in/api'
    * header x-api-key = 'reqres-free-v1'

Scenario: I know my value
  # Step 1: Create - like you create value
  Given url baseUrl + '/users'
  And request { name: 'Jayanthi', job: 'DSA Trainer + QA' }
  When method POST
  Then status 201
    * def myId = response.id
    * def myJob = response.job
    * print 'My new ID is:', myId
    * print 'My Job: ', myJob


  # Step 2: Show your strength
  Given url baseUrl + '/users/' + myId
  When method GET
  Then status 404 # because reqres is a fake api 
    * print 'Today I am:', 'Strong, Capable, Valuable'
    * print 'My Fact: I fixed 4 scenarios green!'