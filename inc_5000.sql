DELETE FROM inc_5000
WHERE url LIKE '%http://%'
   OR url LIKE '%https://%';

UPDATE inc_5000
SET revenue = REPLACE(revenue, 'Million', '');

UPDATE inc_5000
SET revenue = revenue * 1000000;

ALTER TABLE inc_5000
RENAME COLUMN 'growth_%' to 'growth_pct';

UPDATE inc_5000
SET growth_pct = growth_pct / 100; 

UPDATE inc_5000
SET growth_pct = CAST(ROUND(growth_pct, 2)AS NUMERIC);

UPDATE inc_5000
SET metro = TRIM(SUBSTR(metro, 1, INSTR(metro, ', ') - 1))
WHERE metro LIKE '%, %';

UPDATE inc_5000
SET metro = 'N/A'
WHERE metro IS NULL OR metro = '';

UPDATE inc_5000
SET metro = REPLACE(metro, 'WASHINGTON', 'WASHINGTON, D.C.')
WHERE metro = 'WASHINGTON';

UPDATE inc_5000
SET city = REPLACE(city, 'WASHINGTON', 'WASHINGTON, D.C.')
WHERE city = 'WASHINGTON';

UPDATE inc_5000
SET metro = UPPER(metro),
city = UPPER(city),
industry = UPPER(industry);

SELECT * FROM inc_5000

