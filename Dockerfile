FROM alpine:latest

# Update and install dependencies
RUN apk update && apk upgrade
RUN apk add g++ gcc make perl openssl-dev curl mariadb-client mariadb-dev nmap linux-headers pcre-dev
ADD netxms-5.1.1.tar.gz /tmp

# Build NetXMS server with MariaDB driver
WORKDIR /tmp/netxms-5.1.1/
RUN ./configure --with-mariadb --with-server --with-mariadb-compat-headers
RUN make && make install

# Copy config file to /etc/
COPY netxmsd.conf /etc/

# Remove build files
WORKDIR /
RUN rm -rf /tmp/netxms-5.1.1/

EXPOSE 4701

# Initialize Database (will not hurt existing database)
RUN nxdbmgr init

# Start netxmsd as a daemon
ENTRYPOINT ["/usr/local/bin/netxmsd"]
