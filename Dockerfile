FROM archlinux/base:latest
MAINTAINER Sudokamikaze <sudokamikaze@protonmail.com>

# Build tools
RUN pacman -Syyu --noconfirm && pacman -S \
    base-devel git --noconfirm

# Add s6-overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/v1.11.0.1/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /

# Add user
RUN useradd qtc --home-dir=/opt/qtc && mkdir /opt/qtc

# VOLUME /compiler_volume/

ENTRYPOINT ["/init"]
