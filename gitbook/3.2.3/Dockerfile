FROM node:10
RUN npm install -g gitbook-cli
RUN gitbook --version
ADD demo demo
RUN cd demo && gitbook install && gitbook build
