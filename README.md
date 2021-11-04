#netxms

Creates an Alpine Linux container and then builds NetXMS from source. Idea is that repo be entireley self-contained for offline install.

Currently builds NetXMS with the MariaDB driver for use with a remote database which can be manually adjusted by editing the netxmsd.conf file. Build process can take some time.

To do:
Slim configuration file.
Add ports to expose for NXMC client.
