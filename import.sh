#!/usr/bin/env bash

# A short example of importing objects to Galaxy servers.

for server in europe australia; do
    echo "Importing objects to $server..."
    abm $server workflow import variant
    abm $server history import variant-2g
done
echo "Done"



