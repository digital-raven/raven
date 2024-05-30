# Build with docker build -t raven-toolbox:latest
FROM docker.io/archlinux:latest as base

ENV NAME=raven-dc VERSION=rolling

RUN pacman -Sy --noconfirm \
    arch-install-scripts \
    archlinux-keyring \
    base-devel \
    dosfstools \
    git \
    pkgconf \
    python-archinstall \
    reflector \
    rsync \
    rust \
    wget \
    vim \
    zsh

RUN pacman -Scc --noconfirm

# Configure reflector. This mirrorlist will also be copied to final installations.
RUN reflector \
    --latest 5 \
    --protocol http,https \
    --save "/etc/pacman.d/mirrorlist" \
    --sort rate

# Configure non-root master user. Only used within this Dockerfile
RUN useradd -m master
RUN usermod -aG root master
RUN passwd -d master
RUN echo "master ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Install yay. Can't be done as root.
USER master
RUN git clone https://aur.archlinux.org/yay.git /tmp/yay && \
    cd /tmp/yay && \
    makepkg -si --noconfirm && \
    rm -rf /tmp/yay

# RUN yay -Syu --noconfirm <package>

# GRML Zsh
RUN wget -O /home/master/.zshrc https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc

# vim config
RUN yay -Syu --noconfirm vim-plug
COPY ../raven-terminal/resources/vimrc /home/master/.vimrc
RUN chown master /home/master/.vimrc
RUN chmod 644 /home/master/.vimrc

CMD /usr/bin/zsh
