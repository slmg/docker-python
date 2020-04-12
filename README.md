# docker-python

Various Python-related Docker images

## Supported tags and respective `Dockerfile` links

* [`latest`](https://github.com/slmg/docker-python/blob/master/generic/Dockerfile), [`generic`](https://github.com/slmg/docker-python/blob/master/generic/Dockerfile)
* [`devenv`](https://github.com/slmg/docker-python/blob/master/devenv/Dockerfile)

## Usage

```sh
# Example using the latest (generic) image
docker container run --rm -it \
    --user moby \
    -v $(pwd):/home/moby/app \
    --workdir /home/moby/app \
    slmg/python
```
