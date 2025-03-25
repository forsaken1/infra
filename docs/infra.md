# Infrastructure

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
