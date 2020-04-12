FROM slmg/python:generic

# Install common dev packages
RUN apt-get update && apt-get install -y --no-install-recommends \
        gcc \
        curl \
        wget \
        git \
        zsh \
        vim \
        tree \
        less \
        jq \
        openssh-client && \
    rm -rf /var/lib/apt/lists/*

RUN chsh -s /bin/zsh moby

USER moby

WORKDIR /home/moby

COPY --chown=moby:moby .zshrc requirements-dev.in ./

# Install oh-my-zsh.
RUN wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh && \
    sh install.sh --unattended --keep-zshrc && \
    rm install.sh .wget-hsts

# Set up python dev env.
RUN pip install --no-cache-dir \
        pip-tools \
        wheel && \
    pip-compile requirements-dev.in && \
    pip install --no-cache-dir -r requirements-dev.txt

CMD [ "zsh" ]
