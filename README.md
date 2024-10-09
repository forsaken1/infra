# Infrastructure

The project about how to build distributed infrastructure with microservices from the scratch

## Naming

Directories in the root: MODULE_NAME.LANGUAGE

## Services

- users (see [users.md](users.md))
- sessions (see [sessions.md](sessions.md))
- admins (see [admins.md](admins.md))
- emails (see [emails.md](emails.md))

## Databases

- Postgres
- Kafka (see [kafka.md](kafka.md))

## Interactions

- users service creates an user in it's database and pushes it to kafka
- kafka sends it to other services (sessions, admins, etc) databases
