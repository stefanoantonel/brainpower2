FROM node:alpine
WORKDIR /app
COPY package.json bower.json /app/
RUN npm install
RUN apk add --update git && \
    rm -rf /tmp/* /var/cache/apk/*
RUN npm run bower -- --allow-root install
COPY . /app
EXPOSE 3000
CMD ["npm", "run", "dev"]