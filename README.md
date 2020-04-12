# docker-python

Various Python-related Docker images

## Supported tags and respective `Dockerfile` links

* [latest](./generic/Dockerfile), [generic](./generic/Dockerfile)
* [devenv](./devenv/Dockerfile)

## Usage

```sh
# Example using the latest (generic) image
docker container run --rm -it \
    --user moby \
    -v $(pwd):/home/moby/app \
    --workdir /home/moby/app \
    slmg/python
```
