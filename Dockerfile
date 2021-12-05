FROM debian:testing-slim

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
		ca-certificates \
		postfix \
		postfix-policyd-spf-python \
	&& rm -rf /var/lib/apt/lists/*

RUN /usr/lib/postfix/configure-instance.sh

EXPOSE 25
CMD ["sh", "-c", "/usr/sbin/postfix start-fg"]
