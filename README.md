Snapcrawl Docker Image
==================================================

[View on GitHub][2] | [View on DockerHub][3]

---

This is a containerized version of [Snapcrawl][1] - a command line utility
for crawling a website and saving screenshots.

Usage
--------------------------------------------------

First, pull the docker image:

    $ docker pull dannyben/snapcrawl

Check that it is working properly:

    $ docker run --rm -it dannyben/snapcrawl --help

Then you can run Snapcrawl while mounting your current directory so that 
screenshots will be placed in your own computer.

    $ docker run --rm -it --volume $PWD:/app \
      dannyben/snapcrawl go example.com


Using with Docker Compose
--------------------------------------------------

```yaml
# docker-compose.yml
version: '3'

services:
  bash:
    entrypoint: bash
    <<: &default
      image: dannyben/snapcrawl
      volumes: [".:/app"]

  snapcrawl:
    <<: *default
```

And then you can run:

```
$ docker-compose run snapcrawl --help
$ docker-compose run snapcrawl go example.com
```



[1]: https://github.com/dannyben/snapcrawl
[2]: https://github.com/DannyBen/docker-snapcrawl
[3]: https://hub.docker.com/r/dannyben/snapcrawl