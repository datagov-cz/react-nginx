FROM nginx:alpine

# Run config check script on the container startup
COPY config_check.sh /docker-entrypoint.d/
# Provide improved nginx configuration
COPY nginx.conf /etc/nginx/
# Fill in default server content
COPY index.html error.html config.js.template /usr/share/nginx/html/

# Make env var substitution happen on *.template files in the html dir
ENV NGINX_ENVSUBST_TEMPLATE_DIR=/usr/share/nginx/html
ENV NGINX_ENVSUBST_OUTPUT_DIR=/usr/share/nginx/html
