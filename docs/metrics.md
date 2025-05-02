# Metrics

A solution about metrics and alerts with help of Zabbix and Grafana.

## Run

```
docker compose -f compose.metrics.yml up
```

## Sign in

Go to http://localhost:3000 and use login `admin` and password `admin` for entering to Grafana

## Troubleshooting

`Cannot use database "zabbix": its "users" table is empty`

Go to https://www.zabbix.com/documentation/current/en/manual/appendix/install/db_scripts
