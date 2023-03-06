Feature: Get API feature

Scenario: Get user details
* print token_id
Given header Authorization = 'Bearer'+ token_id
Given url base_url+'/public/v2/users'
And path '843216'
When method GET
Then status 200
* print response