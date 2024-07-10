#Download Node Alpine image
FROM node:alpine As build

#Setup the working directory
WORKDIR /dist/src/app
RUN npm cache clean --force

#Copy package.json
COPY package.json package-lock.json ./


#Copy other files and folder to working directory
COPY . .


RUN npm install

#Build Angular application in PROD mode
RUN npm run build --prod

#Download NGINX Image
FROM nginx:latest AS ngi

#RUN rm -rf /usr/share/nginx/html/*

COPY --from=build /dist/src/app/dist/workwise-frontend/browser /usr/share/nginx/html

COPY /nginx.conf  /etc/nginx/conf.d/default.conf
EXPOSE 80
