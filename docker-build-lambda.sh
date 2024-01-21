#!/bin/sh

set -euo pipefail

docker build -t janet-lambda-example .
docker run --rm janet-lambda-example tar -cf - lambda | tar xf -
