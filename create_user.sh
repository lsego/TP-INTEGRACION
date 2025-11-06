#!/bin/bash


#Autor: Luciano Segovia
#Fecha: 10/2025

# Install pwgen


verificar_pwgen() {
    if ! command -v pwgen &> /dev/null; then
        echo "Pwgen no está instalado. Instalando..."
        sudo apt update -qq && sudo apt install pwgen -y
    else
        echo "Pwgen se instalo correctamente."
    fi
}

crear_grupo() {
    read -p "Grupo: " GRUPO
    if ! getent group "$GRUPO" > /dev/null; then
        echo "Creando grupo '$GRUPO'..."
        sudo groupadd "$GRUPO"
    else
        echo "El grupo '$GRUPO' ya existe."
    fi
}



crear_usuario() {
    while true; do

	read -p "Usuario: " user
	if getent passwd "$user" > /dev/null; then
	   echo "El usuario $user existe en el sistema, intente con otro nombre"

	else
	   break
	fi
    done

    # Crear grupo
    crear_grupo
    
    # Dar de alta usuario
    sudo useradd -m -s /bin/bash -g "$GRUPO" "$user"
    chmod 700 /home/$user
    PASSWORD=$(pwgen -s 12 1)
    echo "$user:$PASSWORD" | sudo chpasswd 

}

verificar_pwgen
crear_usuario
