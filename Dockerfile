# Glama-compatible stdio wrapper for the hosted TrendsMCP remote endpoint.
# No proprietary server code: proxies MCP over stdio to https://api.trendsmcp.ai/mcp
FROM debian:trixie-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl \
 && curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
 && apt-get install -y --no-install-recommends nodejs \
 && npm install -g mcp-remote \
 && rm -rf /var/lib/apt/lists/*

ENV TRENDS_API_KEY=""

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
