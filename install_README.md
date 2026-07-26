# samwise-frontend



## project skeleton

### project initialization

Dockerfiles, docker-compose.yaml, .env exists before initialization

Dockerfile_typescript is usable to bootstrap.

Create a new project in a new directory for copying out:

> npm create vite@latest baseline -- --template react-swc

then install deps in the container so we have node_modules available: 

> npm install

then copy the initialized project with node_modules back to the host: 

> docker cp <whatever_container_name>:/opt/project/baseline .

copy/paste/move files tot he root directory.

### post initialization

after we copy our baseline out, modify the configuration and add more dependencies


### env vars and vite modes

https://vite.dev/guide/env-and-mode#env-files

Dev hot-reload and connection to a backend:

- Go webserver/API: delivers HTML file referencing the hot-reload vite server

- Vite/typescript server: provides linting and transpilation

modify the `index.html` file created by the initial template and copy it to repo that will provide 
backend services.  In non-local/dev, we want to copy the built index as the JS source will have a hash to handle cache-busting/changes.
