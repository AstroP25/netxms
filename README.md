# Netxms
Creates an Alpine Linux container and then builds NetXMS from source.

## Usage
### Required packages
Docker
git
### Building container
```
git clone https://github.com/AstroP25/netxms.git
```
```
cd netxms/
```
```
docker build -t netxms:4.1.420 .
```
Currently builds NetXMS with the MariaDB driver for use with a remote database which can be manually adjusted by editing the netxmsd.conf file. This can easily be changed to use other databases by editing the configure line under according to the NetXMS build instructions. Build process can take some time.

## Running container
To run the container execute:
```
docker run -it netxms:4.1.420
```
NetXMS will start in debug mode (logged into the NetXMS console). If the database has not be initialized, is locked (from a previous installation) or is at an incompatable version, NetXMS will likely crash immediately. To initialize the database, execute the following:
```
nxdbmgr init
```

## To do
Add ports to expose for NXMC client.
Clean up code.
