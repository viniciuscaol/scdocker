#!/bin/bash
if [ "$COMMAND" = "nslookup" ]; then
    nslookup "$@"
elif [ "$COMMAND" = "dig" ]; then
    dig "$@"
elif [ "$COMMAND" = "host" ]; then
    host "$@"
elif [ "$COMMAND" = "ping" ]; then
    ping -c 4 "$@"
elif [ "$COMMAND" = "traceroute" ]; then
    traceroute "$@"
else
    echo "Comando não suportado. Use a variável de ambiente COMMAND para definir o comando."
    echo "Comandos suportados: nslookup, dig, host, ping, traceroute"
fi
