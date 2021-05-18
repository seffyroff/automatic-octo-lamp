#!/bin/bash

k3sup join \
    --host=airbag \
    --server-host=idioteque \
    --k3s-version=v1.21.0+k3s1 \
    --user=ubuntu


k3sup join \
    --host=nicedream \
    --server-host=idioteque \
    --k3s-version=v1.21.0+k3s1 \
    --user=ubuntu

