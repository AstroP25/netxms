FROM scratch
ADD alpine-minirootfs-3.14.2-x86_64.tar.gz /

# Update and install dependencies
RUN apk update && apk upgrade
RUN apk add g++ gcc make perl openssl-dev curl mariadb-client mariadb-dev nmap linux-headers pcre-dev
ADD netxms-3.9.334.tar.gz /tmp

# Build NetXMS server with MariaDB driver
WORKDIR /tmp/netxms-3.9.334/
RUN ./configure --with-mariadb --with-server --with-mariadb-compat-headers
RUN make && make install

# Copy config file to /etc/
COPY netxmsd.conf /etc/

# Remove build files
WORKDIR /
RUN rm -rf netxms-3.9.334/

# Start netxmsd as a daemon
ENTRYPOINT ["/usr/local/bin/netxmsd","-D"]
