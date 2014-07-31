Zipkin using Docker with boot2docker
====================================

There are actually two repos that have done the hard work here:

- https://github.com/itszero/docker-zipkin
- https://github.com/lispmeister/docker-zipkin

Unfortunately both of them haven't worked for me on my mac book with boot2docker. Cassandra couldn't be started because of missing permissions for setting the ulimit. So I took the cassandra docker image from poklet (https://registry.hub.docker.com/u/poklet/cassandra) and integrated that into the deploy script.

Start Zipkin
------------

### Config

All you need to do is to run the deploy.sh and change some of the parameters at the top of the file. At least you should have a look at the IP for your boot2docker vm.

### Run

Simple start:

./deploy.sh

Remove running images before starting the new setup:

> Beware: this will delete all stored samples in ZIPKIN

export CLEANUP="y" && ./deploy.sh

### Check

Open your http://[HOST_ADDRESS]:8080 in your browser, e.g. http://192.168.59.103:8080/ You should see the zipkin page. It takes some time for zipkin-web to start. You can double check that by

docker logs zipkin-web

Then you are ready to go.

### Zipkin Example

I would suggest to try out the good activator template from Lev Khomich: https://github.com/levkhomich/activator-akka-tracing.
