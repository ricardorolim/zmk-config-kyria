#!/usr/bin/env bash

set -eu

PWD=$(pwd)
TIMESTAMP="${TIMESTAMP:-$(date -u +"%Y%m%d%H%M%S")}"

# West Build (left)
west build -s zmk/app -d build/left -b nice_nano_v2 -- -DSHIELD=kyria_rev3_left -DZMK_CONFIG="${PWD}/config"
# West Build (right)
west build -s zmk/app -d build/right -b nice_nano_v2 -- -DSHIELD=kyria_rev3_right -DZMK_CONFIG="${PWD}/config"
# west build -s zmk/app -d build/reset -b nice_nano_v2 -- -DSHIELD=settings_reset -DZMK_CONFIG="${PWD}/config"
# Rename zmk.uf2
mv build/left/zephyr/zmk.uf2 ./firmware/kyria-${TIMESTAMP}-left.uf2 && mv build/right/zephyr/zmk.uf2 ./firmware/kyria-${TIMESTAMP}-right.uf2
