# Infinitive add-on

This add-on runs the upstream Infinitive service, which communicates with a Carrier Infinity or Bryant Evolution system over its RS-485 ABCD bus and exposes the service's HTTP interface/API.

## Hardware requirements

- A USB to RS-485 adapter connected to the HVAC system's **A and B data terminals**.
- The adapter must be visible to HAOS as a serial device, usually `/dev/ttyUSB0` or `/dev/ttyACM0`.

**Do not connect the adapter to terminals C or D.** Those terminals carry 24V AC power and can damage the adapter. The serial adapter must be plugged into the HAOS host that runs this add-on. A network-attached RS-485 adapter is not supported by this add-on.

## Install

To install this add-on from GitHub, first push this folder to a GitHub repository. In Home Assistant, open **Settings → Apps → App store → ⋮ → Repositories**, add that repository's HTTPS clone URL, then install **Infinitive**. For local development, the repository root must contain `repository.yaml` and this add-on folder.

In the add-on configuration, set `serial_device` to the device path shown by HAOS for your adapter. The service listens on port `8080` inside the container and is published as port `8081` on the HAOS host.

## Connect Home Assistant

The upstream `mww012/hass-infinitive` integration is a separate custom integration, not part of this add-on. It documents HACS custom repository installation and legacy YAML platform configuration. Check that integration's current compatibility with your Home Assistant Core version before relying on it. Configure its host to the HAOS address and its port to the published Infinitive HTTP port (`8081` by default).

## Troubleshooting

- Check the add-on log for the startup message and for Infinitive serial communication frames.
- If the serial device never appears, confirm HAOS detects the USB adapter and update `serial_device`.
- If the web interface loads but shows no HVAC data, check A/B wiring and verify that the HVAC bus is active.

Upstream project and protocol notes: https://github.com/acd/infinitive
