FROM alpine:3.12

RUN apk update && apk add ansible openssh-client openssh-keygen sshpass && \
    adduser -D -s /bin/sh ansible

RUN mkdir /home/ansible/playbook

WORKDIR /home/ansible/playbook

COPY tp_dev_ynov.pem tp_dev_ynov.pem

RUN chmod 600 tp_dev_ynov.pem && \
  chown -R ansible:ansible /home/ansible/playbook

USER ansible

ENTRYPOINT [ "" ]