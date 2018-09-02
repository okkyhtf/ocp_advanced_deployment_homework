#!/usr/bin/env bash

export GUID=`hostname|awk -F. '{print $2}'`

# Create new project specific for smoke test run
oc new-project smoke-test

# Verify the cluster deployment by installing sample NodeJS app
oc new-app nodejs-mongo-persistent
