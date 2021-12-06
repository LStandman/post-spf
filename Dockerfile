FROM debian:testing-slim

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates \
    postfix \
    postfix-lmdb \
    postfix-policyd-spf-python \
  && rm -rf /var/lib/apt/lists/*

RUN sh /usr/lib/postfix/configure-instance.sh

EXPOSE 25
CMD ["sh", "-c",  \
  "queue_dir=$(/usr/sbin/postconf -o inet_interfaces= -hx queue_directory) \
  ;  cp /etc/hosts /etc/resolv.conf $queue_dir/etc/ \
  && /usr/sbin/postfix start-fg"]
