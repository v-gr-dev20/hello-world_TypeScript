FROM node as base
WORKDIR /home/node/app

RUN apt update -y \
 && apt -y install ed

RUN npm init -y \
 && npm install typescript --save-dev \
 && npm install --save express \
 && npm install -D @types/express

# editing the package.json
RUN ( ( printf '/"name":/c\n  "name": "typescript-node-docker",\n.\n' ;\
		printf '/"scripts":/,/},/d\n' ;\
		printf 'i\n' ;\
		printf '  "scripts": {\n' ;\
		printf '    "start": "NODE_PATH=./build node build/index.js",\n' ;\
		printf '    "build": "tsc -p ."\n' ;\
		printf '  },\n' ;\
		printf '.\n' ;\
		printf 'wq\n' ) |ed package.json )

RUN npx tsc --init

# editing the tsconfig.json
RUN ( ( printf '/"target":/c\n  "target": "esnext",\n.\n' ;\
		printf '/"moduleResolution":/c\n  "moduleResolution": "node",\n.\n' ;\
		printf '/"baseUrl":/c\n  "baseUrl": "./src",\n.\n' ;\
		printf '/"outDir":/c\n  "outDir": "./build",\n.\n' ;\
		printf 'wq\n' ) |ed tsconfig.json )

FROM base as release
COPY ./src .
RUN npm run build
