# Infrastructure

A project about building distributed infrastructure with microservices from scratch.

## Main services infrastructure

Detailed information about main services infrastructure [here](docs/infra.md).

There are a several web services that written with different languages. The services interacts with each other with requests and message broker (Kafka). They use Postgres as default database management system and each service uses its own database (with exception for dependent services). 

## ELK infrastructure

Detailed information about ELK instrastructure [here](docs/elk.md).

It is used as a log storage.

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
