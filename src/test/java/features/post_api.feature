Feature: Get user using post api

Background:
  * url 'https://gorest.co.in'
  * def request_payload =
  """
  {
  	"name":"Andrzej Z11111",
  	"email": "andrzejz112211@gmail.com",
  	"gender": "male",
  	"status": "active"
  }
  """

Scenario: Create a user with the given data
Given path '/public/v2/users'
And request request_payload
And header Authorization = 'Bearer '+ token_id
When method POST
Then status 201
And match $.id == '#present'
And match $.name == '#present'
* print response