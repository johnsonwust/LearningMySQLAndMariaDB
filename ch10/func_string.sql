
--Not login mysql, just restore the backup data
mysql -uhypStudy -p******** test < ch10_start_test.sql
mysql -uhypStudy -p******** rookery < ch10_start_rookery.sql
mysql -uhypStudy -p******** birdwatchers < ch10_start_birdwatchers.sql

mysql -uhypStudy -p******** rookery < birds.sql
mysql -uhypStudy -p******** rookery < table.conservation_status.sql
mysql -uhypStudy -p******** rookery < table.bird_orders.sql
mysql -uhypStudy -p******** rookery < cornell_birds_families_orders.sql
mysql -uhypStudy -p******** birdwatchers < birdwatchers.sql

SELECT CONCAT_WS('|', formal_title, name_first, name_last, street_address, city, state_province, postal_code,country_id) 
  FROM birdwatchers.humans 
  WHERE membership_type='premium' AND membership_expiration>DATE_ADD(CURDATE(), INTERVAL -4 YEAR);
mysql -uhypStudy -p******** --skip-column-names -e "SELECT CONCAT_WS('|', formal_title, name_first, name_last, street_address, city, state_province, postal_code,country_id) FROM birdwatchers.humans WHERE membership_type='premium' AND membership_expiration>DATE_ADD(CURDATE(), INTERVAL -4 YEAR);" > rookery_patch_mailinglist.txt

SELECT CONCAT_WS('|', IFNULL(formal_title,' '), IFNULL(name_first,' '), IFNULL(name_last,' '), IFNULL(street_address,' '), IFNULL(city,' '), IFNULL(state_province,' '), IFNULL(postal_code,' '),IFNULL(country_id,' ')) 
  FROM birdwatchers.humans 
  WHERE membership_type='premium' AND membership_expiration>DATE_ADD(CURDATE(), INTERVAL -4 YEAR);
mysql -uhypStudy -p******** --skip-column-names -e "SELECT CONCAT_WS('|', IFNULL(formal_title,' '), IFNULL(name_first,' '), IFNULL(name_last,' '), IFNULL(street_address,' '), IFNULL(city,' '), IFNULL(state_province,' '), IFNULL(postal_code,' '),IFNULL(country_id,' '))  FROM birdwatchers.humans WHERE membership_type='premium' AND membership_expiration>DATE_ADD(CURDATE(), INTERVAL -4 YEAR);" > rookery_patch_mailinglist.txt

--login mysql

USE birdwatchers;

SELECT CONCAT(h.formal_title,'. ', h.name_first, SPACE(1), h.name_last) AS Birder,
       CONCAT(b.common_name, ' - ', b.scientific_name) AS Bird,
       s.time_seen AS 'When Spotted'
  FROM bird_sightings s 
  JOIN humans h  USING(human_id)
  JOIN rookery.birds b USING(bird_id)
 GROUP BY h.human_id DESC
 LIMIT 4;

SELECT LCASE(b.common_name) AS Species,
       UCASE(f.scientific_name) AS Family
  FROM birds b 
  JOIN bird_families f USING(family_id)
 WHERE common_name LIKE '%Wren%'
 ORDER BY Species
 LIMIT 5;

SELECT QUOTE(common_name)
  FROM birds b 
 WHERE common_name LIKE '%Prince%'
 ORDER BY common_name;

UPDATE humans
   SET name_first=LTRIM(name_first),
       name_last=LTRIM(name_last);
UPDATE humans
   SET name_first=RTRIM(name_first),
       name_last=RTRIM(name_last);

UPDATE humans
   SET name_first=LTRIM(RTRIM(name_first),
       name_last=LTRIM(RTRIM(name_last));

UPDATE humans
   SET name_first=TRIM(name_first),
       name_last=TRIM(name_last);


INSERT INTO bird_sightings
(bird_id, human_id, time_seen, location_gps)
VALUES
(
    SELECT b.bird_id, h.human_id, date_spotted, gps_coordinates
      FROM 
      (
          SELECT personal_name,family_name,scientific_name, date_spotted,
                 CONCAT(latitude,';',longitude) AS gps_coordinates
            FROM eastern_birders
            JOIN eastern_birders_sightings USING(birder_id)
           WHERE 
           (
               personal_name,family_name,scientific_name,
               CONCAT(latitude,';',longitude)
           ) NOT IN 
           (
               SELECT name_first, name_last, scientific_name, location_gps
                 FROM humans
                 JOIN bird_sightings USING(human_id)
                 JOIN rookery.birds USING(bird_id)
           )
      )AS derived_1
      JOIN humans ON 
      (
          personal_name=name_first
          AND
          family_name=name_last
      )
      JOIN rookery.birds ON
      (
          scientific_name=TRIM(BOTH '"' scientific_name)
      )
);


SELECT CONCAT(
                RPAD(b.common_name, 20, '.'),
                RPAD(f.scientific_name, 15,'.'),
                o.scientific_name
             )AS Birds 
  FROM birds b 
  JOIN bird_families f USING(family_id)
  JOIN bird_orders o --USING(order_id)
 WHERE b.common_name!=''
       AND o.scientific_name='Ciconiiformes'
 ORDER BY b.common_name 
 LIMIT 3;

SELECT prospect_name FROM prospects LIMIT 4;

SELECT LEFT(prospect_name,2)AS title ,
       MID(prospect_name,5,25)AS first_name,
       RIGHT(prospect_name,25)AS last_name
  FROM prospects LIMIT 4;

SELECT SUBSTRING(prospect_name,1,2)AS title ,
       SUBSTRING(prospect_name FROM 5 FOR 25)AS first_name,
       SUBSTRING(prospect_name, -25)AS last_name,
       SUBSTRING(prospect_name FROM 30 FOR 25)AS last_name_1
  FROM prospects LIMIT 4;

SELECT SUBSTRING_INDEX(prospect_name,'|',1)AS title ,
       SUBSTRING_INDEX(SUBSTRING_INDEX(prospect_name,'|',2),'|',-1)AS first_name,
       SUBSTRING_INDEX(prospect_name,'|', -1)AS last_name,
       SUBSTRING(prospect_name FROM 31 FOR 25)AS last_name_1
  FROM prospects 
 WHERE prospect_id=7;


SELECT common_name AS 'Avocet'
  FROM birds b 
  JOIN bird_families f USING(family_id)
 WHERE f.scientific_name ='Recurvirostridae'
       AND b.common_name LIKE '%Avocet%';

SELECT TRIM(SUBSTRING(common_name,1, LOCATE('Avocet',common_name)-1)) AS 'Avocet'
  FROM birds b 
  JOIN bird_families f USING(family_id)
 WHERE f.scientific_name ='Recurvirostridae'
       AND b.common_name LIKE '%Avocet%';

INSERT INTO bird_sightings
(bird_id, human_id, time_seen, location_gps)
VALUES
(
    SELECT b.bird_id, h.human_id, date_spotted, gps_coordinates
      FROM 
      (
          SELECT personal_name,family_name,scientific_name, date_spotted,
                 CONCAT(latitude,';',longitude) AS gps_coordinates
            FROM eastern_birders
            JOIN eastern_birders_sightings USING(birder_id)
           WHERE 
           (
               personal_name,family_name,scientific_name,
               CONCAT(latitude,';',longitude)
           ) NOT IN 
           (
               SELECT name_first, name_last, scientific_name, location_gps
                 FROM humans
                 JOIN bird_sightings USING(human_id)
                 JOIN rookery.birds USING(bird_id)
           )
      )AS derived_1
      JOIN humans ON 
      (
          personal_name=name_first
          AND
          family_name=name_last
      )
      JOIN rookery.birds ON
      (
          scientific_name=SUBSTRING(scientific_name, LOCATE(' - ',scientific_name)+3)
      )
);

INSERT INTO bird_sightings
(bird_id, human_id, time_seen, location_gps)
VALUES
(
    SELECT b.bird_id, h.human_id, date_spotted, gps_coordinates
      FROM 
      (
          SELECT personal_name,family_name,scientific_name, date_spotted,
                 CONCAT(latitude,';',longitude) AS gps_coordinates
            FROM eastern_birders
            JOIN eastern_birders_sightings USING(birder_id)
           WHERE 
           (
               personal_name,family_name,scientific_name,
               CONCAT(latitude,';',longitude)
           ) NOT IN 
           (
               SELECT name_first, name_last, scientific_name, location_gps
                 FROM humans
                 JOIN bird_sightings USING(human_id)
                 JOIN rookery.birds USING(bird_id)
           )
      )AS derived_1
      JOIN humans ON 
      (
          personal_name=name_first
          AND
          family_name=name_last
      )
      JOIN rookery.birds ON
      (
          scientific_name=SUBSTRING(scientific_name, POSITION(' - ' IN scientific_name)+3)
      )
);

SELECT human_id,
       CONCAT(name_first, SPACE(1), name_last)AS Name,
       join_date
  FROM humans
 WHERE country_id='ru'
 ORDER BY join_date;


SELECT FIND_IN_SET('Anahit Vanetsyan', Names)AS Position
  FROM 
  (
      SELECT GROUP_CONCAT(Name ORDER BY join_date)AS Names 
        FROM
        (
            SELECT CONCAT(name_first, SPACE(1), name_last)AS Name,
                   join_date
              FROM humans
             WHERE country_id='ru'
        )AS derived_1
  )AS derived_2;

SELECT IF(CHAR_LENGTH(comments)>100,'long','short') AS Comments
  FROM bird_sightings
 WHERE sighting_id=2;

SELECT sighting_id
  FROM bird_sightings
 WHERE CHARACTER_LENGTH(comments)!=LENGTH(comments);



CREATE TABLE possible_duplicate_email
(
    human_id INT,
    email_address1 VARCHAR(255),
    email_address2 VARCHAR(255),
    entry_date datetime 
);

INSERT IGNORE INTO possible_duplicate_email
(human_id, email_address1,email_address2,entry_date)
VALUES
(LAST_INSERT_ID(),'bodyfischer@mymail.com','bodyfischer@mymail.com',CURDATE())
WHERE ABS(STRCMP('bodyfischer@mymail.com','bodyfischer@mymail.com'))=1;

CREATE FULLTEXT INDEX comment_index
ON bird_sightings(comments);

SELECT CONCAT(name_first,SPACE(1),name_last)AS Name,
       common_name AS Bird,
       SUBSTRING(comments,1,25)AS Comments
  FROM bird_sightings s
  JOIN humans h USING(human_id)
  JOIN rookery.birds b USING(bird_id)
 WHERE MATCH(comments) AGAINST('beautiful');

SELECT INSERT(common_name, 6,0,' (ie., Smallest)') AS 'Smallest Birds'
  FROM birds
 WHERE common_name LIKE 'Least%' 
 LIMIT 1;

SELECT common_name AS Original,
       INSERT(common_name, LOCATE('Gt.',common_name), 3,'Great' ) AS Adjusted
  FROM birds
 WHERE common_name REGEXP 'Gt.' 
 LIMIT 1;

UPDATE birds
   SET common_name = INSERT(common_name, LOCATE('Gt.',common_name), 3,'Great' ) AS Adjusted
 WHERE common_name REGEXP 'Gt.';


SELECT common_name AS Original,
       REPLACE(common_name, 'Gt.', 'Great') AS Replaced
  FROM birds
 WHERE common_name REGEXP 'Gt.' 
 LIMIT 1;

UPDATE birds
   SET common_name = REPLACE(common_name, 'Gt.', 'Great')
 WHERE common_name REGEXP 'Gt.' 


SELECT sorting_id, bird_name, bird_image
  FROM bird_images
 ORDER BY sorting_id
 LIMIT 5;

SELECT sorting_id, bird_name, bird_image
  FROM bird_images
 ORDER BY CAST(sorting_id AS INT)
 LIMIT 5;


SELECT bird_name, gender_age, bird_image
  FROM bird_images
 WHERE bird_name LIKE '%Plover%'
 ORDER BY gender_age
 LIMIT 5;

SHOW COLUMNS FROM bird_images LIKE 'gender_age' \G 

SELECT bird_name, gender_age, bird_image
  FROM bird_images
 WHERE bird_name LIKE '%Plover%'
 ORDER BY CONVERT(gender_age,CHAR)
 LIMIT 5;

SELECT bird_name, gender_age, bird_image
  FROM bird_images
 WHERE bird_name LIKE '%Plover%'
 ORDER BY CONVERT(gender_age USING utf8)
 LIMIT 5;


INSERT INTO humans 
(formal_title, name_first, name_last, join_date, birding_background)
VALUES('Ms','Melissa','Lee',CURDATE(),COMPRESS("lengthy background..."));

SELECT birding_background AS Background
  FROM humans
 WHERE name_first='Melissa'
       AND name_last='Lee' \G

SELECT UNCOMPRESS(birding_background) AS Background
  FROM humans
 WHERE name_first='Melissa'
       AND name_last='Lee' \G

--Q&A:

--1.
    SELECT CONCAT(name_first,SPACE(1),name_last)AS 'Full Name'
      FROM humans
     LIMIT 4;

    SELECT CONCAT(name_first,SPACE(1),name_last)AS 'Full Name'
      FROM humans
     WHERE CONCAT(name_first,SPACE(1),name_last) IN 
           (
               'Lexi Hollar', 'Michael Zabalaoui','Rusty Johnson'
           )
     ORDER BY 'Full Name'
     LIMIT 4;

--2.
    SELECT CONCAT(b.common_name, ' (', b.scientific_name,')')AS 'Bird Species'
      FROM birds b 
     LIMIT 10;

    SELECT CONCAT(RPAD(CONCAT(b.common_name, ' (', b.scientific_name,')'), 55, '.'),
           RPAD(f.scientific_name, 20,'.'),
           o.scientific_name)AS 'Bird Species'
      FROM birds b 
      JOIN bird_families f USING(family_id)
      JOIN bird_orders o USING(order_id)
     WHERE b.common_name REGEXP 'Warble'
     LIMIT 10;

--3.
    SELECT bird_id, scientific_name, common_name, family_id
      FROM birds
     WHERE common_name REGEXP 'Short';

    SELECT bird_id, scientific_name, REPLACE(common_name, '-', SPACE(1)) AS common_name, family_id
      FROM birds
     WHERE common_name REGEXP 'Short';

--4.
    SELECT bird_id, scientific_name,
           REPLACE(common_name, 'Short-', 'Short ') AS common_name, 
           family_id
      FROM birds
     WHERE common_name REGEXP 'Short';
    
--5.
    SELECT b.bird_id, b.scientific_name,
           TRIM(REPLACE(b.common_name, SUBSTRING(b.common_name, 1, LOCATE('Short', b.common_name)-1), '')) AS t1_name,
           TRIM(SUBSTRING(b.common_name, 1, LOCATE('Short', b.common_name)-1)) AS t2_name,
           CONCAT(
                TRIM(REPLACE(b.common_name, SUBSTRING(b.common_name, 1, LOCATE('Short', b.common_name)-1), '')),
                SPACE(1),
                TRIM(SUBSTRING(b.common_name, 1, LOCATE('Short', b.common_name)-1))
           ) AS common_name,
           b.family_id
      FROM birds b 
      JOIN bird_families f USING(family_id)
     WHERE b.common_name REGEXP 'Short'
           AND f.scientific_name='Muscicapidae';

--6.
    SELECT CONCAT
           (
               name_first,
               SPACE(1),
               name_last
           )AS 'Full Name'
      FROM humans;

    SELECT CONCAT
           (
               CONCAT(UCASE(SUBSTRING(name_first,1,1)), LCASE(SUBSTRING(name_first,2,LENGTH(name_first)-1))),
               SPACE(1),
               CONCAT(UCASE(SUBSTRING(name_last,1,1)), LCASE(SUBSTRING(name_last,2,LENGTH(name_last)-1)))
           )AS 'Full Name'
      FROM humans;
    
    UPDATE humans
       SET name_first=CONCAT(UCASE(SUBSTRING(name_first,1,1)), LCASE(SUBSTRING(name_first,2,LENGTH(name_first)-1))),
           name_last=CONCAT(UCASE(SUBSTRING(name_last,1,1)), LCASE(SUBSTRING(name_last,2,LENGTH(name_last)-1)))
     WHERE human_id !='';