#!/bin/bash

URL_FILE="Lista_URL.txt"

if [ ! -f "$URL_FILE" ]; then
  echo "Archivo $URL_FILE no encontrado"
  exit 1
fi

while IFS= read -r url; do
  echo -n "Chequeando $url... "
  if curl --head --silent --fail "$url" > /dev/null; then
    echo "OK"
  else
    echo "FALLÓ"
  fi
done < "$URL_FILE"
