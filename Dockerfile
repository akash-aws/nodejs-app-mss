FROM node:14.20.1
WORKDIR /app
COPY . . 
RUN npm install
EXPOSE 9981
CMD ["node","app.js"]
