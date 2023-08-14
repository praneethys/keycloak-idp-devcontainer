FROM mcr.microsoft.com/vscode/devcontainers/base:alpine

ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN if [ "$USER_GID" != "1000" ] || [ "$USER_UID" != "1000" ]; then groupmod --gid $USER_GID vscode && usermod --uid $USER_UID --gid $USER_GID vscode; fi

RUN  apk update \
    && apk upgrade \
    && apk add ca-certificates \
    && update-ca-certificates \
    && apk add --update coreutils && rm -rf /var/cache/apk/*   \
    && apk add --update openjdk11 tzdata curl unzip bash \
    && apk add --no-cache nss \
    && rm -rf /var/cache/apk/*