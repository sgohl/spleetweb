#!/bin/sh

if [ ! -d spleeter ]; then 
  git clone https://github.com/deezer/spleeter.git
fi

cd spleeter
git pull -f
cd ..

git pull -f
docker-compose up --build -d
