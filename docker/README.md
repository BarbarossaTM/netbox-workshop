# NetBox docker

We're using [NetBox Docker](https://github.com/netbox-community/netbox-docker.git) to set up our lab env.
See the repository for more details on how to tweak things.

This directory contains some fluffy glue around netbox-docker to spawn a lab.

To set up NetBox docker and download images run

    $ ./nblab.sh init

Fire up the lab

    $ ./nblab.sh lab

Create super user account

    $ docker exec -ti netbox-docker-netbox-1  /opt/netbox/netbox/manage.py createsuperuser

Point your browser to http://localhost:8001 and log in

You can shutdown the lab using

    $ ./nblab.sh stop
