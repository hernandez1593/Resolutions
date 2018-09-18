#!/bin/bash

mkdir -p tmp/

newDyno=$(curl -n -s -X POST https://api.heroku.com/apps/$HEROKU_APP_NAME/dynos \
   -H "Accept: application/json" \
   -H "Authorization: Bearer $HEROKU_API_KEY"\
   -H 'Accept: application/vnd.heroku+json; version=3' \
   -H 'Content-Type: application/json' \
   -d '{"command": "rake db:migrate; echo \"MIGRATION COMPLETE\"", "attach": "false"}' | tee tmp/migration_command |
python -c 'import sys, json; myin=sys.stdin; print( json.load(myin)["name"] )')

cat tmp/migration_command

echo "One-Shot dyno created for migration at: $newDyno"

# create a log session so we can monitor the completion of the command
logURL=$(curl -n -s -X POST https://api.heroku.com/apps/$HEROKU_APP_NAME/log-sessions \
  -H "Accept: application/json" \
  -H "Authorization: Bearer $HEROKU_API_KEY" \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/vnd.heroku+json; version=3' \
  -d "{\"lines\": 100, \"dyno\": \"$newDyno\"}" | tee tmp/log_session_command | python -c 'import sys, json; myin=sys.stdin; print(json.load(myin)["logplex_url"])')

cat tmp/log_session_command
