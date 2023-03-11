Feature: Update user with PUT

Background:
  * url 'https://gorest.co.in'
  * def request_payload =
  """
  {
  	"status": "inactive"
  }
  """

Scenario: Update the user with payload
Given path '/public/v2/users/968785'
	And request request_payload
	And header Authorization = 'Bearer '+ token_id
When method PUT
Then status 200
	And match $.id == '#present'
	And match $.name == '#present'
* print response