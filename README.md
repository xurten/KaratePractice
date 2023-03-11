# Karate practice
Simple features with Karate framework for API testing(Java, Javascript, Json, API, Cucumber, BDD, eclipse) 

This repository contains tests for GET, POST, PUT, DELETE actions.


**Example scenario for delete action:**

```
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
```


**All features are under src/test/java/features**


