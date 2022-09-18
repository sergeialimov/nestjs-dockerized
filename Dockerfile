FROM node:18

# Create app directory
#WORKDIR ~/projects/pers/nestjs-dockerized/
# WORKDIR /usr/src/app
WORKDIR /sa/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package.json ./

RUN yarn install

# Production version
# RUN yarn --immutable

# Bundle app source
COPY . .

RUN yarn build

EXPOSE 8080
CMD [ "node", "dist/main.ts" ]
