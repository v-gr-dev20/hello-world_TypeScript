"Hello, World!" demo on http://localhost with TypeScript + Node.js + Docker

[MIT License](LICENSE)

### Prerequisites
git - to get the project\
Docker & Docker Compose - to build the project and run\
Access to https://hub.docker.com - for the Docker to automatically download the Node.js image at project build stage\
make - to simplify the start

### Install
```
mkdir demo \
&& git clone --branch master -- https://github.com/v-gr-dev20/hello-world_TypeScript demo \
&& cd demo
```
### Build the project
```
make build
```
### Make production
```
make production
```
### Start the server with built project
```
make up
```
### View the result in browser
`http://localhost:3000`
### Stop the server
```
make down
```
