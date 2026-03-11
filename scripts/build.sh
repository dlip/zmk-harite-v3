#!/usr/bin/env bash
set -euo pipefail
source zephyr/zephyr-env.sh
if [ -z "${1:-}" ]; then
  echo "Error: build.sh <side(left/right)>"
fi

SIDE=${1}
west build -p always -s zmk/app -S zmk-usb-logging -b seeeduino_xiao_ble -S studio-rpc-usb-uart -- -DSHIELD=harite_v3_${SIDE} -DZMK_CONFIG=$PWD/config -DCONFIG_ZMK_STUDIO=y
