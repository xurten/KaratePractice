Feature: Get API with Query Parameters

Scenario: Get all active users
* def query = {status:'active', gender: 'male', id:839881}
Given url base_url+'/public/v2/users'
And params query
When method GET
Then status 200
* print response

Scenario: Get all active users and get the count
* def query = {status:'active'}
Given url base_url+'/public/v2/users'
And params query
When method GET
Then status 200
* print response
* def json_response = response
* print json_response
* def user_count = json_response.length
* print user_count
* match user_count == 10