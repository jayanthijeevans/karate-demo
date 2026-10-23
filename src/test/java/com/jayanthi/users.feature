Feature: My First Karate Test

Scenario: Get user from JSONPlaceholder
  Given url 'https://jsonplaceholder.typicode.com/users/1'
  When method GET
  Then status 200
  And print response
    * print 'Name is:', response.name

Scenario: Get users list from ReqRes
    * header x-api-key = 'reqres-free-v1'
  Given url 'https://reqres.in/api/users?page=2'
  When method GET
  Then status 200
  And print response
    * print 'Total users:', response.total


Scenario: Way 1 - Direct URL (Simplest)
    * header x-api-key = 'reqres-free-v1'
  Given url 'https://reqres.in/api/users/7'
  When method GET
  Then status 200
    * print response
    * print 'Email:', response.data.email
    * print 'Name:', response.data.first_name
  And match response.data.id == 7

Scenario: Way 2 - Filter from List (jsonPath)
    * header x-api-key = 'reqres-free-v1'
  Given url 'https://reqres.in/api/users?page=2'
  When method GET
  Then status 200
    * print 'Total in DB:', response.total
    * print 'On this page:', response.data.length
    * def specificUser = karate.jsonPath(response, "$.data[?(@.id==7)]")[0]
    * print 'Filtered user:', specificUser
    * print 'Filtered email:', specificUser.email
  And match specificUser.id == 7