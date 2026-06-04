#!/bin/bash

# Create directory to store packaged charts
mkdir /root/package

# Move into package directory
cd /root/package/

# Package Helm Chart
helm package /root/webapp-color
