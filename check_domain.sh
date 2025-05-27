#!/bin/bash

# Check if domain argument is provided
if [ $# -eq 0 ]; then
    echo "Error: Domain name is required!"
    echo "Usage: $0 <domain>"
    echo "Example: $0 example.com"
    exit 1
fi

DOMAIN=$1
DNS_SERVER="8.8.8.8"
SEARCH_ENGINES=("crtsh" "duckduckgo" "bing")

echo "Starting OSINT scan for domain: $DOMAIN"
echo "----------------------------------------"

# Run theHarvester with each search engine
for engine in "${SEARCH_ENGINES[@]}"; do
    echo "Running theHarvester with search engine: $engine"
    echo "----------------------------------------"
    theHarvester -d "$DOMAIN" --dns-server "$DNS_SERVER" -b "$engine"
    echo "----------------------------------------"
    echo ""
done

echo "OSINT scan completed for domain: $DOMAIN"

