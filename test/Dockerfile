FROM ubuntu:latest

RUN apt-get update

RUN useradd -d /home/user/ -m -p user -s /bin/bash user
RUN echo "user:user" | chpasswd

WORKDIR /home/user

COPY texts/* /home/user/texts/
# COPY etc/issue /etc/issue
COPY etc/motd /etc/motd

COPY .bashrc /home/user/.bashrc

RUN chown -R root:root /home/user

USER user
CMD /bin/bash
