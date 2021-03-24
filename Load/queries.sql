-- Selecting all records
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
	Total_tests;

SELECT
	*
FROM
	Hospitalized_COVID_patients;

SELECT
	*
FROM
	Cases;


-- Count number of records in employees and salaries table before joining
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
	Total_tests;

SELECT
	COUNT(*)
FROM
	Hospitalized_COVID_patients;

SELECT
	COUNT(*)
FROM
	Cases;



-- Total number of vaccine doses administered per day
SELECT 
	SUM(Vaccine.total_doses)
FROM 
	Vaccine
ORDER BY
	Vaccine.date ASC;


-- Average Reported Deaths in each county
SELECT 
	AVG(Deaths.reported_deaths)
FROM 
	Deaths
ORDER BY
    Deaths.county ASC;


-- Total number of Hospitalized COVID patients in Los Angeles & Ventura counties per day
SELECT 
	Hospitalized_COVID_patients.county,
	Hospitalized_COVID_patients.date,
	SUM(Hospitalized_COVID_patients.total_covid_patients) 
FROM 
	Hospitalized_COVID_patients
WHERE
	Hospitalized_COVID_patients.county = 'Los Angeles'
    AND Hospitalized_COVID_patients.county = 'Ventura'
ORDER BY
    Hospitalized_COVID_patients.date;


-- Which county  has the most positive tests?
SELECT
    Total_tests.county,
    Total_tests.date,
    MAX(Total_tests.positive_tests) AS max_positive_tests
FROM
    Total_tests
GROUP BY
    Total_tests.county;


-- Join tables: Vaccine and Cases 
SELECT 
	Vaccine.county,
	Vaccine.date,
	Vaccine.total_doses,
	Cases.county,
    Cases.date,
	Cases.reported_cases
FROM 
	Vaccine
INNER JOIN Cases ON
	(Vaccine.county, Vaccine.date) = (Cases.county, Cases.date)
    

