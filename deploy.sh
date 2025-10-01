#!/bin/bash
IMAGE_VERSION="${1:-latest}"
DOCKERHUB_USERNAME="${2:-$DOCKER_USERNAME}"
DOCKERHUB_PASSWORD="${3:-$DOCKER_PASSWORD}"

export ADMIN_EMAILS=admin@yahoo.com
export ADMIN_NAMES=admin
export DATABASE_HOST=localhost
export DATABASE_NAME=gutendex
export DATABASE_USER=db_username
export DATABASE_PASSWORD=db_password
export DATABASE_PORT=20712
export SECRET_KEY=super_secret_key
export EMAIL_HOST=smtp.mailgun.org
export EMAIL_HOST_ADDRESS=test@test.com
export EMAIL_HOST_PASSWORD=testpassword
export EMAIL_HOST_USER=testuser
export IMAGE_TAG="$IMAGE_VERSION"
docker login -u "$DOCKERHUB_USERNAME" --password-stdin <<< "$DOCKERHUB_PASSWORD" && \
docker stack deploy --with-registry-auth -c docker-compose-swarm.yml gutendex_stack