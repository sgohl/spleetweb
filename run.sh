#!/bin/sh

git pull -f
docker-compose up --build -d
