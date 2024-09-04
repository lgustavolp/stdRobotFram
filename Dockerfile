#Base image
FROM ubuntu
LABEL version="latest" maintainer="Luiz Gustavo Lucena <lgustavolp@gmail.com>"

#update the image
RUN apt-get update

RUN apt install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update

#install python
RUN apt install -y python3.7
RUN apt install -y python3-pip

RUN apt install -y nodejs

RUN apt install -y npm

RUN nodejs -v 
RUN npm -v

#install robotframework and seleniumlibrary
RUN pip3 install robotframework --break-system-packages
RUN pip3 install robotframework-browser --break-system-packages
RUN rfbrowser init
#RUN pip3 install robotframework-seleniumlibrary

#The followig are needed for Chrome and Chromedriver installation
RUN apt-get install -y git
RUN apt-get install -y xvfb 
RUN apt-get install -y zip 
RUN apt-get install -y wget 
RUN apt-get install ca-certificates 
RUN apt-get install -y libnss3-dev libasound2-plugins libxss1 libappindicator3-1 libindicator7 xdg-utils fonts-liberation
RUN git clone https://github.com/lgustavolp/stdRobotFram.git

WORKDIR /stdRobotFram

#Execute container
CMD ["tail", "-f", "/dev/null"]
