FROM node:10
RUN npm install -g gitbook-cli
RUN gitbook --version
RUN cd demo && gitbook install && gitbook build
