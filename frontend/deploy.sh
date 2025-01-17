#! /bin/bash
set -xe
sudo docker login -u ${CI_REGISTRY_USER} -p${CI_REGISTRY_PASSWORD} ${CI_REGISTRY}
sudo docker network create -d bridge sausage_network || true
sudo docker rm -f sausage-frontend || true
sudo docker run -d --name sausage-frontend \
     -p 8080:80 \
     --network=sausage_network \
     --restart=always \
     "${CI_REGISTRY_IMAGE}"/sausage-frontend:$CI_COMMIT_SHA
     # -v /tmp/${CI_PROJECT_DIR}/frontend/default.conf:/etc/nginx/conf.d/default.conf \
