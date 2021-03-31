# react-nginx

This repository contains a custom nginx server to be used for front end apps within the Assembly Line.

The server is available as a Docker image.

## Motivation

There are multiple front end components within the Assembly Line that need to be dockerized. Since there are a lot of commonalities, it makes sense to package them into a single Docker image rather than let all the front end apps repeat themselves.

## Features

- PushState compatible (i.e. no need for hashes `#` within URL)
- Checks for configuration variables on Docker startup
- Creates `config.js` file containing the configuration variables

## Usage

Sample Dockerfile for your React app

```
# Build stage
FROM node:alpine

ARG PUBLIC_PATH=/

# Make sure that React app is built using the right path context
ENV PUBLIC_URL=${PUBLIC_PATH}

WORKDIR /usr/src/app
COPY . ./

RUN set -ex; \
  npm install; \
  npm run build

# Run stage
FROM <THISPACKAGE:latest> #TODO: replace with right package name
WORKDIR /usr/share/nginx/html
#COPY --from=0 /usr/src/app/build/ ./
#COPY --from=0 /usr/src/app/public/*.template ./
```

Tento repozitář je udržován v rámci projektu OPZ č. CZ.03.4.74/0.0/0.0/15_025/0013983.
![Evropská unie - Evropský sociální fond - Operační program Zaměstnanost](https://data.gov.cz/images/ozp_logo_cz.jpg)
