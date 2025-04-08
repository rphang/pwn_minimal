FROM ubuntu:22.04

WORKDIR /root

RUN apt-get update -y && \
    apt-get upgrade -y
RUN apt-get install -y gdb wget curl python3 build-essential tmux xterm pip
RUN pip install --upgrade pip && \
    pip install --upgrade pwntools
RUN apt-get install -y vim

COPY ./vulnerable.c /root/vulnerable.c
COPY ./exploit.py /root/exploit.py
RUN gcc -o vulnerable -no-pie -fno-stack-protector vulnerable.c -w && chmod +x vulnerable
RUN echo "kernel.randomize_va_space = 0" > /etc/sysctl.d/00-disable-randomize-va-space.conf && \
    echo "kernel.randomize_va_space = 0" > /etc/sysctl.conf && \
    sysctl -p /etc/sysctl.d/00-disable-randomize-va-space.conf && \
    sysctl -p /etc/sysctl.conf
RUN echo "vm.mmap_min_addr = 0" > /etc/sysctl.d/00-mmap-min-addr.conf && \
    echo "vm.mmap_min_addr = 0" > /etc/sysctl.conf && \
    sysctl -p /etc/sysctl.d/00-mmap-min-addr.conf && \
    sysctl -p /etc/sysctl.conf
RUN echo "kernel.exec-shield = 0" > /etc/sysctl.d/00-disable-exec-shield.conf && \
    echo "kernel.exec-shield = 0" > /etc/sysctl.conf && \
    sysctl -p /etc/sysctl.d/00-disable-exec-shield.conf && \
    sysctl -p /etc/sysctl.conf