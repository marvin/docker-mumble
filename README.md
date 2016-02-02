# docker-mumble

A nice and easy way to get a Mumble server up and running using docker. For help
on getting started with docker see the [official getting started guide][0]. For
more information on Mumble and check out its [website][1].


## Building docker-mumble

Running this will build you a docker image with the latest version of both
docker-mumble and Mumble itself.

    git clone https://github.com/asonawalla/docker-mumble
    cd docker-mumble
    docker build -t asonawalla/mumble .


## Running docker-mumble

Running the first time will set your port to a static port of your choice so
that you can easily map a proxy to. If this is the only thing running on your
system you can map the port to 64738 and no proxy is needed. i.e.
`-p 64738:64738` Also be sure your mounted directory on your host machine is
already created before running `mkdir -p /mnt/mumble`.

    sudo docker run -d -p 64738:64738 -v /mnt/mumble:/data asonawalla/mumble

From now on when you start/stop docker-mumble you should use the container id
with the following commands. To get your container id, after you initial run
type `sudo docker ps` and it will show up on the left side followed by the image
name which is `asonawalla/mumble:latest`.

    sudo docker start <container_id>
    sudo docker stop <container_id>


### Notes on the run command

 + `-v` is the volume you are mounting `-v host_dir:docker_dir`
 + `asonawalla/mumble` is simply what I called my docker build of this image
 + `-d` allows this to run cleanly as a daemon, remove for debugging
 + `-p` is the port it connects to, `-p host_port:docker_port`


[0]: http://www.docker.io/gettingstarted/
[1]: http://mumble.sourceforge.net/

