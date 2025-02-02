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

curl -X POST http://localhost:3000/login -H "Content-Type: application/json" -d '{
"email": "john@example.com",
"password": "password123"
}'

User.last.authenticate("password123")
it return true of the password are correct

JWT Authentication
https://rubygems.org/gems/jwt/versions/1.5.4?locale=en

token = JsonWebToken.encode({ msg: "nard" })

decoded_payload = JsonWebToken.decode(token)

# Security Checklist for Login

## Frontend (React)

1. **Use HTTPS**:

   - Ensure that your frontend communicates with the backend over HTTPS to encrypt data in transit.

2. **Validate Inputs**:

   - Validate email format and password length on the client side before sending the data to the backend.
     Done in Front and and Backend Validation (Fix the UI)

3. **Store Tokens Securely**:

   - Store JWT tokens in HttpOnly cookies to prevent access from JavaScript and mitigate XSS attacks.

4. **Prevent XSS**:

   - Use libraries like DOMPurify to sanitize user inputs and prevent Cross-Site Scripting (XSS) attacks.

5. **Rate Limiting**:

   - Implement rate limiting on login attempts to prevent brute force attacks.

6. **CSRF Protection**:
   - Use CSRF tokens to protect against Cross-Site Request Forgery (CSRF) attacks if using cookies for authentication.

## Backend (Rails API)

1. **Hash Passwords with bcrypt**:

   - Use `bcrypt` to hash and store passwords securely.

2. **Use JWT for Authentication**:

   - Use JWT tokens for stateless authentication. Ensure tokens are signed and have a short expiration time.

3. **Rate Limiting**:

   - Use `rack-attack` to implement rate limiting and prevent abuse and DDoS attacks.

4. **Validate Inputs**:

   - Validate and sanitize all inputs on the server side to prevent SQL injection and other injection attacks.

5. **CSRF Protection**:
   - Use CSRF protection if using cookies for authentication.
