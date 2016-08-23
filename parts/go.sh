#!/bin/bash
cd /letsencrypt.sh

if [ -z "$HOOK" ]
then
    if [ "$PROVIDER" == "memset" ]
    then
        HOOK="hooks/memset.sh"
    elif ["$PROVIDER" == "cloudflare"]
    then
        HOOK="hooks/cloudflare.sh"
    fi

    [ -z "$HOOK" ] && echo "No valid provider was specified." && exit 1
fi
./letsencrypt.sh -c -g -t dns-01 -k "$HOOK"
