#!/bin/bash

ssh ubuntu@airbag /usr/local/bin/k3s-agent-uninstall.sh

ssh ubuntu@nicedream /usr/local/bin/k3s-agent-uninstall.sh

ssh ubuntu@idioteque /usr/local/bin/k3s-uninstall.sh
