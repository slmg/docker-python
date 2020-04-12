FROM ubuntu:focal

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

# Create user with deterministic uid.
RUN useradd -m moby -u 1000

# Set up venv location and "activate" it.
ENV VIRTUAL_ENV /home/moby/.venv
ENV PATH ${VIRTUAL_ENV}/bin:${PATH}

# Create venv and grant correct user perms.
RUN python3 -m venv ${VIRTUAL_ENV} && \
    chown -R moby:moby ${VIRTUAL_ENV}
