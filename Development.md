Termilan Test
curl -X POST http://localhost:3000/users -H "Content-Type: application/json" -d '{
"username": "john_doe",
"email": "john@example.com",
"password": "password123",
"bio": "I love coding!",
"profile_picture": "https://example.com/john.jpg",
"first_name": "John",
"last_name": "Doe"
}'

User.last.authenticate("password123")
it return true of the password are correct

JWT Authentication
https://rubygems.org/gems/jwt/versions/1.5.4?locale=en

token = JsonWebToken.encode({ msg: "nard" })

decoded_payload = JsonWebToken.decode(token)
