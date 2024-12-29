# Infrastructure

The project about how to build distributed infrastructure with microservices from the scratch

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

- users service creates an user in it's database and pushes it to kafka
- kafka sends it to other services (sessions, admins, etc) databases

## TODO

- [x] Users service (Crystal)
- [x] Sessions service (Elixir)
- [x] Message brocker integration (Kafka)
- [x] Tests (RSpec)
- [x] Integration tests (RSpec)
- [x] Admins service
- [ ] Swagger docs
- [ ] API Gateway
- [ ] UI (React)
- [ ] Autotests (Playwright)
- [ ] CI (Github)
- [ ] Log collecting (ELK)
- [ ] Metrics & Monitoring, Alerts (Zabbix, Grafana)
- [ ] Local infrastructure (Docker Compose)
- [ ] Production infrastructure, Deployment (Docker Swarm, Kubernetes)
- [ ] Infrastructure automatization (Ansible, Terraform)
