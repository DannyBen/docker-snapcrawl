Snapcrawl Docker Image
==================================================

This is a containerized version of [Snapcrawl][1] - a command line utility
for crawling a website and saving screenshots.

Usage
--------------------------------------------------

First, pull the docker image:

    $ docker pull dannyben/snapcrawl

Check that it is working properly?:

    $ docker run --rm -it dannyben/snapcrawl --help

Then you can run Snapcrawl while mounting your current directory so that 
screenshots will be placed in your own computer.

    $ docker run --rm -it --volume $PWD:/app \
      dannyben/snapcrawl go example.com


Using with Docker Compose
--------------------------------------------------

Alternatively, you can use the provided
[docker-compose file](docker-compose.yml) as follows:

    $ docker-compose build
    $ docker-compose run snapcrawl --help




[1]: https://github.com/dannyben/snapcrawl