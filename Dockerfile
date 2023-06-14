# Inspired by:
# https://containers.dev/
# https://www.youtube.com/watch?v=owHfKAbJ6_M
# https://blog.saeloun.com/2022/07/12/docker-cache.html
ARG BASE_IMAGE=ruby:2.7-alpine3.16
ARG CACHE_IMAGE=${BASE_IMAGE}

# Build stage for the gem cache
FROM ${CACHE_IMAGE} AS gem-cache
RUN mkdir -p /usr/local/bundle

# Image with Bundler Installed
FROM $BASE_IMAGE AS base
RUN apk update && apk add --no-cache build-base gcc cmake git jekyll
RUN gem install bundler:2.2.25
WORKDIR /usr/src/app

# Copy gems from a gem-cache build stage
FROM base AS gems
COPY --from=gem-cache /usr/local/bundle /usr/local/bundle
COPY Gemfile Gemfile.lock ./
RUN bundle install