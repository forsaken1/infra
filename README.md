# Infrastructure

A project about building distributed infrastructure with microservices from scratch

Detailed information about all infrastructure [here](docs/infra.md)

## Naming

Directories in the root: SERVICE_NAME.LANGUAGE

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

## TODO

- [x] Users service (Crystal)
- [x] Sessions service (Elixir)
- [x] Message brocker integration (Kafka)
- [x] Tests (RSpec)
- [x] Integration tests (RSpec)
- [x] Admins service (Python)
- [ ] Relation Database Replication (PostgreSQL)
- [ ] Distributed Database Integration (ElasticSearch)
- [ ] API Documentation (Swagger)
- [x] API Routing (Nginx)
- [ ] UI (React)
- [ ] UI tests (Playwright)
- [ ] CI (Github Actions)
- [ ] Status page
- [ ] Load balancer (Nginx)
- [x] Log collecting (ELK)
- [ ] Metrics & Monitoring, Alerts (Zabbix, Grafana)
- [x] Local infrastructure (Docker Compose)
- [ ] Production infrastructure, Deployment (Docker Swarm, Kubernetes)
- [ ] Infrastructure automatization (Ansible, Terraform)
- [ ] Bug tracking (Sentry)
- [ ] Code Storage (Gitlab)
