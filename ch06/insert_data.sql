
DESCRIBE bird_orders;

ALTER TABLE bird_orders
AUTO_INCREMENT=100;

INSERT INTO bird_orders (scientific_name, brief_description) VALUES
 ('Anseriformes','Waterfowl'),
 ('Galliformes','Fowl'),
 ('Charadriiformes','Gulls, Button Quails, Plovers'),
 ('Gaviiformes','Loons'),
 ('Podicipediformes','Grebes'),
 ('Procellariiformes','Albatrosses, Petrels'),
 ('Sphenisciformes','Penguins'),
 ('Pelecaniformes','Pelicans'),
 ('Phaethontiformes','Tropicbirds'),
 ('Ciconiiformes','Storks'),
 ('Cathartiformes','New-World Vultures'),
 ('Phoenicopteriformes','Flamingos'),
 ('Falconiformes','Falcons, Eagles, Hawks'),
 ('Gruiformes','Cranes'),
 ('Pteroclidiformes','Sandgrouse'),
 ('Columbiformes','Doves and Pigeons'),
 ('Psittaciformes','Parrots'),
 ('Cuculiformes','Cuckoos and Turacos'),
 ('Opisthocomiformes','Hoatzin'),
 ('Strigiformes','Owls'),
 ('Struthioniformes','Ostriches, Emus, Kiwis'),
 ('Tinamiformes','Tinamous'),
 ('Caprimulgiformes','Nightjars'),
 ('Apodiformes','Swifts and Hummingbirds'),
 ('Coraciiformes','Kingfishers'),
 ('Piciformes','Woodpeckers'),
 ('Trogoniformes','Trogons'),
 ('Coliiformes','Mousebirds'),
 ('Passeriformes','Passerines');

DESCRIBE bird_families;

SELECT order_id FROM bird_orders
WHERE scientific_name = 'Gaviiformes';
--correct
INSERT INTO bird_families VALUES
(100, 'Gaviidae', 'Loons or divers are aquatic birds found mainly in the Northern Hemisphere.', 103);


--warning
INSERT INTO bird_families VALUES
('Anatidea', 'This family includes ducks, geese and swans.', NULL, 103);
INSERT INTO bird_families VALUES
(102, 'This family includes ducks, geese and swans.', NULL, 103);
SHOW WARNINGS \G

SELECT * FROM bird_families \G

--DELETE FROM bird_families 
--WHERE familiy_id=101;

--ALTER TABLE bird_orders
--AUTO_INCREMENT=101;
INSERT INTO bird_families (scientific_name, order_id, brief_description) VALUES
('Anatidea', 103, 'This family includes ducks, geese and swans.');


UPDATE bird_families
SET scientific_name='Anatidea',
    brief_description='This family includes ducks, geese and swans.'
WHERE family_id=102;



SELECT order_id, scientific_name FROM bird_orders ORDER BY order_id;


INSERT INTO bird_families (scientific_name, order_id) VALUES
('Charadriidae', 109),
('Lardae', 102),
('Sternidae', 102),
('Caprimulgidae', 122),
('Sittidae', 128),
('Picidae', 125),
('Accipitridae', 112),
('Tyrannidae', 128),
('Formicariidae', 128),
('Laniidae', 128);

SELECT family_id, scientific_name, order_id 
FROM bird_families
ORDER BY scientific_name;

SELECT * 
FROM bird_families
ORDER BY scientific_name;


DESCRIBE birds;
SHOW COLUMNS FROM birds;
SHOW COLUMNS FROM birds LIKE '%id';

SHOW FULL COLUMNS FROM birds;
SHOW FULL COLUMNS FROM birds LIKE '%id';

INSERT INTO birds (common_name, scientific_name, family_id)
VALUES ('Mountain Plover', 'Charadrius montanus', 103);

INSERT INTO birds (common_name, scientific_name, family_id) VALUES 
('Snowy Plover', 'Charadrius alexandrinus', 103),
('Black-bellied Plover', 'Pluvialis squatarola', 103),
('Pacific Golden Plover', 'Pluvialis fulva', 103);


SELECT  b.common_name AS 'Bird',
        b.scientific_name AS 'Scientific Name',
        f.scientific_name AS 'Family',
        o.scientific_name AS 'Order'
  FROM  birds b,
        bird_families f,
        bird_orders o
 WHERE  b.family_id=f.family_id
   AND  f.order_id=o.order_id;


INSERT INTO bird_families
SET scientific_name='Rallidae', order_id=113;


UPDATE bird_families
   SET scientific_name='Accipitridae (Hawks, Eagles, and Kites)'
 WHERE family_id=109;
 UPDATE bird_families
   SET scientific_name='Caprimulgidae (Nightjars and Allies)'
 WHERE family_id=106;
 UPDATE bird_families
   SET scientific_name='Charadriidae (Plovers and Lapwings)'
 WHERE family_id=103;
 UPDATE bird_families
   SET scientific_name='Formicariidae (Antthrushes)'
 WHERE family_id=111;
 UPDATE bird_families
   SET scientific_name='Gaviidae (Loons)'
 WHERE family_id=100;
 UPDATE bird_families
   SET scientific_name='Laniidae (Shrikes)'
 WHERE family_id=112;
 UPDATE bird_families
   SET scientific_name='Picidae (Woodpeckers)'
 WHERE family_id=108;
 UPDATE bird_families
   SET scientific_name='Rallidae (Rails, Gallinules, and Coots)'
 WHERE family_id=113;
 UPDATE bird_families
   SET scientific_name='Sittidae (Nuthatches)'
 WHERE family_id=107;
 UPDATE bird_families
   SET scientific_name='Tyrannidae (Tyrant Flycatchers)'
 WHERE family_id=110; 
 UPDATE bird_families
   SET scientific_name='Anatidae (Ducks, Geese, and Waterfowl)'
 WHERE family_id=102;
 UPDATE bird_families
   SET scientific_name='Laridae (Gulls, Terns, and Skimmers)'
 WHERE family_id=104;
 UPDATE bird_families
   SET scientific_name='Sturnidae (Starlings)'
 WHERE family_id=105;

INSERT INTO bird_families (family_id, scientific_name, brief_description, order_id) VALUES
(100, 'Gaviidae (Loons)', 'Loons or divers are aquatic birds found mainly in the Northern Hemisphere.',103),
(102, 'Anatidae (Ducks, Geese, and Waterfowl)', 'This family includes ducks, geese and swans.', 103),
(103, 'Charadriidae (Plovers and Lapwings)', NULL, 109),
(104, 'Laridae (Gulls, Terns, and Skimmers)', NULL, 102),
(105, 'Sturnidae (Starlings)', NULL, 102),
(106, 'Caprimulgidae (Nightjars and Allies)', NULL, 122),
(107, 'Sittidae (Nuthatches)', NULL, 128),
(108, 'Picidae (Woodpeckers)', NULL, 125),
(109, 'Accipitridae (Hawks, Eagles, and Kites)', NULL, 112),
(110, 'Tyrannidae (Tyrant Flycatchers)', NULL, 128),
(111, 'Formicariidae (Antthrushes)', NULL, 128),
(112, 'Laniidae (Shrikes)', NULL, 128),
(113, 'Rallidae (Rails, Gallinules, and Coots)', NULL, 113);


CREATE TABLE cornell_birds_families_orders (
  fid int(11) NOT NULL AUTO_INCREMENT,
  bird_family varchar(255) COLLATE latin1_bin DEFAULT NULL,
  examples varchar(255) COLLATE latin1_bin DEFAULT NULL,
  bird_order varchar(255) COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (fid)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--import backup data
mysql -uhypStudy -pP@ssw0rd < cornell_birds_families_orders.sql

SELECT COUNT(0) FROM cornell_birds_families_orders;
SELECT * FROM cornell_birds_families_orders LIMIT 1;

ALTER TABLE bird_families 
 ADD COLUMN cornell_bird_order VARCHAR(255);

SELECT * FROM bird_families;

INSERT IGNORE INTO bird_families 
(scientific_name, brief_description, cornell_bird_order)
SELECT bird_family, examples, bird_order 
  FROM cornell_birds_families_orders;

SELECT * FROM bird_families
 ORDER BY family_id DESC LIMIT 1;

 SELECT * FROM bird_families
 WHERE scientific_name='Viduidae (Indigobirds)';


SELECT  DISTINCT o.order_id,
        f.cornell_bird_order AS "Cornell's Order",
        o.scientific_name AS "MY Order"
  FROM  bird_families f,
        bird_orders o
 WHERE  f.order_id IS NULL
   AND  f.cornell_bird_order=o.scientific_name
 LIMIT  5;

SELECT f.* FROM bird_families f, bird_orders o
 WHERE  f.order_id IS NOT NULL;

SELECT f.* FROM bird_families f
 WHERE f.order_id IS NULL
   AND f.cornell_bird_order IS NULL or f.cornell_bird_order='';

SELECT f.* FROM bird_families f, bird_orders o
 WHERE  f.order_id IS NULL
   AND  f.cornell_bird_order=o.scientific_name;

UPDATE  bird_families f,
        bird_orders o
   SET  f.order_id=o.order_id
 WHERE  f.order_id IS NULL
   AND  f.cornell_bird_order=o.scientific_name;


SELECT * FROM bird_families
 ORDER BY family_id DESC LIMIT 4;

SELECT * FROM bird_orders
 WHERE order_id=128;

SELECT family_id, scientific_name, brief_description, cornell_bird_order
  FROM bird_families
 WHERE order_id IS NULL;

SELECT DISTINCT cornell_bird_order
  FROM bird_families
 WHERE order_id IS NULL;

INSERT INTO bird_orders (scientific_name, brief_description) VALUES
('Rheiformes','Rheiformes'),
('Casuariiformes','Casuariiformes'),
('Apterygiformes','Apterygiformes'),
('Suliformes','Suliformes'),
--('Accipitriformes','Accipitriformes'),
('Otidiformes','Otidiformes'),
('Mesitornithiformes','Mesitornithiformes'),
('Eurypygiformes','Eurypygiformes'),
('Pterocliformes','Pterocliformes'),
('Galbuliformes','Galbuliformes'),
('Cariamiformes','Cariamiformes');


UPDATE bird_families 
SET order_id=112
WHERE cornell_bird_order='Accipitriformes';

select * from bird_families
where cornell_bird_order IN(
'Rheiformes','Casuariiformes','Apterygiformes','Suliformes'
,'Otidiformes','Mesitornithiformes','Eurypygiformes','Pterocliformes'
,'Galbuliformes','Cariamiformes');

SELECT f.* 
  FROM bird_families f, bird_orders o 
 WHERE f.order_id IS NULL
   AND f.cornell_bird_order=o.scientific_name;

UPDATE bird_families f, bird_orders o 
   SET f.order_id=o.order_id
 WHERE f.order_id IS NULL
   AND f.cornell_bird_order=o.scientific_name;

ALTER TABLE bird_families
DROP COLUMN cornell_bird_order;

--DROP TABLE cornell_birds_families_orders;

REPLACE INTO bird_families 
(scientific_name, brief_description, order_id) VALUES
('Viduidae (Indigobirds)', 'Indigobirds & Whydahs', 128),
('Estrildidae (Waxbills and Allies)', 'Waxbills, Weaver Finches, & Allies', 128),
('Ploceidae (Weavers and Allies)', 'Weavers, Malimbe, & Bishops', 128);

SELECT * FROM bird_families
WHERE scientific_name='Viduidae (Indigobirds)' \G

--Not work for InnoDB
INSERT LOW_PRIORITY INTO bird_sightings ...
INSERT HIGH_PRIORITY INTO bird_sightings ...

INSERT DELAYED INTO bird_sightings ...


--Q&A:
--1. 
   INSERT INTO birds_body_shapes 
   (body_id, body_shape) VALUES
   ('HMD','Hummingbird'),
   ('LLW','Long-Legged Wader'),
   ('MHN','Marsh Hen'),
   ('OWL','Owl'),
   ('PBD','Perching Bird'),
   ('PWB','Perching Water Bird'),
   ('PEN','Pigeon'),
   ('RPT','Raptor'),
   ('SED','Seabird'),
   ('SBD','Shore Bird'),
   ('SWW','Swallow'),
   ('TCG','Tree Clinging'),
   ('WTL','Waterfowl'),
   ('WFL','Woodland Fowl');

--2.
   INSERT INTO birds_wing_shapes
   (wing_id, wing_shape) VALUES
   ('BD','Broad'),
   ('RD','Rounded'),
   ('PD','Pointed'),
   ('TD','Tapered'),
   ('LG','Long'),
   ('VL','Very Long');

--3.
   INSERT INTO birds_bill_shapes
   (bill_id, bill_shape) VALUES
   ('AP','All Purpose'),
   ('CO','Cone'),
   ('CU','Curved'),
   ('DA','Dagger'),
   ('HO','Hooked'),
   ('HS','Hooked Seabird'),
   ('NE','Needle'),
   ('SP','Spatulate'),
   ('SE','Specialized');

--4.
   SELECT * FROM birds_body_shapes WHERE body_shape='Woodland Fowl';

   REPLACE INTO birds_body_shapes 
   (body_id, body_shape) VALUES
   ('WFL','Upland Ground Birds');

   SELECT * FROM birds_body_shapes;