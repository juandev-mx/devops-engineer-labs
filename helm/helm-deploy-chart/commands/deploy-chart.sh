# Add Bitnami repository
helm repo add bitnami https://charts.bitnami.com/bitnami

# Update repositories
helm repo update

# Search available charts
helm search repo

# Deploy Apache chart
helm install amaze-surf bitnami/apache

# Deploy NGINX chart
helm install crazy-web bitnami/nginx

# Verify deployments
helm list -A

# Check release status
helm status amaze-surf
helm status crazy-web

# Display generated Kubernetes manifests
helm get manifest amaze-surf
helm get manifest crazy-web
