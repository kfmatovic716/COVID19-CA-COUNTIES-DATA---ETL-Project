-- Selecting all records
SELECT
	*
FROM
	Counties;

SELECT
	*
FROM
	Vaccine;

SELECT
	*
FROM
	Deaths;

SELECT
	*
FROM
	Employment_Unemployment;


-- Count number of records in employees and salaries table before joining
SELECT
	COUNT(*)
FROM
	Counties;
	
SELECT
	COUNT(*)
FROM
	Vaccine;

SELECT
	COUNT(*)
FROM
	Deaths;

SELECT
	COUNT(*)
FROM
	Employment_Unemployment;

-- Join tables: Counties & Vaccine & sorted by date

SELECT 
	Counties.county,
	Counties.date,
	Vaccine.county,
	Vaccine.date,
	Vaccine.total_doses
FROM 
	Counties
INNER JOIN Vaccines ON
	Counties.county = Vaccines.county
    Counties.date = Vaccines.date
ORDER BY
	Counties.date ASC;

-- Join tables: Counties & Deaths & sorted by date
SELECT 
	Counties.county,
	Counties.date,
	Deaths.county,
	Deaths.date,
	Deaths.reported_deaths
FROM 
	Counties
INNER JOIN Deaths ON
	Counties.county = Deaths.county
    Counties.date = Deaths.date
ORDER BY
	Counties.date ASC;

-- Join tables: Counties & cases 
SELECT 
	Counties.county,
	Counties.date,
	Cases.county,
	Cases.date,
	Cases.reported_cases
FROM 
	Counties
INNER JOIN Cases ON
	Counties.county = Cases.county
    Counties.date = Cases.date

-- Selecting unemployment rates for Los Angeles and Riverside 
SELECT 
	Counties.county,
	Counties.date,
	Employment_Unemployment.county,
	Employment_Unemployment.date,
	Employment_Unemployment.unemployment_rate
FROM 
	Counties
INNER JOIN Employment_Unemployment ON
	Counties.county = Employment_Unemployment.county
    Counties.date = Employment_Unemployment.date
WHERE
	Counties.county = 'Los Angeles'
    AND Counties.county = 'Riverside'
ORDER BY
	Employment_Unemployment.unemployment_rate ASC;

-- 
SELECT 
  Counties.county, 
  AVG(film.rental_rate) AS avg_deaths
FROM 
  film
GROUP BY 
  film.rental_duration;