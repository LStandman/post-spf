FROM debian:testing-slim

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
		ca-certificates \
		postfix \
		postfix-policyd-spf-python \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 25
CMD ["sh", "-c", "/usr/lib/postfix/configure-instance.sh && /usr/sbin/postfix start-fg"]
