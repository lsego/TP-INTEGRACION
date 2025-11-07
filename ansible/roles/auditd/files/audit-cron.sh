#!/bin/bash
# ================================================
# Script: audit-cron.sh
# Genera un reporte y lo envía al servidor central
# ================================================

REPORT_DIR="/var/log/audit/reports"
CENTRAL_SERVER="192.168.1.100"
CENTRAL_USER="audit"
CENTRAL_PATH="/home/audit/reportes"

mkdir -p "$REPORT_DIR"
DATE=$(date +'%Y-%m-%d_%H-%M')
REPORT="$REPORT_DIR/audit_report_$DATE.txt"

echo "Generando reporte de auditoría..."
ausearch -ts yesterday > "$REPORT"

echo "Enviando reporte al servidor central..."
scp -q "$REPORT" ${CENTRAL_USER}@${CENTRAL_SERVER}:${CENTRAL_PATH}/

echo "Reporte enviado: $REPORT"
