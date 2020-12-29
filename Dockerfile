# https://mherman.org/blog/dockerizing-a-react-app/
# pull official base image
FROM node:13.12.0-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install --silent
RUN npm install react-scripts@3.4.1 -g --silent

# add app
COPY . ./

# start app
CMD ["npm", "start"]

# docker run -it --rm
# -p 3001:3000
# -v ${PWD}:/app -v /app/node_modules
# -e CHOKIDAR_USEPOLLING=true
# aws-deploy-test:dev

# docker run
# -p 3001:3000
# aws-deploy-test:dev