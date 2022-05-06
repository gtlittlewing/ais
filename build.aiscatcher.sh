#!/bin/bash
source ./.env
source ./${APPNAME}/${APPNAME}.env
TIMESTAMP="date --rfc-3339=seconds"

echo "[start build ${APPNAME}]`${TIMESTAMP}`"

docker compose down

docker compose build \
 --build-arg REPOSITORY="${ARG_REPOSITORY}" \
 --build-arg PROJECT="${ARG_PROJECT}" \
 --build-arg BRANCH="${ARG_BRANCH}" \
 --force-rm \
${APPNAME}

echo "[finish build ${APPNAME}]`${TIMESTAMP}`"
