#Base image
FROM ubuntu
LABEL version="latest" maintainer="Luiz Gustavo Lucena <lgustavolp@gmail.com>"

#Update the image
RUN apt-get update
RUN apt install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update

#Install python
RUN apt install -y python3.7
RUN apt install -y python3-pip

#Install node and npm
RUN apt install -y nodejs
RUN apt install -y npm

#Install playwright
RUN npx playwright install

#install robotframework and seleniumlibrary
RUN pip3 install robotframework --break-system-packages
RUN pip3 install robotframework-browser --break-system-packages
RUN rfbrowser init

#Install Tools used
RUN apt-get install -y git
RUN apt-get install -y xvfb 
RUN apt-get install -y zip 
RUN apt-get install -y wget 
RUN apt-get install ca-certificates 

#Install dependency
RUN apt-get install -y libnss3-dev libasound2-plugins libxss1 libappindicator3-1 libindicator7 xdg-utils fonts-liberation

#Sets the environment variable for the token
ARG GIT_TOKEN

#Clone Repository
#RUN git clone git@github.com:lgustavolp/stdRobotFram.git
RUN git clone https://${GIT_TOKEN}:x-oauth-basic@github.com/lgustavolp/stdRobotFram.git

#Define Workdir to execute the test commands 
WORKDIR /stdRobotFram

#Execute container
CMD ["tail", "-f", "/dev/null"]
