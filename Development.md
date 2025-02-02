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
