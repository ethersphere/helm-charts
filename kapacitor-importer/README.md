# kapacitor-importer

This chart is used to run a job that imports batch or stream .tick scripts into an existing kapacitor instance.


For more information, check the default [`values.yaml`](values.yaml). You need to overwrite the `kapacitorURL` to point to your kapacitor service.


The following is an example on how you can create your own batch script:

```yaml

# Set the address to your kapacitor service
kapacitorUrl: http://your-kapacitor-service:9092

# Add custom batch scripts. Note: They must end with .tick
batchScripts:
 # Example CPU Alert
 cpu_alert.tick: |-
   dbrp "telegraf"."autogen"
   batch
       |query('''
           SELECT mean(usage_idle)
           FROM "telegraf"."autogen"."cpu"
       ''')
           .period(5m)
           .every(5m)
           .groupBy(time(1m), 'cpu')
       |alert()
           .crit(lambda: "mean" < 70)
           .log('/tmp/batch_alerts.log')
```
