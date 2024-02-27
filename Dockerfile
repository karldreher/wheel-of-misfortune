# Use the official Caddy image as the base image
FROM caddy:2.7.6

# Copy the Caddyfile into the container
COPY Caddyfile /etc/caddy/Caddyfile


# Set the working directory to /srv
WORKDIR /srv
COPY . .
# We don't need this in /srv
RUN rm Caddyfile
# Expose port 80 (HTTP) and 443 (HTTPS)
EXPOSE 80 443

# Command to run Caddy
CMD ["caddy", "run", "-c", "/etc/caddy/Caddyfile"]
