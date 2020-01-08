#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e161972147f0f0019bb4380/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e161972147f0f0019bb4380
curl -s -X POST https://api.stackbit.com/project/5e161972147f0f0019bb4380/webhook/build/ssgbuild > /dev/null
cd exampleSite && hugo --gc --baseURL "/" --themesDir ../.. && cd ..
curl -s -X POST https://api.stackbit.com/project/5e161972147f0f0019bb4380/webhook/build/publish > /dev/null
