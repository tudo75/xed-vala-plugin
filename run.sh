#!/bin/bash

meson setup build --wipe
ninja -C build -v com.github.tudo75.xed-vala-plugin-pot
ninja -C build -v com.github.tudo75.xed-vala-plugin-update-po
ninja -C build -v com.github.tudo75.xed-vala-plugin-gmo
ninja -C build -v
