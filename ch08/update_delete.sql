
USE birdwatchers;

SELECT human_id, name_first, name_last
  FROM humans
 WHERE name_first='Rusty'
       AND name_last='Osborne';

UPDATE humans
   SET name_last='Johnson'
 WHERE human_id=3;

SELECT human_id, name_first, name_last
  FROM humans
 WHERE human_id=3;

SELECT * 
  FROM humans
 WHERE human_id IN(24,32);

UPDATE humans
   SET formal_title='Ms.'
 WHERE human_id IN(24,32);

SHOW FULL COLUMNS 
FROM humans
LIKE 'formal_title' \G


UPDATE humans
   SET formal_title='Ms.'
 WHERE formal_title IN('Miss','Mrs.');

ALTER TABLE humans
CHANGE COLUMN formal_title formal_title ENUM('Mr.','Ms.');

SHOW WARNINGS \G

ALTER TABLE humans
CHANGE COLUMN formal_title formal_title ENUM('Mr.','Ms.','Mr','Ms');

UPDATE humans
   SET formal_title=SUBSTRING(formal_title,1,2);

ALTER TABLE humans
CHANGE COLUMN formal_title formal_title ENUM('Mr','Ms');

CREATE TABLE prize_winners
(
    winner_id INT AUTO_INCREMENT PRIMARY KEY,
    human_id INT,
    winner_date DATE,
    prize_chosen VARCHAR(255),
    prize_sent DATE
);

INSERT INTO prize_winners (human_id)
 SELECT human_id FROM humans;

UPDATE prize_winners
   SET winner_date=CURDATE()
 WHERE winner_date IS NULL
 ORDER BY RAND()
 LIMIT 2;

SHOW WARNING \G


UPDATE prize_winners w, humans h
   SET w.winner_date=NULL,
       w.prize_chosen=NULL,
       w.prize_sent=NULL
 WHERE h.country_id='uk'
       AND w.human_id=h.human_id;

SELECT * 
  FROM prize_winners w
 WHERE w.winner_date IS NULL
       AND w.human_id IN 
       (
           SELECT h.human_id 
             FROM humans h
            WHERE h.country_id='uk'
            ORDER BY RAND()
       )
 LIMIT 2;

UPDATE prize_winners w
   SET w.winner_date=CURDATE()
 WHERE w.winner_date IS NULL
       AND w.human_id IN 
       (
           SELECT h.human_id 
             FROM humans h
            WHERE h.country_id='uk'
            ORDER BY RAND()
       )
 LIMIT 2;


ALTER TABLE humans
  ADD COLUMN better_birders_site TINYINT DEFAULT 0;

INSERT INTO humans
(formal_title, name_first, name_last, email_address, better_birders_site)
VALUES ('Mr', 'Barry', 'Pilson', 'barry@gomail.com', 1),
       ('Ms', 'Lexi', 'Hollar', 'alexandra@mysqlresources.com', 1),
       ('Mr', 'Ricky', 'Adams', 'ricky@gomail.com', 1)
ON DUPLICATE KEY
UPDATE better_birders_site=2;

INSERT INTO prize_winners (human_id)
SELECT human_id FROM humans WHERE better_birders_site=1;

ALTER TABLE humans
ADD COLUMN possible_duplicate TINYINT DEFAULT 0;

CREATE TEMPORARY TABLE possible_duplicates
(name_1 varchar(25), name_2 varchar(25));

INSERT INTO possible_duplicates
SELECT name_first, name_last
  FROM 
  (
      SELECT name_first, name_last
        FROM humans
       GROUP BY name_first, name_last
  ) AS derived_table
 WHERE nbr_entries>1;

UPDATE humans, possible_duplicates
   SET possible_duplicate=1
 WHERE name_first=name_1
       AND name_last=name_2;



DELETE FROM humans
 WHERE name_first='Elena'
       AND name_last='Bokova'
       AND email_address LIKE '%yahoo.com%';

DELETE FROM humans h, prize_winners w
 USING h JOIN w
 WHERE h.name_first='Elena'
       AND h.name_last='Bokova'
       AND h.email_address LIKE '%yahoo.com%'
       AND h.human_id=w.human_id;


--Q&A:

--1.
    CREATE TABLE humans_copy
    SELECT * FROM humans;
    CREATE TABLE prize_winners_copy
    SELECT * FROM prize_winners;


--2.
    SELECT * 
      FROM humans
     WHERE country_id='au';

    
    UPDATE humans
       SET membership_type='premium',
           membership_expiration = DATE_ADD(IFNULL(membership_expiration, CURDATE()), INTERVAL 1 YEAR)
     WHERE country_id='au';

--3.
    DELETE FROM humans h, prize_winners w
     USING h JOIN w 
     WHERE h.name_first='Barry'
           AND h.name_last='Pilson'
           AND h.human_id=w.human_id;

--4.
    DELETE FROM humans;
    DELETE FROM prize_winners;

    SELECT * FROM humans;
    SELECT * FROM prize_winners;

    INSERT INTO humans
           (formal_title, name_first, name_last, email_address, country_id, membership_type, membership_expiration, better_birders_site, possible_duplicate)
    SELECT formal_title, name_first, name_last, email_address, country_id, membership_type, membership_expiration, better_birders_site, possible_duplicate
      FROM humans_copy;
    
    INSERT INTO prize_winners
           (human_id, winner_date, prize_chosen, prize_sent)
    SELECT human_id, winner_date, prize_chosen, prize_sent
      FROM prize_winners_copy;

    SELECT * FROM humans;
    SELECT * FROM prize_winners;

    DROP TABLE humans_copy;
    DROP TABLE prize_winners_copy;

    