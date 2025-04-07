# Elastic Stack

There is a group of services to collect and analyse logs. 

- ElasticSearch: runs on port `9200`
- Logstash: runs on port `5044`
- Kibana: runs on port `5601`
- Filebeat: reads `logs/nginx` directory

## Interations

- Nginx writes logs to the mounted `logs/nginx` directory
- Filebeat reads the logs to the mounted `logs/nginx` directory and sends it to Logstash
- Logstash processes the logs and saves it to ElasticSearch
- ElasticSearch provides the logs for Kibana
- Kibana shows logs in UI

## Run

```
docker compose -f compose.elk.yml up
```

## Commands

```
# get ES indexes
curl "http://localhost:9200/_cat/indices?v"

# get Logstash pipelines
curl "http://localhost:9600/_node/pipelines?pretty"
```
