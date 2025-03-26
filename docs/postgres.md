# Postgres

## Run

### Docker

```
docker run --name postgres \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -p 5432:5432 \
  -v postgres-data:/var/lib/postgresql/data \
  -d postgres
```
