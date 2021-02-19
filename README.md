# Postfix + SPF Docker
A debian docker for Postfix that comes with an SPF policy daemon. It automatically sets up a chroot environment on start.

Configure Postfix with postconf, or bind mount config from the host into /etc/postfix/.
Bind mount config for the policy daemon from the host into /etc/postfix-policyd-spf-python/.

For logging, bind mount /dev/log:/dev/log.
Note that if you dynamically change the chroot folder you must manually set up the chroot environment.
