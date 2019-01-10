#!/bin/sh
URL=""

send_alert()
{
  # do curl to slack, discord or send and email 
  # to alert your team.
  MESSAGE="$(date +%F_%H:%M:%S) $1"
  curl -X POST -H 'Content-type: application/json' \
  --data '{"text":"'"$MESSAGE"'"}' \
  # https://hooks.slack.com/services/[foo]/[bar]/[id]
}

do_healthcheck()
{
  URL=$1
  if [ $(curl -sL -w "%{http_code}\\n" "$URL" -o /dev/null) != "200" ]; then
    echo "NOT OK - $URL"
    send_alert "NOT OK - $URL"
  else 
    echo "OK - $URL"
  fi
}

do_healthcheck $URL