FROM node
#EXPOSE 8080

COPY server.js .
COPY db /db/
COPY routes /routes/
COPY package.json .
RUN npm install
CMD node server.js