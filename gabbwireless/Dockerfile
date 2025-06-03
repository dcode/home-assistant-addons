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
  && tar xzvf /tmp/gabbwireless_mqtt.tar.gz -C /app --strip "gabbwireless_mqtt-${GABBWIRELESS_REF}/" \
  && rm /tmp/gabbwireless_mqtt.tar.gz \
  && python3 -m pip install --no-cache-dir -r requirements.txt \

  COPY rootfs /

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
