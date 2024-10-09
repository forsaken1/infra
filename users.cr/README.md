# Users service on Crystal

## Run

Make sure you have installed Crystal, Postgres and Kafka

```
shards
crystal sam.cr db:setup
crystal sam.cr db:migrate
crystal run app.cr
```
