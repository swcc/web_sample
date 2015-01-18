FROM swcc/docker-postgresql:9.4
MAINTAINER Paul B. <paul+swcc@bonaud.fr>

ENV DATABASE_NAME mydb
ENV DATABASE_USER myuser
ENV DATABASE_PASSWORD mypwd
ENV DATABASE_ACTIVATED 1

# AUFS w*t/!f bug
RUN mkdir /etc/ssl/private-copy; mv /etc/ssl/private/* /etc/ssl/private-copy/; rm -r /etc/ssl/private; mv /etc/ssl/private-copy /etc/ssl/private; chmod -R 0700 /etc/ssl/private; chown -R postgres /etc/ssl/private


CMD ["/etc/postgresql/setup.sh"]
