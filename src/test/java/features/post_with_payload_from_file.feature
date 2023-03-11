Feature: Get user using post api

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
  * def random_string_value = random_string(10)
  * print random_string_value
  * def request_payload = read('classpath:src/test/resources/payload/user.json')
  * set request_payload.email = random_string_value + '@gmail.com'
  * print request_payload

Scenario: Create a user with the given data
Given path '/public/v2/users'
	And request request_payload
	And header Authorization = 'Bearer '+ token_id
When method POST
Then status 201
	And match $.id == '#present'
	And match $.name == '#present'
* print response