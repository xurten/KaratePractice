Feature: Update user using PUT

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

Scenario: Update a user with the given data
# 1 call
Given path '/public/v2/users'
	And request request_payload
	And header Authorization = 'Bearer '+ token_id
When method POST
Then status 201
	And match $.id == '#present'
	And match $.name == '#present'
* print response

# fetch the user id from the post call response
* def user_id = $.id
* print user_id

# 2 call -- to update the user
* def new_request_payload =
 """
 {
    "gender": "female",
    "status": "inactive"
 }
 """
* print new_request_payload 
Given path '/public/v2/users/'+ user_id
	And request new_request_payload
	And header Authorization = 'Bearer '+ token_id
When method PUT
Then status 200
	And match $.id == '#present'
	And match $.id == user_id
	And match $.name == '#present'
	And match $.email == request_payload.email
	* print response