Feature: GET API headers feature

Scenario: Pass the user request with headers
Given header Connection = 'Keep-Alive'
When url base_url+'/public/v2/users'
	And path '843216'
When method GET
Then status 200
* print response

Scenario: Pass the user request with headers second way
* def request_headers = {Connection : 'Keep-Alive', Content-Type:'application/json'}
Given headers request_headers
When url base_url+'/public/v2/users'
	And path '843216'
When method GET
Then status 200
* print response

Scenario: Pass the user request with headers third way
* configure headers = {Connection : 'Keep-Alive', Content-Type:'application/json'}
When url base_url+'/public/v2/users'
	And path '843216'
When method GET
Then status 200
* print response