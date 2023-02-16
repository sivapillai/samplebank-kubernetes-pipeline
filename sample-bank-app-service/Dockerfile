FROM node:10

MAINTAINER Nikhil Goenka "dynatraceone@dynatrace.com" 

# Update aptitude with new repo
RUN apt-get update

# Install software 
RUN apt install -y kubectl

RUN git clone https://github.com/nikhilgoenkatech/Bank-Sample-app.git 
WORKDIR /Bank-Sample-app/
