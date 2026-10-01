FROM ghcr.io/home-assistant/base:latest AS runtime
FROM golang:1.24-alpine AS infinitive-builder

ARG BUILD_ARCH

RUN apk add --no-cache git
WORKDIR /src
RUN git clone --depth 1 https://github.com/acd/infinitive.git .
RUN set -eu; \
    case "${BUILD_ARCH}" in \
      amd64) go_arch=amd64 ;; \
      aarch64) go_arch=arm64 ;; \
      *) echo "Unsupported architecture: ${BUILD_ARCH}" >&2; exit 1 ;; \
    esac; \
    CGO_ENABLED=0 GOOS=linux GOARCH="${go_arch}" go build -trimpath -ldflags="-s -w" -o /infinitive .

FROM runtime

ARG BUILD_VERSION
ARG BUILD_ARCH

LABEL \
  io.hass.name="Infinitive" \
  io.hass.description="Local interface for Carrier Infinity and Bryant Evolution HVAC systems" \
  io.hass.version=${BUILD_VERSION} \
  io.hass.type="app" \
  io.hass.arch=${BUILD_ARCH}

COPY --from=infinitive-builder /infinitive /usr/local/bin/infinitive

COPY run.sh /run.sh
RUN chmod 0755 /run.sh

CMD ["/run.sh"]
