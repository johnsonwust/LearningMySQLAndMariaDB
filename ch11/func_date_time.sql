
SELECT COUNT(0) FROM `birds`;

SHOW VARIABLES LIKE '%time_zone%';
SELECT NOW();

INSERT INTO `bird_sightings`
(bird_id, human_id, time_seen, location_gps)
VALUES(104,34,NOW(),'47.318875;8.580119');

SELECT NOW(),SLEEP(4) AS 'Zzz',SYSDATE(),SLEEP(2) AS 'Zzz',SYSDATE();
SELECT NOW(),CURDATE(),CURTIME();
SELECT UNIX_TIMESTAMP(),NOW();
SELECT (YEAR(NOW())-1970) AS 'Simple',
       UNIX_TIMESTAMP() AS 'Seconds since Epoch',
       ROUND(UNIX_TIMESTAMP()/60/60/24/365.25) AS 'Complicated';

SELECT CONCAT(name_first, SPACE(1),name_last) AS 'Birdwatcher',
       ROUND((UNIX_TIMESTAMP()-UNIX_TIMESTAMP(time_seen))/60/60/24) AS 'Days Since Spotted'
  FROM `bird_sightings`
  JOIN `humans` USING(human_id)
 WHERE bird_id=309;

SELECT CONCAT(name_first, SPACE(1),name_last) AS 'Birdwatcher',
       time_seen,DATE(time_seen),TIME(time_seen)
  FROM `bird_sightings`
  JOIN `humans` USING(human_id)
 WHERE bird_id=309;

SELECT CONCAT(name_first, SPACE(1),name_last) AS 'Birdwatcher',
       time_seen,YEAR(time_seen),MONTH(time_seen),DAY(time_seen),
       HOUR(time_seen),MINUTE(time_seen),SECOND(time_seen),
       MONTHNAME(time_seen),DAYNAME(time_seen)
  FROM `bird_sightings`
  JOIN `humans` USING(human_id)
 WHERE bird_id=309 \G

SELECT common_name AS 'Endangered Bird',
       CONCAT(
           name_first, 
           SPACE(1),
           name_last
        ) AS 'Birdwatcher',
       CONCAT(
           DAYNAME(time_seen),
           ', ',
           MONTHNAME(time_seen), 
           SPACE(1),
           DAY(time_seen),
           ', '
           ,YEAR(time_seen)
       ) AS 'Date Spotted',
       CONCAT(
           HOUR(time_seen),
           ':',
           MINUTE(time_seen),
           IF(HOUR(time_seen)<12,'a.m.','p.m.')
       )AS 'Time Spotted'
  FROM `bird_sightings`
  JOIN `humans` USING(human_id)
  JOIN rookery.birds USING(bird_id)
  JOIN rookery.conservation_status USING(conservation_status_id)
 WHERE conservation_category='Threatened' LIMIT 3;

SELECT time_seen,
        EXTRACT(YEAR_MONTH FROM time_seen) AS 'Year & Month',
        EXTRACT(MONTH FROM time_seen) AS 'Month Only',
        EXTRACT(HOUR_MINUTE FROM time_seen) AS 'Hour & Minute',
        EXTRACT(HOUR FROM time_seen) AS 'Hour Only'
  FROM `bird_sightings`
  JOIN `humans` USING(human_id)
 LIMIT 3;

SELECT time_seen,
        EXTRACT(YEAR_MONTH FROM time_seen) AS 'Year & Month',
        EXTRACT(MONTH FROM time_seen) AS 'Month Only',
        EXTRACT(HOUR_MINUTE FROM time_seen) AS 'Hour & Minute',
        EXTRACT(HOUR FROM time_seen) AS 'Hour Only'
  FROM `bird_sightings`
  JOIN `humans` USING(human_id)
 WHERE bird_id=309;



 
SELECT common_name AS 'Endangered Bird',
       CONCAT(
           name_first, 
           SPACE(1),
           name_last
        ) AS 'Birdwatcher',
       DATE_FORMAT(
           time_seen,
           '%W, %M %e, %Y'
       )AS 'Date Spotted',
       DATE_FORMAT(
           time_seen,
           '%l:%i %p'
       )AS 'Time Spotted',
       DATE_FORMAT(
           time_seen,
           '%r'
       )AS 'Time Spotted With Second'
  FROM `bird_sightings`
  JOIN `humans` USING(human_id)
  JOIN rookery.birds USING(bird_id)
  JOIN rookery.conservation_status USING(conservation_status_id)
 WHERE conservation_category='Threatened' LIMIT 3;

SELECT GET_FORMAT(DATE, 'USA');
SELECT GET_FORMAT(TIME, 'USA');
SELECT GET_FORMAT(DATETIME, 'USA');
SELECT GET_FORMAT(DATE, 'EUR');
SELECT GET_FORMAT(DATE, 'INTERNAL');
SELECT GET_FORMAT(DATE, 'ISO');
SELECT GET_FORMAT(DATE, 'JIS');

SELECT DATE_FORMAT(CURDATE(), GET_FORMAT(DATE,'EUR')) AS 'Date in Europe',
       DATE_FORMAT(CURDATE(), GET_FORMAT(DATE,'USA')) AS 'Date in U.S.',
       REPLACE(DATE_FORMAT(CURDATE(), GET_FORMAT(DATE,'USA')),'.','-') AS 'Another Date in U.S.';

SHOW VARIABLES LIKE 'time_zone';

SELECT common_name AS 'Endangered Bird',
       CONCAT(
           name_first, 
           SPACE(1),
           name_last
        ) AS 'Birdwatcher',
       DATE_FORMAT(
           time_seen,
           '%r'
       )AS 'System Time Spotted',
       DATE_FORMAT(
           CONVERT_TZ(time_seen, 'US/Eastern','Europe/Rome'),
           '%r'
       )AS 'Birder Time Spotted'
  FROM `bird_sightings`
  JOIN `humans` USING(human_id)
  JOIN rookery.birds USING(bird_id)
  JOIN rookery.conservation_status USING(conservation_status_id)
 LIMIT 3;


--SET time_zone='UTC';
--SET time_zone='GMT';
--SET GLOBAL time_zone='UTC';
--SET GLOBAL time_zone='GMT';

--my.cnf / my.ini
--[mysqld]
--default-time-zone='GMT'

SELECT membership_expiration,
       DATE_ADD(membership_expiration, INTERVAL 3 MONTH)
  FROM `humans`
 WHERE country_id='uk'
       AND membership_expiration>CURDATE();


UPDATE `humans`
   SET membership_expiration=DATE_ADD(membership_expiration, INTERVAL 3 MONTH)
 WHERE country_id='uk'
       AND membership_expiration>CURDATE();

SELECT * FROM `humans`
 WHERE CONCAT(name_first,SPACE(1),name_last)='Melissa Lee' \G

UPDATE `humans`
   SET membership_expiration=DATE_SUB(membership_expiration, INTERVAL 3 MONTH)
 WHERE CONCAT(name_first,SPACE(1),name_last)='Melissa Lee';

SELECT * 
  FROM `bird_sightings`
 WHERE sighting_id=16;

UPDATE `bird_sightings`
   SET time_seen=DATE_ADD(time_seen, INTERVAL '1 2' DAY_HOUR)
 WHERE sighting_id=16;

SELECT TIME(NOW()), TIME_TO_SEC(NOW()), TIME_TO_SEC(NOW())/60/60 AS 'Hours';

CREATE TABLE `bird_identification_tests`
(
    test_id INT AUTO_INCREMENT KEY,
    human_id INT,
    bird_id INT,
    id_start TIME,
    id_end TIME 
);

INSERT INTO bird_identification_tests
VALUES(NULL,16,125,CURTIME(),NULL);

UPDATE bird_identification_tests
   SET id_end=CURTIME()
 WHERE test_id=1;

SELECT CONCAT(name_first,SPACE(1),name_last) AS 'Birdwatcher',
       common_name AS 'Bird',
       SEC_TO_TIME(TIME_TO_SEC(id_end)-TIME_TO_SEC(id_start)) AS 'Time Elapsed'
  FROM bird_identification_tests
  JOIN `humans` USING(human_id)
  JOIN rookery.birds USING(bird_id);

SELECT CONCAT(name_first,SPACE(1),name_last) AS 'Birdwatcher',
       COUNT(time_seen) AS 'Sightings Recorded'
  FROM `bird_sightings`
  JOIN `humans` USING(human_id)
 WHERE QUARTER(time_seen)=(QUARTER(CURDATE())-1)
       AND YEAR(time_seen)=(YEAR(CURDATE())-1)
 GROUP BY human_id
 LIMIT 5;

SELECT CONCAT(name_first,SPACE(1),name_last) AS 'Birdwatcher',
       COUNT(time_seen) AS 'Sightings Recorded'
  FROM `bird_sightings`
  JOIN `humans` USING(human_id)
 WHERE CONCAT(QUARTER(time_seen),YEAR(time_seen))=
       CONCAT(
           QUARTER(
               STR_TO_DATE(
                   PERIOD_ADD(
                       EXTRACT(YEAR_MONTH FROM CURDATE()),
                       -3
                   ),
                   '%Y%m'
               )
           ),
           YEAR(
               STR_TO_DATE(
                   PERIOD_ADD(
                       EXTRACT(YEAR_MONTH FROM CURDATE()),
                       -3
                   ),
                   '%Y%m'
               )
           )
       )
 GROUP BY human_id
 LIMIT 5;


SELECT CURDATE() AS 'Today',
       DATE_FORMAT(membership_expiration,'%M %e, %Y') AS 'Date Membership Expires',
       DATEDIFF(membership_expiration, CURDATE()) AS 'Date Until Expiration'
  FROM `humans`
 WHERE human_id=4;


CREATE TABLE `birding_events`(
    event_id INT AUTO_INCREMENT KEY,
    event_name VARCHAR(255),
    event_description TEXT,
    meeting_point VARCHAR(255),
    event_date DATE,
    start_time TIME
);

INSERT INTO `birding_events` VALUES
(NULL,'Sandpipers in San Diego',
"Birdwatching Outing in San Diego to look for Sandpipers, Curlews, Godwits, Snipes and other shore birds. Birders will walk the beaches and surrounding area in groups of six. A light lunch will be provided.",
"Hotel del Coronado, the deck near the entrance to the restaurant.",
'2017-07-04','09:00:00');

SELECT NOW(),event_datetime,
       DATEDIFF(DATE(event_datetime), DATE(NOW())) AS 'Days to Event',
       TIMEDIFF(TIME(event_datetime),TIME(NOW()))AS 'Time to Start'
  FROM birding_events;


SELECT NOW(),event_datetime,
       CONCAT(
       DATEDIFF(DATE(event_datetime), DATE(NOW())), ' Days, ',
       DATE_FORMAT(TIMEDIFF(TIME(event_datetime),TIME(NOW())), '%k hours, %i minutes')
       )AS 'Time to Event'
  FROM birding_events;

ALTER TABLE `birding_events`
  ADD COLUMN event_datetime DATETIME;

UPDATE `birding_events`
   SET event_datetime=CONCAT(event_date, SPACE(1), start_time);

SELECT event_date, start_time, event_datetime
  FROM `birding_events`;

SELECT NOW(),event_datetime,
       CONCAT(
       DATEDIFF(event_datetime, NOW()), ' Days, ',
       TIME_FORMAT(TIMEDIFF(TIME(event_datetime),CURTIME()), '%k hours, %i minutes')
       )AS 'Time to Event'
  FROM birding_events;


ALTER TABLE `birding_events`
  DROP COLUMN event_date,
  DROP COLUMN start_time;

--Q&A:

--1.
    SELECT  CONCAT(name_first,SPACE(1),name_last) AS 'Full Name',
            DATE_FORMAT(
                join_date,
                '%a., %b. %e, %Y'
            ) AS 'Date Membership Joins',
            DATE_FORMAT(membership_expiration,'%a., %b. %e, %Y') AS 'Date Membership Expires'
    FROM    humans
    WHERE   country_id='uk';
    
--2.
    SELECT  CONCAT(name_first,SPACE(1),name_last) AS 'Full Name',
            membership_expiration
            ,ADDDATE(ADDDATE(membership_expiration, INTERVAL 1 MONTH), INTERVAL 15 DAY)
    FROM    humans
    WHERE   membership_expiration > '2014-06-30';

    UPDATE  humans
    SET     membership_expiration = ADDDATE(ADDDATE(membership_expiration, INTERVAL 1 MONTH), INTERVAL 15 DAY)
    WHERE   membership_expiration > '2014-06-30';
    
    UPDATE  humans
    SET     membership_expiration = DATE_SUB(membership_expiration, INTERVAL 5 DAY)
    WHERE   membership_expiration > '2014-06-30';

--3.
    --INSERT INTO bird_identification_tests
    --VALUES(NULL,16,125,CURTIME(),NULL);

    --UPDATE bird_identification_tests
    --SET id_end=CURTIME()
    --WHERE test_id=1;

    SELECT  CONCAT(
                h.name_first
                ,SPACE(1)
                ,h.name_last
            ) AS 'Full Name',
            TIMEDIFF(id_end, id_start) AS 'Time Elapsed',
            TIME_FORMAT(TIMEDIFF(id_end, id_start), '%k hours, %i minutes, %S seconds') AS 'Time Elapsed 2'
    FROM bird_identification_tests t 
    JOIN humans h USING(human_id);

--4.
    SELECT  b.common_name AS 'Bird',
            TIMEDIFF(t.id_end, t.id_start) AS 'Time Elapsed'
    FROM    bird_identification_tests t 
    JOIN    rookery.birds b USING(bird_id);
    
    SELECT  b.common_name AS 'Bird',
            AVG(TIMEDIFF(t.id_end, t.id_start)) AS 'Avg. Time Elapsed'
    FROM    bird_identification_tests t 
    JOIN    rookery.birds b USING(bird_id)
    GROUP BY bird_id;
    
    SELECT  b.common_name AS 'Bird',
            TRIM(
                TRAILING '.0000' FROM AVG(TIMEDIFF(t.id_end, t.id_start))
            ) AS 'Avg. Time Elapsed 2'
    FROM    bird_identification_tests t 
    JOIN    rookery.birds b USING(bird_id)
    GROUP BY bird_id;

    SELECT  b.common_name AS 'Bird',
            LPAD(
                TRIM(
                    TRAILING '.0000' FROM AVG(TIMEDIFF(t.id_end, t.id_start))
                ),
                6,
                '0'
            ) AS 'Avg. Time Elapsed'
    FROM    bird_identification_tests t 
    JOIN    rookery.birds b USING(bird_id)
    GROUP BY bird_id;

    SELECT  b.common_name AS 'Bird',
            STR_TO_DATE(
                LPAD(
                    TRIM(
                        TRAILING '.0000' FROM AVG(TIMEDIFF(t.id_end, t.id_start))
                    ),
                    6,
                    '0'
                ),
                '%k%i%s'
            ) AS 'Avg. Time Elapsed'
    FROM    bird_identification_tests t 
    JOIN    rookery.birds b USING(bird_id)
    GROUP BY bird_id;
    
    SELECT  b.common_name AS 'Bird',
            STR_TO_DATE(
                LPAD(
                    TRIM(
                        TRAILING '.0000' FROM AVG(TIMEDIFF(t.id_end, t.id_start))
                    ),
                    6,
                    '0'
                ),
                '%k%i%S'
            ) AS 'Avg. Time Elapsed'
    FROM    bird_identification_tests t 
    JOIN    rookery.birds b USING(bird_id)
    GROUP BY bird_id;


    --??
    SELECT  b.common_name AS 'Bird',t.id_end, t.id_start,
            TIMEDIFF(t.id_end, t.id_start) AS 'Time Elapsed'
    FROM    bird_identification_tests t 
    JOIN    rookery.birds b USING(bird_id)
    WHERE   b.common_name='Crested Shelduck';

    SELECT  b.common_name AS 'Bird',
            AVG(TIMEDIFF(t.id_end, t.id_start)) AS 'Avg. Time Elapsed'
    FROM    bird_identification_tests t 
    JOIN    rookery.birds b USING(bird_id)
    WHERE   b.common_name='Crested Shelduck'
    GROUP BY bird_id;
   
    
    SELECT  b.common_name AS 'Bird',t.id_end, t.id_start,
            TIMEDIFF(t.id_end, t.id_start) AS 'Time Elapsed'
    FROM    bird_identification_tests t 
    JOIN    rookery.birds b USING(bird_id)
    WHERE   b.common_name='Indian Pond-Heron';

    SELECT  b.common_name AS 'Bird',
            AVG(TIMEDIFF(t.id_end, t.id_start)) AS 'Avg. Time Elapsed'
    FROM    bird_identification_tests t 
    JOIN    rookery.birds b USING(bird_id)
    WHERE   b.common_name='Indian Pond-Heron'
    GROUP BY bird_id;



--5.
    SELECT  b.common_name AS 'Bird',
            STR_TO_DATE(
                LPAD(
                    TRIM(
                        TRAILING '.0000' FROM AVG(TIMEDIFF(t.id_end, t.id_start))
                    ),
                    6,
                    '0'
                ),
                '%k%i%S'
            ) AS 'Avg. Time Elapsed'
    FROM    bird_identification_tests t 
    JOIN    rookery.birds b USING(bird_id)
    GROUP BY bird_id;
    
    SELECT  b.common_name AS 'Bird',
            DATE_FORMAT(
                STR_TO_DATE(
                    LPAD(
                        TRIM(TRAILING '.0000' FROM AVG(TIMEDIFF(t.id_end, t.id_start))),
                        6,'0'
                    ),
                    '%k%i%S'
                ),
                '%k hours %i minute(s), %s seconds'
            ) AS 'Avg. Time Elapsed'
    FROM    bird_identification_tests t 
    JOIN    rookery.birds b USING(bird_id)
    GROUP BY bird_id;

    
    SELECT  b.common_name AS 'Bird',
            DATE_FORMAT(
                STR_TO_DATE(
                    LPAD(
                        TRIM(TRAILING '.0000' FROM AVG(TIMEDIFF(t.id_end, t.id_start))),
                        6,'0'
                    ),
                    '%k%i%S'
                ),
                CONCAT(
                    IF(HOUR(AVG(TIMEDIFF(t.id_end, t.id_start)))>0,
                        CONCAT(
                            '%k',
                            IF(HOUR(AVG(TIMEDIFF(t.id_end, t.id_start)))>1,
                                ' hours, ',' hour, '
                            )
                        ),
                        ''
                    ),
                    '%i',
                    IF(MINUTE(AVG(TIMEDIFF(t.id_end, t.id_start)))>1,' minutes, ',' minute, '),
                    '%s',
                    IF(SECOND(AVG(TIMEDIFF(t.id_end, t.id_start)))>1,' seconds',' second')
                )
            ) AS 'Avg. Time Elapsed'
    FROM    bird_identification_tests t 
    JOIN    rookery.birds b USING(bird_id)
    GROUP BY bird_id;