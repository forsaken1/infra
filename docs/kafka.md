# Kafka

## Run

### Docker

```
docker run -d --name zookeeper \
  -e ALLOW_ANONYMOUS_LOGIN=yes \
  -e ZOOKEEPER_CLIENT_PORT=2181 \
  -e ZOOKEEPER_TICK_TIME=2000 \
  -p 2181:2181 \
  confluentinc/cp-zookeeper
```

```
docker run -d --name kafka \
  -e KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181 \
  -e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://localhost:9092 \
  -e KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 \
  -p 9092:9092 \
  --link zookeeper:zookeeper \
  confluentinc/cp-kafka
```

## Commands

```
# topics list
kafka-topics --bootstrap-server localhost:9092 --list

# detailed information about topic
kafka-topics --bootstrap-server localhost:9092 --topic users --describe

# list of messages in topic
kafka-console-consumer --bootstrap-server localhost:9092 --topic users --from-beginning
```
