FROM ubuntu:latest

RUN apt-get update
RUN apt -y install git man man-db

RUN useradd -d /home/user/ -m -p user -s /bin/bash user
RUN echo "user:user" | chpasswd

WORKDIR /home/user
RUN git clone https://github.com/qtile/qtile.git /home/user/qtile

COPY texts/* /home/user/texts/
# COPY etc/issue /etc/issue
COPY etc/motd /etc/motd
COPY etc/hints /etc/hints
COPY questions.txt /etc/.questions

COPY .bashrc /home/user/.bashrc

RUN chown -R root:root /home/user

USER user
CMD /bin/bash
