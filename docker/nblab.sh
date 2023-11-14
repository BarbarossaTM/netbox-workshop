#!/bin/sh
#
# Maximilian Wilhelm <max@sdn.clinic>
#  --  Tue 14 Nov 2023 11:19:16 PM CET
#

set -e

init() {
	if [ ! -d netbox-docker ]; then
		echo "Cloing netbox-docker.git..."
		git clone https://github.com/netbox-community/netbox-docker.git
		echo
	fi

	echo -n "Creating symlinks..."
	for path in "../../scripts" "../../media" "../docker-compose-override-lab.yml"; do
		if [ ! -L "netbox-docker/$(basename ${path})" ]; then
			ln -s "${path}" netbox-docker/
		echo -n .
		fi
	done
	echo " done."

	cd netbox-docker

	echo "Pulling images..."
	docker compose -f docker-compose.yml pull
	echo

}



case "$1" in
	init)
		init
		;;

	up)
		cd netbox-docker
		docker compose -f docker-compose.yml up
		;;
	stop)
		cd netbox-docker
		docker compose -f docker-compose.yml stop
		;;
	lab)
		cd netbox-docker
		docker compose -f docker-compose.yml -f docker-compose-override-lab.yml up
		;;
esac
