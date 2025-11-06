# Auditoría de Logs Automatizada (Linux)

## Descripción
Conjunto de scripts que automatizan la auditoría de logs del sistema usando `auditd`, `ausearch` y `journalctl`.

## Requisitos
- Ubuntu 22+ o Debian-based
- Paquetes: `auditd`, `sudo`, `cron`

## Uso

### 1. Configurar auditoría
```bash
sudo bash audit-config.sh

### 2. Generar Cron - Reporte Diario

sudo bash audit-cron.sh


### 3. Ejecutar Reporte Manual


sudo bash audit-report.sh



### OUTPUT #### 


===============================================
REPORTE DE AUDITORÍA DEL SISTEMA - 20251106
===============================================

[+] Usuarios logueados recientemente:
pepe tty2         tty2             Thu Nov  6 07:36   still logged in
pepe seat0        login screen     Thu Nov  6 07:36   still logged in
reboot   system boot  6.8.0-50-generic Thu Nov  6 07:33   still running
pepe tty2         tty2             Wed Nov  5 18:01 - down   (05:14)
pepe seat0        login screen     Wed Nov  5 18:01 - down   (05:14)
reboot   system boot  6.8.0-50-generic Wed Nov  5 17:56 - 23:16  (05:19)
pepe tty2         tty2             Wed Nov  5 16:30 - down   (00:16)
pepe seat0        login screen     Wed Nov  5 16:30 - down   (00:16)
reboot   system boot  6.8.0-50-generic Wed Nov  5 16:30 - 16:47  (00:17)
pepe tty2         tty2             Wed Nov  5 07:35 - down   (07:25)
