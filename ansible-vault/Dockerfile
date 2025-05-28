# Build arguments
ARG BUILD_FROM=ghcr.io/hassio-addons/base:17.2.5
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION
ARG ANSIBLE_MAJOR_VERSION="2.0"

# hadolint ignore=DL3006
FROM $BUILD_FROM


COPY run.sh /

RUN apk add --no-cache \
  gcc~=14.2 git~=2.47 libffi-dev~=3.4 \
  musl-dev~=1.2 openssl-dev~=3.3 perl~=5.40 \
  python3~=3.12 py3-pip~=24.3 && \
  python3 -m pip install --no-cache-dir \
  "ansible-core ~= 2.0" \
  "ansible-base ~= 2.0" && \
  chmod a+x /run.sh && \
  apk del --no-cache gcc libffi-dev musl-dev openssl-dev perl

CMD [ "/run.sh" ]

LABEL \
  io.hass.name="Ansible vault for ${BUILD_ARCH}" \
  io.hass.description="Home Assistant Unofficial Add-on: ${BUILD_ARCH} Ansible vault image" \
  maintainer="Alex van den Hoogen <homeassistant@alxx.nl>" \
  org.opencontainers.image.title="Ansible vault for ${BUILD_ARCH}" \
  org.opencontainers.image.description="Home Assistant Community Add-on: ${BUILD_ARCH} Ansible vault image" \
  org.opencontainers.image.vendor="Alex van den Hoogen" \
  org.opencontainers.image.authors="Alex van den Hoogen <homeassistant@alxx.nl>" \
  org.opencontainers.image.url="https://alxx.nl/home-assistant-addons/" \
  org.opencontainers.image.source="https://alxx.nl/home-assistant-addons/" \
  org.opencontainers.image.documentation="https://alxx.nl/home-assistant-addons/blob/master/ansible-vault/README.md" \
  org.opencontainers.image.created=${BUILD_DATE} \
  org.opencontainers.image.revision=${BUILD_REF} \
  org.opencontainers.image.version=${BUILD_VERSION}
