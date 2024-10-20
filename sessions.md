# Sessions service

The service for handling authentification, authorization and managing user sessions

## Data

sessions
- id
- user_id
- token
- created_at
- updated_at

## Methods

### Without auth token

POST /sessions - create new session (authenification)

### With auth token

get /session?token=TOKEN - get user id and session id by session token

GET /sessions - get list of sessions

DELETE /sessions/:id - remove session
