
USE rookery;

SELECT COUNT(*) FROM birds;

SELECT COUNT(common_name) FROM birds;

UPDATE  `birds`
SET     common_name=NULL
WHERE   common_name='';

SELECT COUNT(common_name) FROM birds;
SELECT COUNT(common_name) FROM birds WHERE common_name IS NULL;
SELECT COUNT(*) FROM birds WHERE common_name IS NULL;
SELECT COUNT(*) FROM birds WHERE common_name IS NOT NULL;
SELECT COUNT(common_name) FROM birds GROUP BY family_id;

SELECT
        f.scientific_name AS 'Family',
        COUNT(*) AS 'Number of Species' 
FROM    birds b
JOIN    `bird_families` f USING(family_id)
GROUP BY b.family_id
ORDER BY Family;


SELECT
        f.scientific_name AS 'Family',
        COUNT(*) AS 'Number of Species' 
FROM    birds b
LEFT JOIN    `bird_families` f USING(family_id)
GROUP BY b.family_id
ORDER BY Family;

SELECT
        f.scientific_name AS 'Family',
        COUNT(*) AS 'Number of Species' 
FROM    birds b
LEFT JOIN    `bird_families` f USING(family_id)
GROUP BY Family
WITH ROLLUP;

SELECT  IFNULL(o.scientific_name,'') AS 'Order',
        IFNULL(f.scientific_name,'Total:') AS 'Family',
        COUNT(*) AS 'Number of Species' 
FROM    birds b
JOIN    `bird_families` f USING(family_id)
JOIN    `bird_orders` o USING(order_id)
GROUP BY o.scientific_name,f.scientific_name
WITH ROLLUP;

USE birdwatchers;

SELECT  common_name AS 'Bird',
        TIME_TO_SEC(TIMEDIFF(id_end,id_start)) AS 'Seconds to Identify'
FROM    bird_identification_tests i
JOIN    humans h USING(human_id)
JOIN    rookery.`birds` USING(bird_id)
WHERE   h.name_first='Ricky' 
        AND h.name_last='Adams';

SELECT  CONCAT(h.name_first,SPACE(1),h.name_last) AS 'Bird Watcher',
        SUM(TIME_TO_SEC(TIMEDIFF(id_end,id_start))) AS 'Total Seconds to Identify'
FROM    bird_identification_tests i
JOIN    humans h USING(human_id)
JOIN    rookery.`birds` USING(bird_id)
WHERE   h.name_first='Ricky' 
        AND h.name_last='Adams';

SELECT  CONCAT(h.name_first,SPACE(1),h.name_last) AS 'Bird Watcher',
        AVG(TIME_TO_SEC(TIMEDIFF(id_end,id_start))) AS 'Avg. Seconds per Identify'
FROM    bird_identification_tests i
JOIN    humans h USING(human_id)
JOIN    rookery.`birds` USING(bird_id)
WHERE   h.name_first='Ricky' 
        AND h.name_last='Adams';

SELECT  CONCAT(h.name_first,SPACE(1),h.name_last) AS 'BirdWatcher',
        COUNT(*) AS 'Birds',
        TIME_FORMAT( SEC_TO_TIME(AVG(TIME_TO_SEC(TIMEDIFF(i.id_end,i.id_start)))), '%i:%s') AS 'AvgTime'
FROM    bird_identification_tests i
JOIN    humans h USING(human_id)
JOIN    rookery.`birds` b USING(bird_id)
GROUP BY i.human_id
LIMIT   3;

SELECT BirdWatcher,Birds,AvgTime
FROM(
SELECT  CONCAT(h.name_first,SPACE(1),h.name_last) AS 'BirdWatcher',
        COUNT(*) AS 'Birds',
        TIME_FORMAT( SEC_TO_TIME(AVG(TIME_TO_SEC(TIMEDIFF(i.id_end,i.id_start)))), '%i:%s') AS 'AvgTime'
FROM    bird_identification_tests i
JOIN    humans h USING(human_id)
JOIN    rookery.`birds` b USING(bird_id)
GROUP BY i.human_id
) AS avg_time_tab
ORDER BY AvgTime;

SELECT  MIN(AvgTime) AS 'Minimum AvgTime',
        MAX(AvgTime) AS 'Minimum AvgTime'
FROM    humans
JOIN 
(
SELECT  CONCAT(h.name_first,SPACE(1),h.name_last) AS 'BirdWatcher',
        COUNT(*) AS 'Birds',
        TIME_FORMAT( SEC_TO_TIME(AVG(TIME_TO_SEC(TIMEDIFF(i.id_end,i.id_start)))), '%i:%s') AS 'AvgTime'
FROM    bird_identification_tests i
JOIN    humans h USING(human_id)
JOIN    rookery.`birds` b USING(bird_id)
GROUP BY i.human_id
) AS avg_time_tab;

SELECT  CONCAT(h.name_first,SPACE(1),h.name_last) AS 'BirdWatcher',
        TIME_FORMAT(SEC_TO_TIME(
            MIN(TIME_TO_SEC(TIMEDIFF(id_end,id_start)))
        ),'%i:%s') AS 'Minimum Time',
        TIME_FORMAT(SEC_TO_TIME(
            MAX(TIME_TO_SEC(TIMEDIFF(id_end,id_start)))
        ),'%i:%s') AS 'Maximum Time'
FROM    bird_identification_tests i
JOIN    humans h USING(human_id)
JOIN    rookery.`birds` b USING(bird_id)
GROUP BY BirdWatcher;


SELECT  common_name as 'Bird',
        MAX(SUBSTRING(location_gps,1,11))AS 'Furthest North',
        MIN(SUBSTRING(location_gps,1,11))AS 'Furthest South'
FROM    bird_sightings s 
JOIN    rookery.birds USING(bird_id)
WHERE   location_gps IS NOT NULL
GROUP BY bird_id LIMIT 3;  


--GROUP_CONCAT()
SELECT  o.scientific_name AS 'Bird Order',
        GROUP_CONCAT(f.scientific_name) AS 'Bird Families in Order'
FROM `bird_families` f 
JOIN `bird_orders` o USING(order_id)
WHERE o.scientific_name ='Charadriiformes'
GROUP BY order_id \G

SELECT  IFNULL(COLUMN_GET(choices,answer AS CHAR),'Total') AS 'Birding Site',
        COUNT(*) AS 'Votes'
FROM    survey_answers
JOIN    survey_questions USING(question_id)
WHERE   survey_id=1
        AND question_id=1
GROUP BY answer WITH ROLLUP;



SET @fav_site_total=(
    SELECT  COUNT(*)
    FROM    survey_answers
    JOIN    survey_questions USING(question_id)
    WHERE   survey_id=1
            AND question_id=1
);
SELECT @fav_site_total;


SELECT  COLUMN_GET(choices,answer AS CHAR) AS 'Birding Site',
        COUNT(*) AS 'Votes',
        (COUNT(*)/@fav_site_total) AS 'Percent'
FROM    survey_answers
JOIN    survey_questions USING(question_id)
WHERE   survey_id=1
        AND question_id=1
GROUP BY answer;

SELECT  COLUMN_GET(choices,answer AS CHAR) AS 'Birding Site',
        COUNT(*) AS 'Votes',
        CONCAT(ROUND((COUNT(*)/@fav_site_total)*100),'%') AS 'Percent'
FROM    survey_answers
JOIN    survey_questions USING(question_id)
WHERE   survey_id=1
        AND question_id=1
GROUP BY answer;

SELECT  COLUMN_GET(choices,answer AS CHAR) AS 'Birding Site',
        COUNT(*) AS 'Votes',
        CONCAT(ROUND((COUNT(*)/@fav_site_total)*100,2),'%') AS 'Percent'
FROM    survey_answers
JOIN    survey_questions USING(question_id)
WHERE   survey_id=1
        AND question_id=1
GROUP BY answer;

SELECT  COLUMN_GET(choices,answer AS CHAR) AS 'Birding Site',
        COUNT(*) AS 'Votes',
        CONCAT(FLOOR((COUNT(*)/@fav_site_total)*100),'%') AS 'Percent'
FROM    survey_answers
JOIN    survey_questions USING(question_id)
WHERE   survey_id=1
        AND question_id=1
GROUP BY answer;

SELECT  COLUMN_GET(choices,answer AS CHAR) AS 'Birding Site',
        COUNT(*) AS 'Votes',
        CONCAT(CEILING((COUNT(*)/@fav_site_total)*100),'%') AS 'Percent'
FROM    survey_answers
JOIN    survey_questions USING(question_id)
WHERE   survey_id=1
        AND question_id=1
GROUP BY answer;

SELECT  COLUMN_GET(choices,answer AS CHAR) AS 'Birding Site',
        COUNT(*) AS 'Votes',
        CONCAT(TRUNCATE((COUNT(*)/@fav_site_total)*100,1),'%') AS 'Percent'
FROM    survey_answers
JOIN    survey_questions USING(question_id)
WHERE   survey_id=1
        AND question_id=1
GROUP BY answer;

SELECT  SUM(
            TIME_TO_SEC(TIMEDIFF(id_start,id_end))
        ) AS 'Total Seconds for All',
        ABS(SUM(
            TIME_TO_SEC(TIMEDIFF(id_start,id_end))
        )) AS 'Absolute Total Seconds for All'
FROM    bird_identification_tests;


SET @min_avg_time=(
    SELECT MIN(avg_time)
    FROM(
        SELECT AVG(
            TIME_TO_SEC(TIMEDIFF(id_end,id_start))
        )AS 'avg_time'
        FROM bird_identification_tests
        GROUP BY human_id
    )AS average_times
);

SELECT @min_avg_time;

SELECT  CONCAT(name_first,SPACE(1),name_last) AS 'Birdwatcher',
        common_name AS 'Bird',
        ROUND(@min_avg_time - TIME_TO_SEC(TIMEDIFF(id_end,id_start))) AS 'Seconds Less than Average'
FROM    bird_identification_tests
JOIN    humans USING(human_id)
JOIN    rookery.birds USING(bird_id)
WHERE   SIGN(TIME_TO_SEC(TIMEDIFF(id_end,id_start)-@min_avg_time))=-1;


--Q&A

USE rookery;
--1.
SELECT  COUNT(common_name)
FROM    birds 
WHERE   common_name REGEXP 'Great';
SELECT  COUNT(common_name)
FROM    birds 
WHERE   common_name LIKE '%Great%';

SELECT  COUNT(common_name)
FROM    birds 
WHERE   common_name REGEXP 'Least';
SELECT  COUNT(common_name)
FROM    birds 
WHERE   common_name LIKE '%Least%';

USE rookery;


SELECT  COUNT(common_name) AS 'Total',
        'Great' AS 'CommonName'
FROM    birds 
WHERE   common_name LIKE '%Great%'
UNION
SELECT  COUNT(common_name) AS 'Total',
        'Least' AS 'CommonName'
FROM    birds 
WHERE   common_name LIKE '%Least%'
;

--????????????

--3.
SELECT Family,Number_of_Species AS 'Number of Species',CONCAT(ROUND((Number_of_Species/Total)*100,1),'%') AS 'Percent'
FROM(
        SELECT  f.scientific_name AS Family,
                COUNT(*) AS Number_of_Species,
                1 AS 'JOIN_ID'
        FROM    birds b
        JOIN    bird_families f USING(family_id)
        GROUP BY f.scientific_name
) AS family_count 
JOIN(
        SELECT  COUNT(*) AS Total,
                1 AS JOIN_ID
        FROM    birds b
)AS birds_count USING(JOIN_ID);
            

--4.

SET @total_birds = (
        SELECT COUNT(*) FROM birds
);

SELECT  f.scientific_name AS Family,
        COUNT(*) AS 'Number of Species',
        CONCAT(ROUND((COUNT(*)/@total_birds)*100,1),'%') AS 'Percent'
FROM    birds b
JOIN    bird_families f USING(family_id)
GROUP BY f.scientific_name;

--5.
SELECT  CONCAT(name_first,SPACE(1),name_last) AS 'Full Name',
        membership_expiration AS 'Expiration Date',SIGN(DATEDIFF(membership_expiration,'2014-01-01')) AS 'SIGN',
        ((YEAR(membership_expiration)-YEAR('2014-01-01'))*12 + (MONTH(membership_expiration)-MONTH('2014-01-01'))) AS 'Months to Expiration'
FROM    birdwatchers.humans
WHERE   membership_expiration IS NOT NULL
        AND SIGN(DATEDIFF(membership_expiration,'2014-01-01'))=1;

--6.
SELECT  CONCAT(name_first,SPACE(1),name_last,IF(SIGN(DATEDIFF(membership_expiration,'2014-01-01'))=1,'',' - expired')) AS 'Full Name',
        membership_expiration AS 'Expiration Date',
        ABS(((YEAR(membership_expiration)-YEAR('2014-01-01'))*12 + (MONTH(membership_expiration)-MONTH('2014-01-01')))) AS 'Months to Expiration',
        SIGN(DATEDIFF(membership_expiration,'2014-01-01')) AS 'SIGN'
FROM    birdwatchers.humans
WHERE   membership_expiration IS NOT NULL;

--7.
SELECT  MIN(MonthstoExpiration) AS 'Minimum Months',
        MAX(MonthstoExpiration) AS 'Maximum Months',
        AVG(MonthstoExpiration) AS 'Avg. Months to Expiration',
        SIGN
FROM(
SELECT  membership_expiration AS 'ExpirationDate',
        ABS(((YEAR(membership_expiration)-YEAR('2014-01-01'))*12 + (MONTH(membership_expiration)-MONTH('2014-01-01')))) AS 'MonthstoExpiration',
        SIGN(DATEDIFF(membership_expiration,'2014-01-01')) AS 'SIGN'
FROM    birdwatchers.humans
WHERE   membership_expiration IS NOT NULL
) AS T 
GROUP BY SIGN
;
