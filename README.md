# Infrastructure

The project about how to build distributed infrastructure with microservices from the scratch

Detailed information about all infrastructure [here](infra.md)

## Naming

Directories in the root: SERVICE_NAME.LANGUAGE

## Services

- users (see [users.md](users.md))
- sessions (see [sessions.md](sessions.md))
- admins (see [admins.md](admins.md))

## Databases

- Postgres (see [postgres.md](postgres.md))

## Message brockers

- Kafka (see [kafka.md](kafka.md))

## Interactions

- `users service` creates an user in `users service` database (in `postgres`) and pushes it to `kafka`
- `kafka` provide queues for other services
- `sessions service` (consumer) pulls a message and creates an user in `sessions service` database
- `admins service` uses `users service` database 

## TODO

- [x] Users service (Crystal)
- [x] Sessions service (Elixir)
- [x] Message brocker integration (Kafka)
- [x] Tests (RSpec)
- [x] Integration tests (RSpec)
- [x] Admins service
- [ ] Swagger docs
- [x] API Routing
- [ ] UI (React)
- [ ] Autotests (Playwright)
- [ ] CI (Github)
- [ ] Log collecting (ELK)
- [ ] Metrics & Monitoring, Alerts (Zabbix, Grafana)
- [x] Local infrastructure (Docker Compose)
- [ ] Production infrastructure, Deployment (Docker Swarm, Kubernetes)
- [ ] Infrastructure automatization (Ansible, Terraform)
