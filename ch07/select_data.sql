
USE rookery;

SELECT * FROM birds;
SELECT COUNT(*) FROM birds;
SELECT bird_id, scientific_name, common_name FROM birds;
SELECT common_name, scientific_name FROM birds
 WHERE family_id=103 LIMIT 3;
SELECT common_name, scientific_name FROM birds
 WHERE family_id=103 
 ORDER BY common_name LIMIT 3;

--SELECT family_id,scientific_name,order_id FROM bird_families WHERE scientific_name LIKE 'Sturnidae%';
--UPDATE bird_families SET order_id=128,scientific_name='Sturnidae'  WHERE family_id=105;

SELECT * FROM bird_families
 WHERE scientific_name IN(
                            'Charadriidae'
                            ,'Charadriidae (Plovers and Lapwings)'
                            ,'Haematopodidae (Oystercatchers)'
                            ,'Recurvirostridae (Stilts and Avocets)'
                            ,'Scolopacidae (Sandpipers and Allies)'
                        );

SELECT common_name, scientific_name, family_id
  FROM birds
 WHERE family_id IN(103,168,167,165,173)
 ORDER BY common_name
 LIMIT 3;

SELECT common_name, scientific_name, family_id
  FROM birds
 WHERE family_id IN(103,168,167,165,173)
       AND common_name!=''
 ORDER BY common_name
 LIMIT 3,2;

SELECT  b.common_name AS 'Bird',
        f.scientific_name AS 'Family'
  FROM  birds b,
        bird_families f 
 WHERE  b.family_id=f.family_id
        AND order_id=102
        AND common_name!=''
 ORDER  BY common_name LIMIT 10; 

SELECT b.common_name AS 'Bird',
        f.scientific_name AS 'Family'
  FROM  birds b,
        bird_families f,
        bird_orders o 
 WHERE  b.family_id=f.family_id
        AND f.order_id = o.order_id
        AND b.common_name LIKE 'Least%'
 ORDER  BY o.scientific_name, f.scientific_name, b.common_name
 LIMIT  10; 

SELECT common_name AS 'Birds Great And Small'
  FROM birds
 WHERE common_name REGEXP 'Great|Least'
 ORDER BY family_id LIMIT 10;

SELECT common_name AS 'Birds Great And Small'
  FROM birds
 WHERE common_name REGEXP 'Great|Least'
       AND common_name NOT REGEXP 'Greater'
 ORDER BY family_id LIMIT 10;

SELECT common_name AS 'Hawks'
  FROM birds
 WHERE common_name REGEXP BINARY 'Hawk'
       AND common_name NOT REGEXP 'Hawk-Owl'
 ORDER BY family_id LIMIT 10;

SHOW CREATE DATABASE rookery \G
SHOW FULL COLUMNS
FROM birds LIKE 'common_name' \G

--REGEXP: please try traditional repression
--successfully
SELECT common_name AS 'Hawks'
  FROM birds
 WHERE common_name REGEXP '[[:space:]]Hawk'
       AND common_name NOT REGEXP 'Hawk-Owl|Hawk Owl'
 ORDER BY family_id LIMIT 10;
 --error
SELECT common_name AS 'Hawks'
  FROM birds
 WHERE common_name REGEXP '[[.hyphen.]]Hawk'
       AND common_name NOT REGEXP 'Hawk-Owl|Hawk Owl'
 ORDER BY family_id LIMIT 10;

SELECT * FROM birds;
SELECT COUNT(*) FROM birds;

SELECT family_id,scientific_name,order_id FROM bird_families WHERE scientific_name LIKE 'Pelecanidae%';
SELECT f.scientific_name AS 'Family',
       COUNT(*) AS 'Number of Birds'
  FROM birds b, bird_families f
 WHERE b.family_id=f.family_id
       AND f.scientific_name='Pelecanidae (Pelicans)';

SELECT * FROM bird_orders WHERE order_id=107;
SELECT o.scientific_name AS 'Order',
       f.scientific_name AS 'Family',
       COUNT(*) AS 'Number of Birds'
  FROM birds b, bird_families f, bird_orders o 
 WHERE b.family_id=f.family_id
       AND f.order_id = o.order_id
       AND o.scientific_name='Pelecaniformes';

SELECT o.scientific_name AS 'Order',
       f.scientific_name AS 'Family',
       COUNT(*) AS 'Number of Birds'
  FROM birds b, bird_families f, bird_orders o 
 WHERE b.family_id=f.family_id
       AND f.order_id = o.order_id
       AND o.scientific_name='Pelecaniformes'
 GROUP BY Family;

 Q&A:

 --1.
      SELECT  common_name AS 'Common Name'
        FROM  birds b 
       WHERE  b.common_name LIKE '%Pigeon%';
       
      SELECT  common_name AS 'Common Name'
        FROM  birds b 
       WHERE  b.common_name LIKE '%Pigeon%'
       LIMIT  10;
       
      SELECT  common_name AS 'Common Name'
        FROM  birds b 
       WHERE  b.common_name LIKE '%Pigeon%'
       LIMIT  10, 10;

--2.
      SELECT o.scientific_name AS 'Order', 
             o.brief_description AS 'Types of Birds in Order'
        FROM bird_orders o;

      SELECT COUNT(0)
        FROM birds b
       WHERE b.common_name IS NULL ;
      SELECT COUNT(0)
        FROM birds b
       WHERE b.common_name ='' ;

      SELECT b.common_name AS 'Common Name of Bird',
             b.scientific_name AS 'Scientific Name of Bird'
        FROM birds b
       WHERE b.common_name IS NOT NULL 
             AND b.common_name !=''
       ORDER BY b.common_name
       LIMIT 25;
       
      SELECT b.common_name AS 'Common Name of Bird',
             b.scientific_name AS 'Scientific Name of Bird',
             f.scientific_name AS 'Family',
             o.scientific_name AS 'Order', 
             o.brief_description AS 'Types of Birds in Order'
        FROM birds b, 
             bird_families f,
             bird_orders o
       WHERE (b.common_name IS NOT NULL 
             AND b.common_name !='')
             AND b.family_id=f.family_id
             AND f.order_id=o.order_id
       ORDER BY b.common_name
       LIMIT 25;

--3.
      SELECT b.common_name AS 'Type of Columnbidae',
             b.scientific_name
        FROM birds b
       WHERE b.common_name REGEXP 'Pigeon|Dove';