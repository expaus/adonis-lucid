FROM node:10.15.3-alpine as build-deps

RUN apk update && apk upgrade && \
  apk add --update git && \
  apk add --update openssh && \
  apk add --update bash && \
  apk add --update wget

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build
