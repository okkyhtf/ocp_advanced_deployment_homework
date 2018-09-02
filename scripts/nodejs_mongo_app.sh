#!/usr/bin/env bash

export GUID=`hostname|awk -F. '{print $2}'`

# Create new project specific for smoke test run
oc new-project smoke-test

# Verify the cluster deployment by installing sample NodeJS app
oc new-app nodejs-mongo-persistent

# Follow the deployment status
while true
do
  sleep 1m
  dc=`oc status | grep deployed | wc -l`
  if [$dc == "2"] then
    break
  else
  fi
done

# Expose route to public
url="http://nodejs-mongo-persistent-smoke-test.apps.$GUID.example.opentlc.com"
success=curl $url

if $success then
  echo "Smoke test successfully deployed"
else
  echo "Smoke test failed to be deployed"
fi

# Delete the sample project
oc delete project smoke-test

exit $success
