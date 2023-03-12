# Karate practice

This repository contains example test scenarios using Karate DSL for API testing. Repository contains tests for GET, POST, PUT, DELETE actions.
(Java, Javascript, Json, API, Cucumber, BDD, eclipse) 

# Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

# Prerequisites
- Java 8 or higher
- Maven

# Installing
Clone the repository:
```
git clone https://github.com/xurten/karate_practice.git
```

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

# Running the Tests
You can run the tests from the command line by running the following command from the root of the project:
```
mvn clean test
```
**All features are under src/test/java/features**


