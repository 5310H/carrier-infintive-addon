ARG BUILD_FROM=ghcr.io/home-assistant/base:latest
FROM golang:1.24-alpine AS infinitive-builder

ARG BUILD_ARCH
ARG INFINITIVE_VERSION=v0.2

RUN apk add --no-cache git
ENV CGO_ENABLED=0
RUN set -eu; \
    case "${BUILD_ARCH}" in \
      amd64) export GOARCH=amd64 ;; \
      aarch64) export GOARCH=arm64 ;; \
      *) echo "Unsupported architecture: ${BUILD_ARCH}" >&2; exit 1 ;; \
    esac; \
    go install "github.com/acd/infinitive@${INFINITIVE_VERSION}"

FROM ${BUILD_FROM}

ARG BUILD_VERSION
ARG BUILD_ARCH

LABEL \
  io.hass.name="Infinitive" \
  io.hass.description="Local interface for Carrier Infinity and Bryant Evolution HVAC systems" \
  io.hass.version=${BUILD_VERSION} \
  io.hass.type="app" \
  io.hass.arch=${BUILD_ARCH}

COPY --from=infinitive-builder /go/bin/infinitive /usr/local/bin/infinitive

COPY run.sh /run.sh
RUN chmod 0755 /run.sh

CMD ["/run.sh"]
