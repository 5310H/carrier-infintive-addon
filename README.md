# Carrier Infinitive add-on for Home Assistant OS

This repository packages [Infinitive](https://github.com/acd/infinitive) as a Home Assistant OS add-on. It targets **amd64** HAOS systems and needs a USB RS-485 adapter connected to the HVAC system's A/B data bus.

## Install in Home Assistant

1. Push this project to [`5310H/carrier-infintive-addon`](https://github.com/5310H/carrier-infintive-addon).
2. In Home Assistant, open **Settings → Apps → App store → ⋮ → Repositories** and add `https://github.com/5310H/carrier-infintive-addon`.
3. Install **Infinitive** from the app store.
4. Set `serial_device` to the adapter's device path and start the add-on.
5. Open its web interface on port `8081` and confirm it receives data from the HVAC bus.

See [the add-on guide](infinitive/DOCS.md) for wiring cautions, options, integration notes, and troubleshooting.

## Build locally

Build the app image from this repository using the Home Assistant app build tooling with `BUILD_ARCH=amd64` and `BUILD_VERSION` matching `infinitive/config.yaml`. The Dockerfile builds Infinitive from upstream source for amd64, avoiding runtime-library mismatches in the upstream release binary.

This add-on is marked **experimental** until a successful build and live RS-485 test have been completed on HAOS hardware.
