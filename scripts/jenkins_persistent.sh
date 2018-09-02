#!/usr/bin/env bash

# Create new project specific for smoke test run
oc new-project cicd

# Verify the cluster deployment by installing sample NodeJS app
oc new-app jenkins-persistent
