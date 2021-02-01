FROM ubuntu:16.04


RUN apt-get update && apt-get install -y asciio \
                            x11-apps \
                            sudo \
                             && rm -rf /var/lib/apt/lists/*
                            # rm apt lists will reduce image size.

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer

RUN echo "export DISPLAY=host.docker.internal:0"  >> /home/developer/.bashrc

CMD /usr/bin/asciio

