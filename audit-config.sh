#!/bin/bash
# ================================================
# Script: audit-config.sh
# Descripción: Configura reglas básicas de auditoría
# Autor: Luciano Segovia
# ================================================

echo "[+] Configurando reglas de auditoría..."

# Asegurar que auditd esté instalado
if ! command -v auditctl &> /dev/null; then
    echo "Instalando auditd..."
    sudo apt update && sudo apt install -y auditd audispd-plugins
fi

# Activar servicio
sudo systemctl enable auditd
sudo systemctl start auditd

# Agregar reglas de auditoría
sudo bash -c 'cat > /etc/audit/rules.d/audit-local.rules <<EOF
# === Auditoría de accesos críticos ===
-w /etc/passwd -p wa -k passwd_changes
-w /etc/sudoers -p wa -k sudo_config

# === Auditoría de comandos ejecutados con sudo ===
-w /var/log/sudo.log -p r -k sudo_commands

# === Auditoría de logins y autenticación ===
-w /var/log/auth.log -p r -k auth_events

# === Auditoría de cambios de hora del sistema ===
-a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time_change
EOF'

# Recargar reglas
sudo augenrules --load

echo "[✔] Reglas configuradas. Auditd activo y monitoreando eventos."
