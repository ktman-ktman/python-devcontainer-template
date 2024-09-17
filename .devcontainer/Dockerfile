ARG VARIANT="latest"

FROM ubuntu:${VARIANT}

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    fish \
    git \
    git-lfs \
    htop \
    sudo \
    tmux \
    wget \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*

# user
ARG USERNAME="vscode"
ARG USER_UID="1111"
ARG USER_GID=${USER_UID}

RUN groupadd --gid ${USER_GID} ${USERNAME} \
    && useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME} \
    && echo ${USERNAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME}

# make directory for extension
RUN mkdir -p /home/${USERNAME}/.vscode-server/extensions \
        /home/${USERNAME}/.vscode-server-insiders/extensions \
    && chown -R ${USERNAME} \
        /home/${USERNAME}/.vscode-server \
        /home/${USERNAME}/.vscode-server-insiders

# install uv
USER ${USERNAME}
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

CMD ["/bin/bash"]