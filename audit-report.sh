#!/bin/bash
# ================================================
# Script: audit-report.sh
# Descripción: Genera reporte automático de auditoría
# Autor: Luciano Segovia
# ================================================

OUTPUT_DIR="$(dirname "$0")/outputs"
DATE=$(date +%Y%m%d)
REPORT="$OUTPUT_DIR/audit-report-$DATE.txt"

mkdir -p "$OUTPUT_DIR/logs"

echo "===============================================" > "$REPORT"
echo "REPORTE DE AUDITORÍA DEL SISTEMA - $DATE" >> "$REPORT"
echo "===============================================" >> "$REPORT"

echo -e "\n[+] Usuarios logueados recientemente:" >> "$REPORT"
last -n 10 >> "$REPORT"

echo -e "\n[+] Eventos críticos detectados por auditd:" >> "$REPORT"
sudo ausearch -ts today --success no | grep "type=" >> "$REPORT"

echo -e "\n[+] Cambios en /etc/passwd o /etc/sudoers:" >> "$REPORT"
sudo ausearch -k passwd_changes -ts today >> "$REPORT"
sudo ausearch -k sudo_config -ts today >> "$REPORT"

echo -e "\n[+] Comandos ejecutados con sudo:" >> "$REPORT"
grep "COMMAND=" /var/log/auth.log | tail -n 15 >> "$REPORT"

echo -e "\n[+] Errores y advertencias del sistema (últimas 24h):" >> "$REPORT"
journalctl --since "24 hours ago" -p 3..4 >> "$REPORT"

echo -e "\n[✔] Reporte generado en: $REPORT"
