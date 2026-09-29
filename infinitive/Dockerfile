ARG BUILD_FROM=ghcr.io/home-assistant/base:latest
FROM ${BUILD_FROM}

ARG BUILD_VERSION
ARG BUILD_ARCH

LABEL \
  io.hass.name="Infinitive" \
  io.hass.description="Local interface for Carrier Infinity and Bryant Evolution HVAC systems" \
  io.hass.version=${BUILD_VERSION} \
  io.hass.type="app" \
  io.hass.arch=${BUILD_ARCH}

RUN apk add --no-cache ca-certificates curl \
    && curl -fsSL "https://github.com/acd/infinitive/releases/download/v0.2/infinitive.amd64" -o /usr/local/bin/infinitive \
    && chmod 0755 /usr/local/bin/infinitive

COPY run.sh /run.sh
RUN chmod 0755 /run.sh

CMD ["/run.sh"]
