FROM ubuntu:20.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    openssh-client \
    curl \
    wget \
    gnupg2 \
    software-properties-common \
    tmate

CMD ["tmate", "-F"]
