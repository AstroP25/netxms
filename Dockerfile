FROM alpine:3.16.2

# Update and install dependencies
RUN apk update && apk upgrade
RUN apk add g++ gcc make perl openssl-dev curl mariadb-client mariadb-dev nmap linux-headers pcre-dev
ADD netxms-4.1.420.tar.gz /tmp

# Build NetXMS server with MariaDB driver
WORKDIR /tmp/netxms-4.1.420/
RUN ./configure --with-mariadb --with-server --with-mariadb-compat-headers
RUN make && make install

# Copy config file to /etc/
COPY netxmsd.conf /etc/

# Remove build files
WORKDIR /
RUN rm -rf /tmp/netxms-4.1.420/

EXPOSE 4701

# Start netxmsd as a daemon
ENTRYPOINT ["/usr/local/bin/netxmsd","-D"]
