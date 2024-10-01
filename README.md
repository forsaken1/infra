# Infrastructure

The project about how to build good distributed infrastructure with microservices from the scratch

## Naming

Directories in the root: MODULE_NAME.LANGUAGE

Also I'm trying to use DDD here

## Services

- users (see users.md)
- sessions (see sessions.md)
- admins (see admins.md)
- emails (see emails.md)

## Databases

- Postgres
- Kafka

## Third-party services

- Sendgrid

## Interactions

- users service creates an user in it's database and pushes it to kafka
- kafka sends it to other services (sessions, admins, etc) databases
