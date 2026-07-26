# CI/build setups will run this file

# -- OS baseline -- #
# keep in sync with Dockerfile_local, Dockerfile_typescript
FROM node:20-alpine as base_frontend
WORKDIR /opt/project

# TLS certs are loaded outside of containerization

# Copy in code - unlike Dockerfile_local, no outside mechanism
# transfers code.
FROM base_frontend AS code_dependencies
WORKDIR /opt/project
COPY ../code/frontend .
# todo: check that we need to explicitly copy .env files and
#       traverse up a parent directory
# note: env files at the base of /opt/project
COPY ../code/frontend/.env.development /opt/project/
COPY ../code/frontend/.env.production /opt/project/
COPY ../code/frontend/.env /opt/project/


# code building layer
FROM code_dependencies AS build
WORKDIR /opt/project
# NODE_ENV gets passed at build stage
# set environment env for both deps and our code building
ARG NODE_ENV
ENV NODE_ENV=$NODE_ENV
ARG REACT_APP_NODE_ENV
ENV REACT_APP_NODE_ENV=$REACT_APP_NODE_ENV

RUN corepack prepare yarn@stable --activate
# `yarn install --immutable` is equivalent to
# `npm ci --omit=dev` for clean install
# devDependencies are not used if NODE_ENV=production
#RUN yarn install --immutable
#RUN yarn run build

# Final layer
FROM scratch
COPY --from=build /opt/project/build /bundle

