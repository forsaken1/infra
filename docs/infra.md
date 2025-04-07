# Infrastructure

There is a group of main services with databases and message broker.

## Naming

Directories in the `services` directory: SERVICE_NAME.LANGUAGE

## Services

- users (see [users.md](docs/users.md))
- sessions (see [sessions.md](docs/sessions.md))
- admins (see [admins.md](docs/admins.md))

## Databases

- Postgres (see [postgres.md](docs/postgres.md))
- ElasticSearch (see [elk.md](docs/elk.md))

## Message brockers

- Kafka (see [kafka.md](docs/kafka.md))

## Interactions

- `users service` creates an user in `users service` database (in `postgres`) and pushes it to `kafka`
- `kafka` provide queues for other services
- `sessions service` (consumer) pulls a message and creates an user in `sessions service` database
- `admins service` uses `users service` database

## Run

### Default

Just run every service and databases/message brockers. See detailed info in README of a service.

### Docker

```
docker compose -f compose.infra.yml up
# NOTE 1: run DB migrations manually for users.cr TODO
# NOTE 2: restart sessions.ex if consumers are dead for first run TODO
```

## Tests

### Integration tests

```
cd infra.test
rspec
```
