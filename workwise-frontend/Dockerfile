FROM node:alpine As build

WORKDIR /dist/src/app
RUN npm cache clean --force

COPY package.json package-lock.json ./


COPY . .


RUN npm install

RUN npm run build --prod

FROM nginx:latest AS ngi

#RUN rm -rf /usr/share/nginx/html/*

COPY --from=build /dist/src/app/dist/workwise-frontend/browser /usr/share/nginx/html

COPY /nginx.conf  /etc/nginx/conf.d/default.conf
EXPOSE 80
