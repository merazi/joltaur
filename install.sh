#!/bin/bash

echo "     __       .__   __                       "
echo "    |__| ____ |  |_/  |______   __ _________ "
echo "    |  |/  _ \|  |\   __\__  \ |  |  \_  __ \\"
echo "    |  (  <_> )  |_|  |  / __ \|  |  /|  | \/"
echo "/\__|  |\____/|____/__| (____  /____/ |__|   "
echo "\______|                     \/              "

JOLTAUR=joltaur

function local_install {
    if [ -f "$JOLTAUR" ]; then
        cp "$JOLTAUR" ~/.local/bin/$JOLTAUR
    else
        echo "Could not find JOLTAUR script, make sure you run it in the source code directory."
    fi
}

function root_install {
    if [ -f "$JOLTAUR" ]; then
        cp "$JOLTAUR" /usr/bin/$JOLTAUR
    else
        echo "Could not find JOLTAUR script, make sure you run it in the source code directory."
    fi
}

if [ "$EUID" -ne 0 ]; then
    echo "Not running as root, installing in ~/.local/bin"
    local_install
else
    echo "running as root, installing in /usr/bin"
    root_install
fi
