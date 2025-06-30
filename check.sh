#!/bin/bash

echo "=== TESTING TP INTEGRAL ==="

# Lista de usuarios a verificar
usuarios=("r1nicole" "r2martin" "r3nicolas" "r4marshall" "r5axel" "r6bryan")

echo "Verificando usuarios..."
for user in "${usuarios[@]}"; do
    if id "$user" &>/dev/null; then
        echo "Usuario $user OK"
    else
        echo "Usuario $user FALTA"
    fi
done

# Verificar programas instalados
echo "Verificando programas instalados..."
for prog in htop tmux speedtest-cli; do
    if command -v $prog &>/dev/null; then
        echo "$prog instalado"
    else
        echo "$prog NO está instalado"
    fi
done

# Verificar Docker y la web
echo "Verificando Docker y web en http://localhost:8081 ..."
if curl -s http://localhost:8081 | grep -qi "<html>"; then
    echo "Web OK"
else
    echo "Web NO responde"
fi

echo "=== FIN DEL TEST ==="

