#!/usr/bin/bash

mysql -u root -p'root' -h 127.0.0.1 --port=3306 < "sql/mysqldump_2.sql" 
