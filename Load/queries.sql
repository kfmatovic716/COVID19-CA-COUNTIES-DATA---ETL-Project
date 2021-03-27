-- Selecting all records
SELECT
	*
FROM
	"Vaccine";

SELECT
	*
FROM
	"Deaths";

SELECT
	*
FROM
	"Total_tests";

SELECT
	*
FROM
	"Hospitalized_COVID_patients";

SELECT
	*
FROM
	"Cases";

SELECT
	*
FROM
	"ICU_COVID_patients";

SELECT
	*
FROM
	"Hospital_beds";

-- Count number of records in employees and salaries table before joining
SELECT
	COUNT(*)
FROM
	"Vaccine";
	
SELECT
	COUNT(*)
FROM
	"Deaths";

SELECT
	COUNT(*)
FROM
	"Total_tests";

SELECT
	COUNT(*)
FROM
	"Hospitalized_COVID_patients";

SELECT
	COUNT(*)
FROM
	"Cases";

SELECT
	COUNT(*)
FROM
	"ICU_COVID_patients";

SELECT
	COUNT(*)
FROM
	"Hospital_beds";


-- Total number of vaccine doses administered per county in descending order
-- to see which county has the highest number of administered vaccine
SELECT 
	"Vaccine".county,
	SUM ("Vaccine".total_doses) AS total_vaccine_doses
FROM 
	"Vaccine"
GROUP BY
	"Vaccine".county
ORDER BY 
	total_vaccine_doses DESC;


-- Total number of deaths in Los Angeles county. This also shows which dates did the 
-- Los Angeles incur the most deaths. 
SELECT 
	"Deaths".county,
	"Deaths".date,
	SUM ("Deaths".deaths) AS total_deaths
FROM 
	"Deaths"
WHERE
	"Deaths".county = 'Los Angeles'
GROUP BY
	"Deaths".county,
	"Deaths".date
ORDER BY 
	total_deaths DESC;


-- Average number of Hospitalized COVID patients in Los Angeles when COVID just started (March 1, 2020- March 31,2020)
SELECT
	"Hospitalized_COVID_patients".county,
	"Hospitalized_COVID_patients".date,
	ROUND(AVG("Hospitalized_COVID_patients".total_covid_patients), 2) AS avg_hospitalized_patients
FROM
	"Hospitalized_COVID_patients"
WHERE
	"Hospitalized_COVID_patients".county = 'Los Angeles'
	AND "Hospitalized_COVID_patients".date between '2020-03-01' and '2020-03-31'
GROUP BY
	"Hospitalized_COVID_patients".county,
	"Hospitalized_COVID_patients".date
ORDER BY
	avg_hospitalized_patients DESC;


-- Which county  has the most positive tests?
SELECT
	"Total_tests".county,
    "Total_tests".date,
    MAX("Total_tests".positive_tests) AS max_positive_tests
FROM
	"Total_tests"
GROUP BY
	"Total_tests".county,
	"Total_tests".date
ORDER BY
	max_positive_tests DESC;

-- Create sample view of some joined tables: ICU_COVID_patients and Hospital_beds 
CREATE VIEW icu_patients_and_beds AS (
	SELECT	
		"ICU_COVID_patients".county,
		"ICU_COVID_patients".date,
		"ICU_COVID_patients".icu_covid_confirmed,
		"ICU_COVID_patients".icu_covid_suspected,
		"Hospital_beds".all_hospital_beds,
		"Hospital_beds".icu_available_beds
	FROM
		"ICU_COVID_patients"
	INNER JOIN "Hospital_beds" ON
		("ICU_COVID_patients".county, "ICU_COVID_patients".date) = ("Hospital_beds".county, "Hospital_beds".date)
);

-- Query the table view created
SELECT 
  *
FROM 
  icu_patients_and_beds;

-- Drop view
-- DROP VIEW icu_patients_and_beds;

