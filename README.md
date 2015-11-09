This repo contains code for maintaining a Jenkins CI setup on a Docker
host.

### Assumptions

1. Jenkins will be run as a container on a Docker host
2. All Jenkins data will be persisted on a volume shared in the
   container at `/var/jenkins_home`
3. All plugins are installed outside of the Dockerfile and are managed
   by `setup.sh`


### Setup

1. Have a machine set up as a Docker Host (use `docker-machine` or
   something)
2. Pull this repo down and run `setup.sh`
3. Run `docker build .` in this directory
4. Run the container `docker run -p 8080:8080 -v
   <PATH_TO_VOLUME_DIR>:/var/jenkins_home`
