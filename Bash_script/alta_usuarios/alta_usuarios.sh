#!/bin/bash

USERS_FILE="Lista_Usuarios.txt"
GRUPO_SECUNDARIO="DevOpsTeam"

# Obtener la clave del usuario vagrant
CLAVE_VAGRANT=$(sudo grep vagrant /etc/shadow | cut -d: -f2)

if [ -z "$CLAVE_VAGRANT" ]; then
  echo "No se pudo obtener la contraseña de vagrant (¿existe el usuario?)"
  exit 1
fi

# Crear grupo secundario si no existe
if ! getent group "$GRUPO_SECUNDARIO" > /dev/null; then
  groupadd "$GRUPO_SECUNDARIO"
fi

# Verificar archivo de usuarios
if [ ! -f "$USERS_FILE" ]; then
  echo "Archivo $USERS_FILE no encontrado"
  exit 1
fi

# Procesar cada línea del archivo
while IFS=':' read -r usuario grupo_rol; do
  echo "Procesando usuario: $usuario con grupo primario $grupo_rol y secundario $GRUPO_SECUNDARIO"

  # Crear grupo primario si no existe
  if ! getent group "$grupo_rol" > /dev/null; then
    groupadd "$grupo_rol"
  fi

  # Crear el usuario con grupo primario y secundario
  useradd -m -g "$grupo_rol" -G "$GRUPO_SECUNDARIO" -s /bin/bash "$usuario"

  # Aplicar contraseña del usuario vagrant
  usermod -p "$CLAVE_VAGRANT" "$usuario"

done < "$USERS_FILE"

echo "Todos los usuarios fueron creados correctamente."
