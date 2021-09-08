FROM ubuntu:20.04
RUN apt-get update && apt-get upgrade
RUN apt-get -y install curl sudo openssh-client vim iproute2 jq lsof bc rsync grsync bsdmainutils gpg

# add non-root user with sudo access
RUN adduser --disabled-password --gecos "" nonroot
RUN usermod -aG sudo nonroot

# disable password 
RUN echo "nonroot  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/nonroot

USER nonroot

RUN sudo mkdir -p /opt/cardano/cnode
RUN sudo chown nonroot /opt/cardano/cnode


WORKDIR /home/nonroot

RUN mkdir .ssh
COPY --chown=nonroot ./samples/config .ssh


COPY --chown=nonroot ./scripts scripts
RUN sudo chmod +x scripts/*

CMD [ "bash" ]