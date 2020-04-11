FROM ubuntu:focal

# Create user with deterministic uid, alongside homedir skeleton.
RUN useradd -m moby -u 1000 && \
    mkdir /home/moby/app && \
    chown -R moby:moby /home/moby/app

# Set system locale to prevent plenty of weird bugs.
RUN apt-get update && apt-get install -y --no-install-recommends \
        locales && \
    rm -rf /var/lib/apt/lists/* && \
    sed -i -e 's/# en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen

ENV LC_ALL en_GB.UTF-8
ENV LANG en_GB.UTF-8
ENV LANGUAGE en_GB:en

RUN apt-get update && apt-get install -y --no-install-recommends \
        python3 \
        python3-dev \
        python3-venv && \
    rm -rf /var/lib/apt/lists/*

# Don't write .pyc files, superflous in an ephemeral container.
ENV PYTHONDONTWRITEBYTECODE True

# Set up venv "activation" boilerplate.
ENV VIRTUAL_ENV /home/moby/.venv
ENV PATH ${VIRTUAL_ENV}/bin:${PATH}

USER moby

RUN python3 -m venv ${VIRTUAL_ENV}

WORKDIR /home/moby/app
