#!/bin/bash

# Add Bitnami repository
helm repo add bitnami https://charts.bitnami.com/bitnami

# Update repositories
helm repo update

# Install NGINX chart
helm install dazzling-web bitnami/nginx --version 12.0.4

# Verify installation
helm list

# Upgrade release
helm upgrade dazzling-web bitnami/nginx --version 12.0.5

# Verify history
helm history dazzling-web

# Upgrade again
helm upgrade dazzling-web bitnami/nginx --version 18.3.6

# Verify history
helm history dazzling-web

# Rollback to revision 3
helm rollback dazzling-web 3

# Verify status
helm status dazzling-web

# Verify history
helm history dazzling-web
