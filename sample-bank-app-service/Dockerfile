FROM node:10

MAINTAINER Nikhil Goenka "dynatraceone@dynatrace.com" 

RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz

# Update aptitude with new repo
RUN apt-get update

# Install software 
RUN apt install -y kubectl
