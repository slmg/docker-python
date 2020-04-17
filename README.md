# docker-python

Various Python-related Docker images

## Supported tags and respective `Dockerfile` links

* [`latest`](https://github.com/slmg/docker-python/blob/master/generic/Dockerfile), [`generic`](https://github.com/slmg/docker-python/blob/master/generic/Dockerfile)
* [`devenv`](https://github.com/slmg/docker-python/blob/master/devenv/Dockerfile)

Note: these tags are mutable. Freeze an image environment by using its digest instead:

```sh
# extract
docker inspect --format='{{index .RepoDigests 0}}' slmg/python:devenv
slmg/python@sha256:ba2ec02ff67f2fc14bb5e6b4dc2e5f6ae4cec60faffa2fda717e14ad359ebb28

# pull
docker image pull slmg/python@sha256:ba2ec02ff67f2fc14bb5e6b4dc2e5f6ae4cec60faffa2fda717e14ad359ebb28
```

```Dockerfile
# build
FROM slmg/python@sha256:ba2ec02ff67f2fc14bb5e6b4dc2e5f6ae4cec60faffa2fda717e14ad359ebb28
RUN ...
```

## Usage

### latest, generic

`docker pull slmg/docker-python[:latest|generic]`

#### Direct run

```sh
# Example using the latest (generic) image
docker container run --rm -it \
    --user moby \
    -v $(pwd):/home/moby/app \
    --workdir /home/moby/app \
    slmg/python
```

#### Use as base image

```Dockerfile
FROM slmg/python
USER moby
WORKDIR /home/moby
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY your_app.py .
CMD ["python", "your_app.py"]
```

### devenv

`docker pull slmg/docker-python:devenv`

This image contains [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)
and a default `.zshrc`. Mount your own custom config at runtime:

```sh
docker container run -it --rm \
    -v ~/docker/zsh_history:/home/moby/.zsh_history \
    -v ~/docker/zshrc:/home/moby/.zshrc \
    -v ~/docker/my-own.zsh-theme:/home/moby/.oh-my-zsh/themes/my-own.zsh-theme \
    slmg/python:devenv
```

Happy git interaction over ssh:

```sh
ssh-add ~/.ssh/git-rsa

docker container run -it --rm \
    -v ~/.gitconfig:/home/moby/.gitconfig \
    -v $SSH_AUTH_SOCK:/ssh-agent \
    -e SSH_AUTH_SOCK=/ssh-agent \
    slmg/python:devenv
```
