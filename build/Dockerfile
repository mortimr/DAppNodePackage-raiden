FROM raidennetwork/raiden:v2.0.0

RUN mkdir -p /home/.raiden
WORKDIR /root/.raiden

COPY init.sh /usr/bin
ENTRYPOINT [ "/usr/bin/init.sh" ]