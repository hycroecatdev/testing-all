FROM ubuntu:22.04

ENV container docker
STOPSIGNAL SIGRTMIN+3

# base packages
RUN apt-get update && apt-get install -y \
    systemd systemd-sysv dbus \
    sudo curl wget iproute2 \
    tmate openssh-server docker.io \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# ssh setup
RUN mkdir -p /run/sshd && \
    echo "root:root" | chpasswd && \
    systemctl enable ssh

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/sbin/init"]
