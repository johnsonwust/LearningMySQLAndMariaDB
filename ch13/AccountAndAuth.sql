
CREATE USER 'sansa_stark';

SHOW GRANTS FOR 'sansa_stark';

GRANT ALL ON rookery.*
TO 'sansa_stark'@'localhost';

SHOW GRANTS FOR 'sansa_stark'@'localhost';

SELECT u.User, u.Host
FROM mysql.user u
WHERE u.User LIKE 'sansa_stark';

DROP USER 'sansa_stark'@'localhost';
DROP USER 'sansa_stark'@'%';

CREATE USER 'sansa_stark'@'localhost'
IDENTIFIED BY 'her_password_123';

GRANT USAGE ON *.* TO 'sansa_stark'@'sansa_stark_home'
IDENTIFIED BY 'her_password_123';

SHOW GRANTS FOR 'sansa_stark'@'localhost' \G 

SELECT PASSWORD('her_password_123') AS 'Password';

GRANT SELECT, INSERT, UPDATE ON rookery.*
TO 'sansa_stark'@'localhost';
GRANT SELECT, INSERT, UPDATE ON birdwatchers.*
TO 'sansa_stark'@'localhost';

SHOW GRANTS FOR 'sansa_stark'@'localhost' \G 

GRANT DELETE ON rookery.*
TO 'sansa_stark'@'localhost';
GRANT DELETE ON birdwatchers.*
TO 'sansa_stark'@'localhost';

SHOW GRANTS FOR 'sansa_stark'@'localhost' \G 


DROP USER 'sansa_stark'@'sansa_stark_home';
GRANT USAGE ON rookery.*
TO 'sansa_stark'@'sansa_stark_home'
IDENTIFIED BY 'her_password_123';

SHOW GRANTS FOR 'sansa_stark'@'sansa_stark_home' \G 

mysql --user sansa_stark --password='her_password_123' --host rookery.eu --execute='SHOW DATABASE'
GRANT SELECT ON rookery.*
TO 'sansa_stark'@'sansa_stark_home';

SHOW GRANTS FOR 'sansa_stark'@'sansa_stark_home' \G 

mysql --user sansa_stark --password='her_password_123' --host rookery.eu --execute="SHOW DATABASE; SELECT common_name AS 'Avocets' FROM rookery.birds WHERE common_name LIKE '%Avocet%';"
GRANT SELECT ON rookery.*
TO 'sansa_stark'@'sansa_stark_home';

GRANT SELECT ON birdwatchers.bird_sightings
TO 'sansa_stark'@'sansa_stark_home';

SHOW GRANTS FOR 'sansa_stark'@'sansa_stark_home' \G 

mysql --user sansa_stark --password='her_password_123' --host rookery.eu --execute="SHOW TABLES FROM birdwatchers;"

GRANT SELECT (human_id, formal_title, name_first, name_last,membership_type)
ON birdwatchers.humans
TO 'sansa_stark'@'sansa_stark_home';


--backup
CREATE USER 'admin_backup'@'localhost'
IDENTIFIED BY 'bak_password_123';

GRANT SELECT, LOCK TABLES,RELOAD
ON rookery.*
TO 'admin_backup'@'localhost';
GRANT SELECT, LOCK TABLES,RELOAD
ON birdwatchers.*
TO 'admin_backup'@'localhost';


--restore
CREATE USER 'admin_restore'@'localhost'
IDENTIFIED BY 'rst_password_123';

GRANT INSERT, LOCK TABLES, CREATE,
      CREATE TEMPORARY TABLES, INDEX, ALTER
ON rookery.*
TO 'admin_restore'@'localhost';
GRANT INSERT, LOCK TABLES, CREATE,
      CREATE TEMPORARY TABLES, INDEX, ALTER
ON birdwatchers.*
TO 'admin_restore'@'localhost';

--import
CREATE USER 'admin_import'@'localhost'
IDENTIFIED BY 'imp_password_123';

GRANT FILE
ON *.*
TO 'admin_import'@'localhost';

--granter
GRANT ALL PRIVILEGES ON rookery.*
TO 'admin_granter'@'localhost'
IDENTIFIED BY 'grt_password_123'
WITH GRANT OPTION;

GRANT ALL PRIVILEGES ON birdwatchers.*
TO 'admin_granter'@'localhost'
IDENTIFIED BY 'grt_password_123'
WITH GRANT OPTION;

GRANT CREATE USER ON *.*
TO 'admin_granter'@'localhost';

GRANT SELECT ON mysql.*
TO 'admin_granter'@'localhost';

mysql --user admin_granter --password=grt_password_123

SELECT CURRENT_USER() AS 'User Account';

CREATE USER 'bird_test'@'localhost';

GRANT SELECT ON birdwatchers.*
TO 'bird_test'@'localhost';

SHOW GRANTS FOR 'bird_test'@'localhost';

DROP USER 'bird_test'@'localhost';


REVOKE ALL PRIVILEGES
ON rookery.*
FROM 'michael_stone'@'localhost';
REVOKE ALL PRIVILEGES
ON birdwatchers.*
FROM 'michael_stone'@'localhost';

REVOKE ALTER 
ON rookery.*
FROM 'admin_restore'@'localhost';

REVOKE ALTER 
ON birdwatchers.*
FROM 'admin_restore'@'localhost';

--DROP USER
REVOKE ALL ON *.* FROM 'michael_stone'@'localhost';
DROP USER 'michael_stone'@'localhost';


SELECT u.User, u.Host
FROM mysql.user u
WHERE u.User LIKE '%michael%'
      OR u.User LIKE '%stone%';

REVOKE ALL ON *.* FROM 'mstone'@'mstone_home';
DROP USER 'mstone'@'mstone_home';

SHOW PROCESSLIST;

KILL 4; -- try local, KILL can disconnect the id's connection, but the relevant terminal will reconnect successfully.


ALTER USER 'admin_granter'@'localhost' PASSWORD EXPIRE;
SET PASSWORD FOR 'admin_granter'@'localhost'=PASSWORD('grt_password_123');

mysql -uhypStudy -p --skip-column-names --silent --execute="SELECT PASSWORD('grt_password_123')"
----*292F1E11BFFFFF875E46900E6964D9588B100E7A
SET PASSWORD FOR 'admin_granter'@'localhost'='*292F1E11BFFFFF875E46900E6964D9588B100E7A';



----Reset root password
--1. new txt file : rt-reset.sql;
--2. file content : UPDATE mysql.user SET Password=Password('new_pwd') WHERE user='root';    FLUSH PRIVILEGES;
--3. start mysql  : mysqld_safe --init-file=/root/rt-reset.sql &


RENAME USER 'sansa_stark'@'sansa_stark_home'
         TO 'sansa'@'sansa_stark_home';

SHOW GRANT FOR 'sansa'@'sansa_stark_home';


CREATE ROLE 'admin_import_role';

GRANT FILE ON *.*
TO 'admin_import_role'@'localhost';

GRANT 'admin_import_role' TO 'max'@localhost;
GRANT 'admin_import_role' TO 'ulf'@localhost;


SET ROLE 'admin_import_role';
LOAD DATA INFILE
...
SET ROLE NONE;



--Q&A

--1.
    CREATE USER 'admin_boss'@'localhost'
    IDENTIFIED BY 'boss_pwd_123';

    GRANT ALL PRIVILEGES ON rookery.*
    TO 'admin_boss'@'localhost'
    WITH GRANT OPTION;
    GRANT ALL PRIVILEGES ON birdwatchers.*
    TO 'admin_boss'@'localhost'
    WITH GRANT OPTION;
    
    GRANT SUPER ON rookery.*
    TO 'admin_boss'@'localhost';
    GRANT SUPER ON birdwatchers.*
    TO 'admin_boss'@'localhost';

    GRANT CREATE USER ON rookery.*
    TO 'admin_boss'@'localhost';
    GRANT CREATE USER ON birdwatchers.*
    TO 'admin_boss'@'localhost';

--2.
    GRANT SELECT,INSERT,UPDATE ON rookery.*
    TO 'sakari'@'localhost'
    IDENTIFIED BY 'sky_pwd_123';

    GRANT SELECT,INSERT,UPDATE ON birdwatchers.*
    TO 'sakari'@'localhost'
    IDENTIFIED BY 'sky_pwd_123';

--login sakari
    SHOW DATABASES;
    SELECT * FROM birdwatchers.humans;

    INSERT INTO birdwatchers.humans
    (formal_title,name_first,name_last,email_address,join_date,membership_type,membership_expiration,skill_level)
    VALUES
    ('Mr','Robert', 'Willianm','bob@yahoo.com',NOW(),'premium','2020-12-31','Field Spotter');

    UPDATE birdwatchers.humans
    SET name_last='Will'
    WHERE human_id=37;

    DELETE FROM birdwatchers.humans
    WHERE human_id=37;

--3.
    REVOKE INSERT,UPDATE ON rookery.*
    TO 'sakari'@'localhost';
    REVOKE INSERT,UPDATE ON birdwatchers.*
    TO 'sakari'@'localhost';

    INSERT INTO birdwatchers.humans
    (formal_title,name_first,name_last,email_address,join_date,membership_type,membership_expiration,skill_level)
    VALUES
    ('Mr','Robert', 'Willianm','bob@yahoo.com',NOW(),'premium','2020-12-31','Field Spotter');

--4.
    SET PASSWORD FOR 'sakari'@'localhost'=PASSWORD('sar_pwd_123');

--login sakari, press 'UP' keyboard several times, check if the password is clear

--logout, 
mysql -usakari -p --skip-column-names --silent --execute="SELECT PASSWORD('sar2_pwd_123')"
----*292F1E11BFFFFF875E46900E6964D9588B100E7A
SET PASSWORD FOR 'sakari'@'localhost'='*292F1E11BFFFFF875E46900E6964D9588B100E7A';

--login sakari, press 'UP' keyboard several times, check if the password is clear


--5.
    SELECT u.User, u.Host
    FROM mysql.user u;

    REVOKE ALL ON *.* FROM 'sakari'@'mstone_home';
    DROP USER 'sakari'@'localhost';