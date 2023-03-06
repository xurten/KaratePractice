Feature: Print hello world

Scenario: Hello world scenario

	* print 'hellow world'
	* print 'aaaaa'

Scenario: New scenario

	* def balance = 200
	* def fee = 20
	* def tax = 10
	* print balance + ' ' + fee + ' ' + tax
	* print (balance*fee)