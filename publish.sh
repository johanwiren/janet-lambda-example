#!/bin/sh

set -euo pipefail

aws lambda update-function-code --function-name janet-lambda-example --zip-file fileb://lambda/lambda.zip
