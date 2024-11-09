# Users service

The service for user registration and managing user's data

## Data

users
- id
- uuid
- email
- password_hash
- is_admin
- created_at
- updated_at

## Methods

### Without auth token

POST /users - create new user (registration)

### With auth token

GET /user - get current user's data

PUT /user - update current user's data

POST /passwords - create new password, send confirmation code to email
