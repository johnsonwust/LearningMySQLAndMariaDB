
USE rookery;

SELECT 'Pelecanidae (Pelicans)' As 'Family',
       COUNT(*) AS 'Species'
  FROM birds b, bird_families f
 WHERE b.family_id=f.family_id
       AND f.scientific_name='Pelecanidae (Pelicans)' 
UNION
SELECT 'Ardeidae (Herons, Egrets, and Bitterns)' As 'Family',
       COUNT(*) AS 'Species'
  FROM birds b, bird_families f
 WHERE b.family_id=f.family_id
       AND f.scientific_name='Ardeidae (Herons, Egrets, and Bitterns)' ;

SELECT f.scientific_name As 'Family',
       COUNT(*) AS 'Species'
  FROM birds b, bird_families f, bird_orders o
 WHERE b.family_id=f.family_id
       AND f.order_id = o.order_id
       AND o.scientific_name='Pelecaniformes' 
 GROUP BY f.family_id
UNION
SELECT f.scientific_name As 'Family',
       COUNT(*) AS 'Species'
  FROM birds b, bird_families f, bird_orders o
 WHERE b.family_id=f.family_id
       AND f.order_id = o.order_id
       AND o.scientific_name='Anseriformes' 
 GROUP BY f.family_id;


SELECT * FROM
(
    SELECT f.scientific_name As 'Family',
           COUNT(*) AS 'Species',
           o.scientific_name AS 'Order'
      FROM birds b, bird_families f, bird_orders o
     WHERE b.family_id=f.family_id
           AND f.order_id = o.order_id
           AND o.scientific_name='Pelecaniformes' 
     GROUP BY f.family_id
    UNION
    SELECT f.scientific_name As 'Family',
           COUNT(*) AS 'Species',
           o.scientific_name AS 'Order'
      FROM birds b, bird_families f, bird_orders o
     WHERE b.family_id=f.family_id
           AND f.order_id = o.order_id
           AND o.scientific_name='Anseriformes' 
     GROUP BY f.family_id
) AS derived_1
ORDER BY Family;

SELECT book_id, title, status_name
  FROM books JOIN status_names
 WHERE status=status_id;

SELECT book_id, title, status_name
  FROM books JOIN status_names
    ON(status=status_id);

----If change status to be status_id
--SELECT book_id, title, status_name
--  FROM books JOIN status_names
-- USING (status_id);

SELECT common_name, conservation_state
  FROM birds b
  JOIN conservation_status s
    ON (b.conservation_status_id=s.conservation_status_id)
 WHERE conservation_category='Threatened'
       AND common_name LIKE '%Goose%';

SELECT common_name, conservation_state
  FROM birds b
  JOIN conservation_status s
 USING (conservation_status_id)
 WHERE conservation_category='Threatened'
       AND common_name LIKE '%Goose%';

SELECT b.common_name AS 'Bird', 
       f.scientific_name AS 'Family',
       s.conservation_state AS 'Status'
  FROM birds b
  JOIN conservation_status s USING(conservation_status_id)
  JOIN bird_families f USING(family_id)
 WHERE s.conservation_category='Threatened'
       AND b.common_name REGEXP 'Goose|Duck'
 ORDER BY Status, Bird;

SELECT b.common_name AS 'Bird', 
       f.scientific_name AS 'Family',
       s.conservation_state AS 'Status'
  FROM birds b,conservation_status s,bird_families f
 WHERE b.conservation_status_id=s.conservation_status_id
       AND b.family_id=f.family_id
       AND s.conservation_category='Threatened'
       AND b.common_name REGEXP 'Goose|Duck'
 ORDER BY Status, Bird;



SELECT b.common_name AS 'Bird From Anatidae', 
       s.conservation_state AS 'Conservation Status'
  FROM birds b
  JOIN conservation_status s USING(conservation_status_id)
  JOIN bird_families f USING(family_id)
 WHERE s.conservation_category='Threatened'
       AND f.scientific_name='Anatidae'
 ORDER BY s.conservation_status_id DESC, b.common_name ASC;


SELECT CONCAT(h.name_first, '', h.name_last) AS 'Birder',
       b.common_name AS 'Bird',
       s.location_gps AS 'Location of Sighting'
  FROM birdwatchers.humans h 
  JOIN birdwatchers.bird_sightings s USING(human_id)
  JOIN rookery.birds b USING(bird_id)
  JOIN rookery.bird_families f USING(family_id)
 WHERE h.country_id='ru'
       AND f.scientific_name='Scolopacidae (Sandpipers and Allies)'
 ORDER BY Birder;


SELECT b.common_name AS 'Bird', s.conservation_state AS 'Status'
  FROM birds b
  LEFT JOIN conservation_status s USING (conservation_status_id)
 WHERE  common_name LIKE '%Egret%'
 ORDER BY Status, Bird;


SELECT b.common_name, 
       s.conservation_state
  FROM birds b
  JOIN conservation_status s USING(conservation_status_id)
  JOIN bird_families f USING(family_id)
 WHERE f.scientific_name='Ardeidae';


SELECT * FROM conservation_status;

INSERT INTO conservation_status(conservation_state)
VALUES ('Unknown');

SELECT LAST_INSERT_ID();

UPDATE birds b
  LEFT JOIN conservation_status s USING(conservation_status_id)
  JOIN bird_families f USING(family_id)
   SET b.conservation_status_id=9
 WHERE f.scientific_name='Ardeidae'
       AND s.conservation_status_id IS NULL;

DELETE FROM humans h, prize_winners w 
 USING h JOIN w 
 WHERE h.name_first ='Elena'
       AND h.name_last='Bokova'
       AND h.email_address LIKE '%@yahoo.com'
       AND h.human_id=w.human_id;

DELETE FROM humans h, prize_winners w 
 USING h LEFT JOIN w ON h.human_id=w.human_id
 WHERE h.name_first ='Elena'
       AND h.name_last='Bokova'
       AND h.email_address LIKE '%@yahoo.com';

DELETE FROM humans h, prize_winners w 
 USING h RIGHT JOIN w ON h.human_id=w.human_id
 WHERE h.human_id IS NULL;

SELECT scientific_name AS Family
  FROM bird_families
 WHERE order_id =
       (
           SELECT order_id
             FROM bird_orders
            WHERE scientific_name ='Galliformes'
       );

UPDATE humans
   SET membership_type='premium',
       membership_expiration=DATE_ADD(IFNULL(membership_expiration,CURDATE()), INTERVAL 1 YEAR)
 WHERE human_id=
       (
            SELECT  human_id
              FROM 
                    (
                      SELECT human_id,
                             COUNT(*) AS sightings,
                             join_date
                        FROM birdwatchers.bird_sightings
                        JOIN birdwatchers.humans USING(human_id)
                        JOIN rookery.birds USING(bird_id)
                        JOIN rookery.bird_families USING(familiy_id)
                       WHERE country_id='ru'
                             AND bird_families.scientific_name='Scolopacidae'
                       GROUP BY human_id
                    )AS derived_1
             WHERE sightings>5
             ORDER BY join_date DESC
             LIMIT 1
       );



SELECT * FROM
(
    SELECT b.common_name AS 'Bird',
           f.scientific_name AS 'Family',
           o.scientific_name AS 'Order'
      FROM birds b 
      JOIN bird_families f USING(family_id)
      JOIN bird_orders o USING(order_id)
     WHERE common_name !=''
           AND f.scientific_name IN 
           (
               SELECT DISTINCT fi.scientific_name AS 'Family'
                 FROM bird_families fi
                 JOIN bird_orders oi USING(order_id)
                WHERE oi.scientific_name='Galliformes'
                ORDER BY Family
           )
     ORDER BY RAND()
)AS derived_1
GROUP BY (Family);


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
          scientific_name=scientific_name
      )
);


SELECT family AS 'Bird Family',
       COUNT(*) AS 'Number of Birds'
  FROM 
  (
      SELECT f.scientific_name AS family
        FROM birds b
        JOIN bird_families f USING(family_id)
       WHERE f.scientific_name IN 
       (
           'Pelecanidae (Pelicans)',
           'Ardeidae (Herons, Egrets, and Bitterns)'
       )
  )AS derived_1
 GROUP BY family;


--Q&A:


--1.
    SELECT s.human_id AS 'Birder',
           COUNT(*) AS 'Entries'
      FROM birdwatchers.bird_sightings s
      JOIN rookery.birds b USING(bird_id)
      JOIN rookery.bird_families f USING(family_id)
      JOIN rookery.bird_orders o USING(order_id)
     WHERE o.scientific_name='Galliformes'
     GROUP BY s.human_id;

    SELECT CONCAT(h.name_first,' ', h.name_last) AS 'Birder',
           COUNT(*) AS 'Points'
      FROM birdwatchers.bird_sightings s 
      JOIN birdwatchers.humans h USING(human_id)
      JOIN rookery.birds b USING(bird_id)
      JOIN rookery.bird_families f USING(family_id)
      JOIN rookery.bird_orders o USING(order_id)
     WHERE o.scientific_name='Galliformes'
     GROUP BY s.human_id;

--2.
    SELECT CONCAT(h.name_first, ' ', h.name_last) AS 'Birder',
           family
      FROM
      (
          SELECT DISTINCT f.family_id AS family,
                 s.human_id AS human
            FROM birdwatchers.bird_sightings s 
            JOIN rookery.birds b USING(bird_id)
            JOIN rookery.bird_families f USING(family_id)
            WHERE f.family_id IN 
            (
                SELECT fi.family_id
                FROM rookery.bird_families fi USING(family_id)
                JOIN rookery.bird_orders oi USING(order_id)
                WHERE oi.scientific_name='Galliformes'
            )
      )
      JOIN birdwatchers.humans h USING(human_id)
      GROUP BY h.human_id;

--3.

SELECT Birder,Points
FROM
(
    SELECT CONCAT(h.name_first, ' ', h.name_last) AS 'Birder',
           COUNT(*) AS 'Points'
      FROM
      (
          SELECT DISTINCT f.family_id AS family,
                 s.human_id AS human
            FROM birdwatchers.bird_sightings s 
            JOIN rookery.birds b USING(bird_id)
            JOIN rookery.bird_families f USING(family_id)
            WHERE f.family_id IN 
            (
                SELECT fi.family_id
                FROM rookery.bird_families fi USING(family_id)
                JOIN rookery.bird_orders oi USING(order_id)
                WHERE oi.scientific_name='Galliformes'
            )
      )
      JOIN birdwatchers.humans h USING(human_id)
      GROUP BY h.human_id
)
WHERE Points > 5;