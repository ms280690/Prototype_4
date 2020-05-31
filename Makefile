build:
	docker build -t prototype_4 --no-cache=true .

rundev:
	docker run -d -t -v $(CURDIR):/Prototype_4 --name prototype_4 prototype_4


killdev:
	docker stop prototype_4
	docker rm prototype_4

shell:
	docker exec -it prototype_4 bash

restart:
	docker restart prototype_4

restart_vm:
	docker-machine restart default
	docker-machine ssh default 'sudo /etc/init.d/docker restart'

init:
	docker-machine restart default

# does not work
# eval "$(docker-machine env default)"
eval:
	$(eval $(docker-machine env default))

# removing existing containers
clean:
	-docker ps -a -q | xargs docker rm
	-docker images | grep "^<none>" | awk '{print $$3}' | xargs docker rmi

rebuild:
	docker exec -it prototype_4 go install .
	docker restart prototype_4
