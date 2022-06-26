FROM ghcr.io/linuxserver/baseimage-alpine:3.15

# set version label
ARG BUILD_DATE
ARG VERSION
ARG RADARR_RELEASE
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"

# environment settings
ARG RADARR_BRANCH="master"
ENV XDG_CONFIG_HOME="/config/xdg"
ENV PREMIUMIZEARR_CONFIG_DIR_PATH=/config
ENV PREMIUMIZEARR_LOGGING_DIR_PATH=/config

RUN \
  apk add -U --upgrade --no-cache \
    openssl


RUN mkdir /unzip
RUN mkdir /downloads
RUN mkdir /transfers
RUN mkdir /blackhole

  
# copy local files
COPY pr1/premiumizearrd /opt/app/
COPY pr1/static /opt/app/static
COPY root/ /
# ports and volumes
EXPOSE 8182
VOLUME /config
