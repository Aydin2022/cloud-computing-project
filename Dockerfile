FROM node:19-alpine as base
FROM base as development
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
EXPOSE 3003
CMD [ "npm", "run", "start-dev" ]

FROM base as production
WORKDIR /app
COPY package.json .
RUN npm install --only=production
COPY . .
EXPOSE 3003
CMD [ "npm", "run", "start" ]