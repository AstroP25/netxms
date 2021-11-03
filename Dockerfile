FROM scratch
ADD alpine-minirootfs-3.14.2-x86_64.tar.gz

RUN apk update && apk upgrade
RUN apk add g++ gcc make perl oopenssl-dev curl mariadb mariadb-client nmap linux-headers pcre-dev
ADD netxms-3.9.334.tar.gz /tmp

WORKDIR /tmp/netxms-3.9.334/
RUN ./configure --with-mariadb --with-server
RUN make && make install
