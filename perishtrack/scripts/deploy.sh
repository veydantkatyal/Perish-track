#!/bin/bash
# Production Deployment Script for MySQL Database

DB_HOST="your_db_host"
DB_USER="your_db_user"
DB_PASS="your_db_pass"

mysql -h $DB_HOST -u $DB_USER -p$DB_PASS < ./sql/create_tables.sql
mysql -h $DB_HOST -u $DB_USER -p$DB_PASS < ./sql/insert_data.sql
mysql -h $DB_HOST -u $DB_USER -p$DB_PASS < ./sql/stored_procedures.sql
mysql -h $DB_HOST -u $DB_USER -p$DB_PASS < ./sql/triggers.sql

echo "Database deployment completed."
