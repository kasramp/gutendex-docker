#!/bin/bash
set -ev

git config --global user.email $EMAIL
git config --global user.name $USERNAME
git symbolic-ref HEAD refs/heads/$(git branch --show-current)
git symbolic-ref HEAD
git submodule update --init --recursive

IMAGE_NAME=kasramp/gutendex
docker login -u "$DOCKER_USERNAME" --password-stdin <<< "$DOCKER_PASSWORD" &&
docker buildx create --use &&
docker buildx build --pull --platform linux/amd64,linux/arm64 --build-arg VERSION="$TAGGED_VERSION" -t "$IMAGE_NAME":latest -t "$IMAGE_NAME:$TAGGED_VERSION" . --push

if git diff --quiet && git diff --cached --quiet; then
  echo "No changes to commit." &&
  echo "Successfully build and pushed Docker $TAGGED_VERSION to Docker Hub"
else
  git add "version.txt" &&
  git commit -m "Update version file to $TAGGED_VERSION" &&
  git push origin HEAD:master &&
  echo "Successfully build and pushed Docker $TAGGED_VERSION to Docker Hub"
fi