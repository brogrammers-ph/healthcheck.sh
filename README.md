# healthcheck.sh

> Server health checker integrated with Slack/Email/Discord.

## Suggested Usage

Create a **cron job** automatically trigger the healthcheck job.

```shell
# Every minute
* * * * * absolute/path/to/healthcheck.sh >> absolute/path/to/healthcheck.log
```