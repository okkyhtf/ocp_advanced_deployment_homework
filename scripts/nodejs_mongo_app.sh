#!/usr/bin/env bash

# Create new project specific for smoke test run
oc new-project smoke-test

# Verify the cluster deployment by installing sample NodeJS app
oc new-app nodejs-mongo-persistent

# Follow the deployment status
oc status -v

# Delete the sample project
#oc delete project smoke-test
