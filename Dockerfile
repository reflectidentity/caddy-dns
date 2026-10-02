FROM caddy:builder AS builder

# Add any required Caddy DNS or third-party modules here
RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
