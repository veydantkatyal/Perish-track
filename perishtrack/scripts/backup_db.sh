#!/bin/bash
# Database Backup Script for Production

DB_USER="root"
DB_PASS="password"
DB_NAME="perishtrack_db"
BACKUP_DIR="./sql/backups"
BACKUP_FILE="$BACKUP_DIR/backup_$(date +%F).sql"

# Perform backup
mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > $BACKUP_FILE

# Log
echo "Backup completed: $BACKUP_FILE"
