Snapcrawl Docker Image
==================================================

![Version](https://img.shields.io/badge/version-0.5.2-blue.svg)

[View on GitHub][2] | [View on DockerHub][3]

---

This is a containerized version of [Snapcrawl][1] - a command line utility
for crawling a website and saving screenshots.

Usage
--------------------------------------------------

Create a `snapcrawl` alias that runs the docker container and mounts the 
current directory to the container's working directory:

```shell
$ alias snapcrawl='docker run --rm -it --volume "$PWD:/app" dannyben/snapcrawl'
```

Then you can run any snapcrawl command:

```shell
$ snapcrawl --help
$ snapcrawl example.com log_level=0 depth=2 width=1024
```


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
$ docker-compose run snapcrawl example.com
```



[1]: https://github.com/dannyben/snapcrawl
[2]: https://github.com/DannyBen/docker-snapcrawl
[3]: https://hub.docker.com/r/dannyben/snapcrawl
