# Kittens API

This is a lightweight implementations of rails capacities, it provides a simple model with both html and json request, it offers access to the following routes:

| HTTP Verb | Path                | Controller#Action | Description              |
|-----------|---------------------|-------------------|--------------------------|
| GET       | /kittens            | kittens#index     | List all kittens         |
| GET       | /kittens/new        | kittens#new       | Show form to create      |
| POST      | /kittens            | kittens#create    | Create a new kitten      |
| GET       | /kittens/:id        | kittens#show      | Show a specific kitten   |
| GET       | /kittens/:id/edit   | kittens#edit      | Show form to edit        |
| PATCH/PUT | /kittens/:id        | kittens#update    | Update a specific kitten |
| DELETE    | /kittens/:id        | kittens#destroy   | Delete a specific kitten |

# Requirements 

To test you need to have installed previously 
```bash
gem install rest-client
```

# Usage

For now this project allows just local testing:

1. Run your server

```bash
rails server -b 0.0.0.0
```

2. Test using IRB, open a new console and type: 
```bash
irb
```

3. Within IRB run:
```ruby
require 'rest-client' # If you get an error here, you most likely need to install the gem.
response = RestClient.get("http://localhost:3000/kittens")
response.to_s

# JSON response

json_response = RestClient.get("http://localhost:3000/kittens", accept: :json)
puts json_response.body
```
