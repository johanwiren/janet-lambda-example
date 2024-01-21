#!/bin/sh

set -euo pipefail

docker build -t janet-lambda-example --build-arg WITH_SOURCE=${WITH_SOURCE:-} .
docker run --rm janet-lambda-example tar -cf - lambda | tar xf -
aws lambda update-function-code --function-name janet-lambda-example --zip-file fileb://lambda/lambda.zip
