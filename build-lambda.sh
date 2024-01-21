#!/bin/sh

set -euo pipefail

jpm build --local

mkdir -p lambda
rm -f lambda/lambda.zip

cd build
zip -r ../lambda/lambda.zip hello.handler
zip -j ../lambda/lambda.zip ../bootstrap
