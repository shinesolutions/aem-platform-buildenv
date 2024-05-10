#!/bin/bash
docker --version
source /home/.virtualenvs/py36/bin/activate
make clean deps lint build-docker-base
cat logs/aem-platform-buildenv-base.log
echo "${SHINEOPENSOURCE_DOCKERHUB_TOKEN}" | docker login --username shinesolutions --password-stdin
docker inspect shinesolutions/aem-platform-buildenv
make publish-docker-base
