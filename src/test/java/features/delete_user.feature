Feature: Detele user with delete api

Background:
  * url 'https://gorest.co.in'
  
  * def random_string =
  """
  	function(s){
  	    var text="";
  	    var pattern = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  	    for(var i=0; i<s; i++)
  	       text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
  	    return text;   
  	}
  """
  * def my_random_string = random_string(10)
  * print my_random_string
  
  * def request_payload =
  """
  {
  	"name":"Andrzej Z11111",
  	"gender": "male",
  	"status": "active"
  }

  """
  * request_payload.email = my_random_string + '@gmail.com'
  * print request_payload

Scenario: Delete a user with the given user id
# 1. Create a user with POST CALL
Given path '/public/v2/users'
And request request_payload
And header Authorization = 'Bearer '+ token_id
When method POST
Then status 201
And match $.id == '#present'
And match $.name == '#present'
* print response

# Fetch the user id
* def user_id = $.id
* print user_id
# 2. Delete the same user
Given path '/public/v2/users/' + user_id
And header Authorization = 'Bearer '+ token_id
When method DELETE
Then status 204

# 3. Get the same user with the same user id
Given url  base_url + '/public/v2/users/' + user_id
When method GET
Then status 404
And match $.message == 'Resource not found'