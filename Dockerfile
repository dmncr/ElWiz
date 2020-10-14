FROM alpine:latest
RUN apk add --update npm
RUN npm install mqtt
RUN npm install fs
RUN npm install yamljs
RUN npm install node-schedule
RUN npm install request
RUN npm install request-promise
RUN apk add git
RUN git clone -n https://github.com/dmncr/ElWiz.git
WORKDIR /ElWiz
RUN git checkout f806921
RUN apk del git
RUN rm -rf .git
RUN rm .gitignore Pulse-AP.jpg README.md config.yaml.sample fetchprices.md fetchprices.js
ENTRYPOINT ["node", "elwiz.js"]
