Feature: store data in json

Scenario: saving in json file
    * def baseUrl = 'https://dummyjson.com'
    Given url baseUrl + '/users/add'
    And request { firstName: 'demo1', lastName: 'Trainer', age: 48 }
    When method POST
    Then status 201
    #def createdId = response.id
    # def dataToSave = { id: '#(createdId)', name: 'demo1' }
    * karate.write(response, 'createdUser.json')
    * def saved = read('file:target/createdUser.json')
    * print saved

Scenario: using saved data from json file
    * def baseUrl = 'https://dummyjson.com'
    Given url baseUrl + '/users/2'
    When method GET
    Then status 200
    * def savedData = read('file:target/createdUser.json')
    #* print savedData.id
    * print savedData