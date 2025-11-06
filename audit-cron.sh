#!/bin/bash
# ================================================
# Script: audit-cron.sh
# Descripción: Programa ejecución diaria automática
# # Autor: Luciano Segovia
# ================================================

SCRIPT_PATH="$(realpath "$(dirname "$0")/audit-report.sh")"
CRON_JOB="0 7 * * * $SCRIPT_PATH > /dev/null 2>&1"

# Eliminar tarea previa si existe
(crontab -l 2>/dev/null | grep -v "audit-report.sh") | crontab -

# Agregar nueva tarea
(crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -

echo "[✔] Auditoría diaria programada a las 07:00 AM"
