Feature: GET API feature

Scenario: get user details
Given url 'https://gorest.co.in/public/v2/users'
And path '771226'
When method GET
Then status 200
* print response
* def json_response = response
* print json_response
* match json_response.name == 'Bhuvaneshwar Menon'
* match json_response.id == 771226
* match json_response.email == 'bhuvaneshwar_menon@blanda.io'
* match json_response.gender == 'female'
* match json_response.status == 'active'

Scenario: get user details - not found
Given url 'https://gorest.co.in/public/v2/users'
And path '30'
When method GET
Then status 404