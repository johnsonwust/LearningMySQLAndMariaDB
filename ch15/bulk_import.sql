
CREATE TABLE rookery.clements_list_import
(
    id INT,
    change_type VARCHAR(255),
    col2 CHAR(0),
    col3 CHAR(0),
    scientific_name VARCHAR(255),
    english_name VARCHAR(255),
    col6 CHAR(0),
    'order' VARCHAR(255),
    family VARCHAR(255),
    col9 CHAR(0),
    col10 CHAR(0),
    col11 CHAR(0),
    col12 CHAR(0),
    col13 CHAR(0),
    col14 CHAR(0),
    col15 CHAR(0),
    col16 CHAR(0),
    col17 CHAR(0)
);


LOAD DATA INFILE '/tmp/clements_list_6.9-final.csv'
INTO TABLE rookery.clements_list_import
FIELDS TERMINATED BY ',';

SHOW WARNINGS;

SELECT * FROM rookery.clements_list_import LIMIT 2 \G

SELECT id,change_type,scientific_name,english_name,'order',family
FROM rookery.clements_list_import
WHERE change_type='new species' LIMIT 2 \G


DELETE FROM rookery.clements_list_import;
LOAD DATA INFILE '/tmp/clements_list_6.9-final.csv'
INTO TABLE rookery.clements_list_import
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
IGNORE 1 lines;


SELECT id,change_type,scientific_name,english_name,'order',family
FROM rookery.clements_list_import
WHERE change_type='new species' LIMIT 2 \G


CREATE TABLE rookery.birds_new
LIKE rookery.birds;

INSERT INTO birds_new
(scientific_name,common_name,family_id)
SELECT c.scientific_name, c.english_name, f.family_id
FROM rookery.clements_list_import c
JOIN bird_families f 
     ON f.scientific_name=SUBSTRING(
         c.family,1,LOCATE('(',family)
     )
WHERE change_type='new species';


SELECT n.scientific_name,n.common_name,n.family_id,f.scientific_name AS 'Family'
FROM birds_new n 
JOIN bird_families f USING(family_id);



DROP TABLE rookery.clements_list_import;
CREATE TABLE rookery.clements_list_import
(
    id INT,
    scientific_name VARCHAR(255),
    english_name VARCHAR(255),
    family VARCHAR(255),
    bird_order VARCHAR(255),
    change_type VARCHAR(255)

);

LOAD DATA INFILE '/tmp/clements_list_6.9-final.csv'
INTO TABLE rookery.clements_list_import
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
IGNORE 1 lines
(
    id,
    change_type,
    @niente,
    @niente,
    scientific_name,
    english_name,
    @niente,
    bird_order,
    family,
    @niente,
    @niente,
    @niente,
    @niente,
    @niente,
    @niente,
    @niente,
    @niente,
    @niente
);

SELECT * FROM rookery.clements_list_import
WHERE change_type='new species'
ORDER BY id DESC LIMIT 2 \G



DELETE FROM rookery.clements_list_import;
LOAD DATA INFILE '/tmp/clements_list_6.9-final.csv'
INTO TABLE rookery.clements_list_import
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
IGNORE 1 lines
(
    id,
    change_type,
    @niente,
    @niente,
    scientific_name,
    english_name,
    @niente,
    bird_order,
    family,
    @niente,
    @niente,
    @niente,
    @niente,
    @niente,
    @niente,
    @niente,
    @niente,
    @niente
)
SET family=SUBSTRING(@family,1,LOCATE('(',@family));

SELECT * FROM rookery.clements_list_import
WHERE change_type='new species'
AND english_name LIKE '%Treehunter%' \G 



CREATE TABLE birdwatchers.birdwatcher_prospects_import
(
    prospect_id INT AUTO_INCREMENT KEY,
    prospect_name VARCHAR(255),
    prospect_email VARCHAR(255) UNIQUE,
    prospect_country VARCHAR(255)
);

LOAD DATA INFILE '/tmp/birdwatcher-prospects.csv'
INTO TABLE birdwatchers.birdwatcher_prospects_import
FIELDS TERMINATED BY '|' ENCLOSED BY '"' ESCAPED BY '\\'
LINES STARTING BY '[' TERMINATED BY ']\r\n'
IGNORE 1 lines
(prospect_name,prospect_email,prospect_country);


LOAD DATA INFILE '/tmp/birdwatcher-prospects.csv'
IGNORE INTO TABLE birdwatchers.birdwatcher_prospects_import
FIELDS TERMINATED BY '|' ENCLOSED BY '"' ESCAPED BY '\\'
LINES STARTING BY '[' TERMINATED BY ']\r\n'
IGNORE 1 lines
(prospect_name,prospect_email,prospect_country);

SHOW WARNINGS;

SELECT * FROM birdwatchers.birdwatcher_prospects_import
WHERE prospect_name LIKE '%Sveta%' \G 

--REPLACE : DELETE , then INSERT
LOAD DATA INFILE '/tmp/birdwatcher-prospects.csv'
REPLACE INTO TABLE birdwatchers.birdwatcher_prospects_import
FIELDS TERMINATED BY '|' ENCLOSED BY '"' ESCAPED BY '\\'
LINES STARTING BY '[' TERMINATED BY ']\r\n'
IGNORE 1 lines
(prospect_name,prospect_email,prospect_country);

SELECT * FROM birdwatchers.birdwatcher_prospects_import
WHERE prospect_name LIKE '%Sveta%' \G 


mysql --user=admin_import --password --host=mysqlresource.com --database=rookery

LOAD DATA INFILE '/tmp/birdwatcher-prospects.csv'
REPLACE INTO TABLE birdwatchers.birdwatcher_prospects_import
FIELDS TERMINATED BY '|' ENCLOSED BY '"' ESCAPED BY '\\'
LINES STARTING BY '[' TERMINATED BY ']\r\n'
IGNORE 1 lines
(prospect_name,prospect_email,prospect_country);


mysqlimport --user='marie_dyer' --password='sevenangels' --replace --low-priority --ignore-lines='1'
--fields-enclosed-by='"' --fields-terminated-by='|' --fields-escaped-by='\\'
--lines-terminated-by=']\r\n' --columns='prospect_name,prospect_email,prospect_country' 
birdwatchers '/tmp/birdwatcher_prospects_import.csv'



(SELECT 'scientific_name','common_name','family_name')
UNION
(
SELECT b.scientific_name,
        IFNULL(common_name,''),
        f.scientific_name
FROM birds b 
JOIN bird_families f USING(family_id)
JOIN bird_orders o USING(order_id)
WHERE o.scientific_name='Charadriiformes'
ORDER BY common_name

INTO OUTFILE '/tmp/birds_list.csv'
FIELDS ENCLOSED BY '"' TERMINATED BY '|' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
);
