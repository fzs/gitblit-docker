#!/bin/bash

set -eux

gb_version=1.9.1
image_version=1



docker build -t gitblit/gitblit:${gb_version}-${image_version} .  && \
docker tag gitblit/gitblit:${gb_version}-${image_version} gitblit/gitblit:${gb_version}     && \
docker tag gitblit/gitblit:${gb_version}-${image_version} gitblit/gitblit:${gb_version%.*}  && \
docker tag gitblit/gitblit:${gb_version}-${image_version} gitblit/gitblit:latest


docker build -t gitblit/gitblit:${gb_version}-${image_version}-rpc --build-arg GITBLIT_RPC=admin .  && \
docker tag gitblit/gitblit:${gb_version}-${image_version}-rpc gitblit/gitblit:${gb_version}-rpc     && \
docker tag gitblit/gitblit:${gb_version}-${image_version}-rpc gitblit/gitblit:${gb_version%.*}-rpc  && \
docker tag gitblit/gitblit:${gb_version}-${image_version}-rpc gitblit/gitblit:rpc



docker build -t gitblit/gitblit:${gb_version}-${image_version}-alpine -f Dockerfile.alpine .  && \
docker tag gitblit/gitblit:${gb_version}-${image_version}-alpine gitblit/gitblit:${gb_version}-alpine     && \
docker tag gitblit/gitblit:${gb_version}-${image_version}-alpine gitblit/gitblit:${gb_version%.*}-alpine  && \
docker tag gitblit/gitblit:${gb_version}-${image_version}-alpine gitblit/gitblit:alpine



docker build -t gitblit/gitblit:${gb_version}-${image_version}-rpc-alpine -f Dockerfile.alpine --build-arg GITBLIT_RPC=admin .  && \
docker tag gitblit/gitblit:${gb_version}-${image_version}-rpc-alpine gitblit/gitblit:${gb_version}-rpc-alpine     && \
docker tag gitblit/gitblit:${gb_version}-${image_version}-rpc-alpine gitblit/gitblit:${gb_version%.*}-rpc-alpine  && \
docker tag gitblit/gitblit:${gb_version}-${image_version}-rpc-alpine gitblit/gitblit:rpc-alpine

docker image ls

echo ""
echo Run docker push gitblit/gitblit to publish
