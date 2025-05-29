# Build arguments
ARG BUILD_FROM=ghcr.io/hassio-addons/base:17.2.5

# hadolint ignore=DL3006
FROM $BUILD_FROM

ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION
ARG RCLONE_VERSION

RUN if [ "${BUILD_ARCH}" = "aarch64" ]; then BUILD_ARCH=arm64; \
  elif [ "${BUILD_ARCH}" = "i386" ]; then BUILD_ARCH=386; \
  elif [ "${BUILD_ARCH}" = "armhf" ]; then BUILD_ARCH=arm-v7; \
  elif [ "${BUILD_ARCH}" = "armv7" ]; then BUILD_ARCH=arm-v7; \
  fi && \
  apk add --no-cache unzip~=6.0 findutils~=4.10 && \
  wget --quiet -O /tmp/rclone.zip "https://downloads.rclone.org/v${RCLONE_VERSION}/rclone-v${RCLONE_VERSION}-linux-${BUILD_ARCH}.zip" && \
  unzip /tmp/rclone.zip -d /tmp && \
  cp "/tmp/rclone-v${RCLONE_VERSION}-linux-${BUILD_ARCH}/rclone" /usr/bin/rclone && \
  chmod +x /usr/bin/rclone && \
  rm -rf /tmp/*

COPY rootfs /

LABEL \
  io.hass.name="Rclone for ${BUILD_ARCH}" \
  io.hass.description="Home Assistant Unofficial Add-on: ${BUILD_ARCH} Rclone image" \
  maintainer="Alex van den Hoogen <homeassistant@alxx.nl>" \
  org.opencontainers.image.title="Rclone for ${BUILD_ARCH}" \
  org.opencontainers.image.description="Home Assistant Unofficial Add-on: ${BUILD_ARCH} Rclone image" \
  org.opencontainers.image.vendor="Alex van den Hoogen" \
  org.opencontainers.image.authors="Alex van den Hoogen <homeassistant@alxx.nl>" \
  org.opencontainers.image.url="https://alxx.nl/home-assistant-addons/" \
  org.opencontainers.image.source="https://alxx.nl/home-assistant-addons/" \
  org.opencontainers.image.documentation="https://alxx.nl/home-assistant-addons/blob/master/rclone/README.md" \
  org.opencontainers.image.created=${BUILD_DATE} \
  org.opencontainers.image.revision=${BUILD_REF} \
  org.opencontainers.image.version=${BUILD_VERSION}
