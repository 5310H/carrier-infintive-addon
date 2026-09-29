#!/usr/bin/with-contenv bashio
set -e

SERIAL_DEVICE="$(bashio::config 'serial_device')"

if [ ! -e "${SERIAL_DEVICE}" ]; then
  bashio::log.warning "Serial device ${SERIAL_DEVICE} is not present yet; waiting for it."
  while [ ! -e "${SERIAL_DEVICE}" ]; do
    sleep 2
  done
fi

bashio::log.info "Starting Infinitive on HTTP port 8080 using ${SERIAL_DEVICE}"
exec /usr/local/bin/infinitive "-httpport=8080" "-serial=${SERIAL_DEVICE}"
