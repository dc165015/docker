FROM ubuntu:latest as development
LABEL Description="This image is shipped with VSCode, Node.js, Meteor and etc."  Version="1.0" maintainer="165015@qq.com"

ENV LANG en_US.utf8
EXPOSE 3000 80

COPY instdev.sh /tmp/
COPY 163.xenial.sources.list /tmp/
RUN cp /tmp/163.xenial.sources.list /etc/apt/ \
    && cp /etc/apt/sources.list /etc/apt/sources.list.bak \
    && cp /etc/apt/163.xenial.sources.list /etc/apt/sources.list \
    && apt-get update

RUN apt-get install -y --no-install-recommends  sudo

ARG usr=bn

RUN usradd -d /home/$usr -G adm,root -m $usr \
    && groupadd -r autologin \
    && gpasswd -a $usr autologin \
    && echo '$usr' | passwd $usr --stdin

RUN sed -i 's/\r$//' /tmp/instdev.sh \
    && chmod +x /tmp/instdev.sh

RUN echo $(hostname -I | cut -d\  -f1) $(hostname) | sudo tee -a /etc/hosts \
    && DEBIAN_FRONTEND=noninteractive sudo -E -u $usr -H /tmp/instdev.sh

# expose 3000 for meteor app

#FROM centos:latest as production
#RUN apt-get install ca-certificates
#WORKDIR /root/
#COPY --from=development /coding/bn .
#CMD ["node ./bn/main.js"]
