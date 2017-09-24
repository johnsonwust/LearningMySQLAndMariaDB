
mysqldump --user=admin_backup --password --lock-all-tables --all-databases > all_dbs.sql

mysqldump --user=admin_backup --password --lock-tables --verbose --databases rookery > rookery.sql
mysqldump --user=admin_backup --password --lock-tables --verbose --databases rookery birdwatchers > rookery-birdwatchers.sql
mysqldump --user=admin_backup --password --lock-tables --databases birdwatchers --tables humans > birdwatchers_humans.sql
mysqldump --user=admin_backup --password --lock-tables birdwatchers humans > birdwatchers_humans.sql

mysqldump --user=admin_backup --password --lock-tables --databases rookery --tables birds > birds-humans.sql
mysqldump --user=admin_backup --password --lock-tables --databases birdwatchers --tables humans >> birds-humans.sql



mysqldump --user=admin_backup --password --lock-tables --verbose --databases rookery > rookery.sql
mysql --user=admin_restore --password --execute="DROP DATABASE rookery;"
mysql --user=admin_restore --password < rookery.sql

mysql --user=admin_restore --password < rookery_backup.sql
DROP TABLE rookery.conservation_status;
CREATE TABLE rookery.conservation_status
LIKE rookery_backup.conservation_status;

INSERT INTO rookery.conservation_status
SELECT * FROM rookery_backup.conservation_status;

DROP DATABASE rookery_backup;

----------------------------------
----...........................
--??????