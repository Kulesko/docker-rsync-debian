FROM debian:bookworm-slim
LABEL authors="kulesko"

RUN useradd -d /home/userrc -m -s /bin/bash userrc
RUN apt update
RUN apt install --no-install-recommends --no-install-suggests -y rsync
RUN apt autoclean
RUN mkdir -p /etc/rsyncd
RUN mkdir -p /var/rsync_shared

COPY rsyncd.conf /etc/rsyncd.conf
COPY rsyncd.secrets /etc/rsyncd.secrets

RUN chmod 600 /etc/rsyncd.secrets
RUN chown -R userrc:userrc /var/rsync_shared

EXPOSE 873

CMD ["rsync", "--daemon", "--no-detach"]