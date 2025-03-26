# Users service on Crystal

## Run

Make sure you have installed Crystal, Postgres, Kafka and Postgres

```
cp .env.example .env
shards
crystal sam.cr db:setup
crystal sam.cr db:migrate
crystal run app.cr
```

## Build

Check `.env` and comment all vars

```
docker build -t users.cr .
```
