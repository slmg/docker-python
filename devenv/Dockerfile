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
    rm -rf /var/lib/apt/lists/* && \
    chsh -s /bin/zsh moby

USER moby

WORKDIR /home/moby

COPY --chown=moby:moby .zshrc requirements-dev.in ./

# Install oh-my-zsh and save Github's public key ahead of ssh usage.
RUN wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh && \
    sh install.sh --unattended --keep-zshrc && \
    rm install.sh .wget-hsts && \
    mkdir --mode=700 .ssh && \
    ssh-keyscan -H github.com > .ssh/known_hosts && \
    chmod 600 .ssh/known_hosts && \
    KNOWN_FINGERPRINT="SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8" && \
    TEST_FINGERPRINT=$(ssh-keygen -l -f .ssh/known_hosts | cut -d " " -f 2) && \
    if [ $TEST_FINGERPRINT != $KNOWN_FINGERPRINT ]; then \
        echo "\nFingerprints do not match!\nExpected: $KNOWN_FINGERPRINT\nComputed: $TEST_FINGERPRINT\nCheck for changes at https://help.github.com/en/github/authenticating-to-github/githubs-ssh-key-fingerprints\n" > /dev/stderr; \
        exit 1; \
    fi

# Set up python dev env.
RUN pip install --no-cache-dir \
        pip-tools \
        wheel && \
    pip-compile requirements-dev.in && \
    pip install --no-cache-dir -r requirements-dev.txt

CMD [ "zsh" ]
