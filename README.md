# Kittens API

This is a lightweight implementations of Rails capacities, it provides a simple model with both html and json request, it offers access to the following routes:

| HTTP Verb | Path                | Controller#Action | Description              |
|-----------|---------------------|-------------------|--------------------------|
| GET       | /kittens            | kittens#index     | List all kittens         |
| GET       | /kittens/new        | kittens#new       | Show form to create      |
| POST      | /kittens            | kittens#create    | Create a new kitten      |
| GET       | /kittens/:id        | kittens#show      | Show a specific kitten   |
| GET       | /kittens/:id/edit   | kittens#edit      | Show form to edit        |
| PATCH/PUT | /kittens/:id        | kittens#update    | Update a specific kitten |
| DELETE    | /kittens/:id        | kittens#destroy   | Delete a specific kitten |
| GET       | /search             | search#index      | List several images from Flikr |
| GET       | /search:id          | search#show       | Shows an specific Flikr img |

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
response = RestClient.get("http://localhost:3000/search.json?query=cats")
response.to_s

# JSON response

json_response = RestClient.get("http://localhost:3000/kittens", accept: :json)
puts json_response.body
json_response = RestClient.get("http://localhost:3000/search.json?query=cats", accept: :json)
puts json_response.body
```


# Demo - Views

**kittens/**
  
![kittens_index](https://github.com/user-attachments/assets/4232f3ba-5672-4602-bdb4-8158d7685d71)

**kittens/:id**
  
![kittens_show](https://github.com/user-attachments/assets/0410c05a-d8d1-41d4-972e-90d8d340e8d7)

**kittens/new**
  
![kittens_new](https://github.com/user-attachments/assets/a7a202a8-ab05-4e17-a1ae-1f9c3ee33c14)

**[Creation msg] kittens/**
  
![kittens_creation_message](https://github.com/user-attachments/assets/a69fa1b4-ef48-49d8-bdad-1c578bc2605e)

---

**search/**
  
![search_view](https://github.com/user-attachments/assets/b74c794f-8e69-4e9c-a0ee-43ad108c0f29)

**search/:id**
  
![search_show](https://github.com/user-attachments/assets/23a6e0e7-47ae-4262-9123-9bb1e38a38ca)



