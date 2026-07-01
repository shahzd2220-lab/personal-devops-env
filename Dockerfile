# syntax=docker/dockerfile:1

FROM node:22-alpine AS runtime

WORKDIR /app
ENV NODE_ENV=production

COPY package.json ./
COPY src ./src

USER node
EXPOSE 8080

CMD ["node", "src/server.js"]
