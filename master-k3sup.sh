#!/bin/bash

k3sup install \
    --host=idioteque \
    --user=ubuntu \
    --k3s-version=v1.21.0+k3s1 \
    --k3s-extra-args="--disable servicelb --disable traefik"