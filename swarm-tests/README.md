# swarm-test

This chart is used to execute go tests against the swarm codebase.

A cronjob will be created and will fetch whatever version you define and execute tests against the codebase.

Have a look at the [`values.yaml`](values.yaml) file to check the default values. You can easily set the version and the command that you want to use for testing. See the example below:

```yaml
test:
  config:
    # Version to be used (branch, commit hash, tag)
    version: master
    # Test command to execute
    command: go test -v ./swarm/... -longrunning true
```
