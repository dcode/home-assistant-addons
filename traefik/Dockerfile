# Build arguments
ARG BUILD_FROM=ghcr.io/hassio-addons/base:17.2.5

# hadolint ignore=DL3006
FROM "$BUILD_FROM"

ARG BUILD_ARCH
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG TRAEFIK_VERSION=2.11.0

# shellcheck shell=dash
RUN apk update && \
  if [ "${BUILD_ARCH}" = "aarch64" ]; then \
  BUILD_ARCH=arm64; \
  elif [ "${BUILD_ARCH}" = "i386" ]; then \
  BUILD_ARCH=386; \
  elif [ "${BUILD_ARCH}" = "armhf" ]; then \
  BUILD_ARCH=armv7; \
  fi && \
  apk add --no-cache nginx=~1.26 gomplate=~4.2 wget=~1.25 && \
  wget --progress=dot:giga --verbose -O /tmp/traefik.tar.gz "https://github.com/traefik/traefik/releases/download/v${TRAEFIK_VERSION}/traefik_v${TRAEFIK_VERSION}_linux_${BUILD_ARCH}.tar.gz" && \
  tar xzvf /tmp/traefik.tar.gz -C /usr/local/bin traefik && \
  chmod +x /usr/local/bin/traefik && \
  rm -f /tmp/*

COPY rootfs /
