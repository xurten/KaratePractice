Feature: GET API feature

Scenario: Get user details
Given url base_url+'/public/v2/users'
And path '841756'
When method GET
Then status 200
* print response
* def json_response = response
* print json_response
* match json_response.name == 'Guru Tagore'
* match json_response.id == 841756
* match json_response.email == 'tagore_guru@lowe.net'
* match json_response.gender == 'male'
* match json_response.status == 'active'

Scenario: Get user details - not found
Given url base_url+'/public/v2/users'
And path '30'
When method GET
Then status 404