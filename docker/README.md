# NetBox docker

We're using [NetBox Docker](https://github.com/netbox-community/netbox-docker.git) to set up our lab env.
See the repository for more details on how to tweak things.

Set up NetBox docker and download images

    $ git clone https://github.com/netbox-community/netbox-docker.git
    $ cd netbox-docker.git
    $ docker compose -f docker-compose.yml pull     # Get images

Fire up the lab

    $ docker compose -f docker-compose.yml -f docker-compose-override-lab.yml up

Create super user account

    $ docker exec -ti netbox-docker-netbox-1  /opt/netbox/netbox/manage.py createsuperuser

Point your browser to http://localhost:8001 and log in
