# Build arguments
ARG BUILD_FROM=ghcr.io/hassio-addons/base:17.2.5
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION

# hadolint ignore=DL3006
FROM "$BUILD_FROM"

# shellcheck shell=dash
RUN env && if [ "${BUILD_ARCH}" = "aarch64" ]; then \
  BUILD_ARCH=arm64; \
elif [ "${BUILD_ARCH}" = "i386" ]; then \
  BUILD_ARCH=386; \
elif [ "${BUILD_ARCH}" = "armhf" ]; then \
  BUILD_ARCH=armv7; \
fi && \
  apk add --no-cache nginx=~1.26 gomplate=~4.2 && \
  wget --verbose -O /tmp/traefik.tar.gz "https://github.com/traefik/traefik/releases/download/v${TRAEFIK_VERSION}/traefik_v${TRAEFIK_VERSION}_linux_${BUILD_ARCH}.tar.gz" && \
  tar xzvf /tmp/traefik.tar.gz -C /usr/local/bin traefik && \
  chmod +x /usr/local/bin/traefik && \
  rm -f /tmp/*

COPY rootfs /

LABEL \
  io.hass.name="${BUILD_NAME}" \
  io.hass.description="${BUILD_DESCRIPTION}" \
  io.hass.arch="${BUILD_ARCH}" \
  io.hass.type="addon" \
  io.hass.version="${BUILD_VERSION}" \
  maintainer="Derek Ditch <dcode@users.noreply.github.com>" \
  org.opencontainers.image.title="${BUILD_NAME}" \
  org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
  org.opencontainers.image.licenses="MIT" \
  org.opencontainers.image.vendor="Derek Ditch" \
  org.opencontainers.image.authors="Derek Ditch <dcode@users.noreply.github.com>" \
  org.opencontainers.image.url="https://github.com/dcode/home-assistant-addons/" \
  org.opencontainers.image.source="https://github.com/${BUILD_REPOSITORY}" \
  org.opencontainers.image.documentation="https://github.com/${BUILD_REPOSITORY}/blob/master/traefik/README.md" \
  org.opencontainers.image.created="${BUILD_DATE}" \
  org.opencontainers.image.revision="${BUILD_REF}" \
  org.opencontainers.image.version="${BUILD_VERSION}"
