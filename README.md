## API Version Types

### Technologies used
    - Ruby 2.5.0
    - sinatra

### how to access different version of Api
- Versioning Via Subdomain
	- configuration before
      	- if  deploy this little application and point the two domain names api1.example.com and api2.example.com
     	 - we need to add an external gem called sinatra-subdomain.
	`gem install sinatra-subdomain`

-  Versioning In The URL
	- configuration before
		- install the sinatra-contrib gem to use namespaces
			- `gem install sinatra-contrib`
	- test use `Curl`
		- Getting the v1 representation:
			- `curl http://localhost:4567/v1/users`
			- output
				```json
                [
  					{"first_name":"Thibault", "last_name":"Denizet", "age":25},
  					{"first_name":"Simon", "last_name":"Random", "age":26},
      				{"first_name":"John", "last_name":"Smith", "age":28}
				]
                ```
		- Getting the v2 representation:
			- `curl http://localhost:4567/v2/users`
			- output
				```json
            	[
  					{"full_name":"Thibault Denizet", "age":25},
  					{"full_name":"Simon Random", "age":26},
  					{"full_name":"John Smith", "age":28}
				]
                ```
-  Versioning In The URL With a Parameter
	- test use `Curl`
		- Getting the v1 representation:
			- `curl http://localhost:4567/users?version=v1`

		- Getting the v2 representation:
			- `curl http://localhost:4567/users?version=v2`

- Versioning In A Custom Header
	- test use `Curl`
		- Getting the v1 representation:
			- `curl http://localhost:4567/users -H 'Version: 1.0'`

		- Getting the v2 representation:
			- `curl http://localhost:4567/users -H 'Version: 2.0'`

- Versioning With A Custom Media Type
	- test use `Curl`
		- Getting the v1 representation:
			- `curl http://localhost:4567/users - H'Accept:application/vnd.awesomeapi.v1+json''`

		- Getting the v2 representation:
			- `curl http://localhost:4567/users - H'Accept:application/vnd.awesomeapi.v2+json''`

- Versioning In A Custom Header
	- test use `Curl`
		- Getting the v1 representation:
			- `curl http://localhost:4567/users \
  -H 'Accept: application/vnd.awesomeapi+json; version=1'`

		- Getting the v2 representation:
			- `curl http://localhost:4567/users \
  -H 'Accept: application/vnd.awesomeapi+json; version=2''`

- No Version.
	- test use `Curl`
		- Getting the v1 representation:
			- `curl http://localhost:4567/users `
