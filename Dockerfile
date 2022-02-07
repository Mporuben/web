FROM node:14.18-buster

WORKDIR /app

COPY . .

RUN npm i

CMD [ "npm" "run" "dev" ]

EXPOSE 3030

VOLUME /app
