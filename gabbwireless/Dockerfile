# Build arguments
ARG BUILD_FROM=ghcr.io/hassio-addons/base-python:stable

# hadolint ignore=DL3006
FROM "$BUILD_FROM"

ARG BUILD_ARCH
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF

ARG GABBWIRELESS_REF=0.1.1

WORKDIR /app

RUN curl -o /tmp/gabbwireless_mqtt.tar.gz \
  -L "https://github.com/jaycollett/gabbwireless_mqtt/archive/refs/tags/${GABBWIRELESS_REF}.tar.gz" \
  && tar xzvf /tmp/gabbwireless_mqtt.tar.gz -C /app --strip-components 1 \
  && rm /tmp/gabbwireless_mqtt.tar.gz \
  && python3 -m pip install --no-cache-dir -r requirements.txt

COPY rootfs /
