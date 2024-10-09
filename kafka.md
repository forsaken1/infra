# Kafka

## Commands

```
# topics list
kafka-topics --bootstrap-server localhost:9092 --list

# detailed information about topic
kafka-topics --bootstrap-server localhost:9092 --topic users --describe

# list of messages in topic
kafka-console-consumer --bootstrap-server localhost:9092 --topic users --from-beginning
```
