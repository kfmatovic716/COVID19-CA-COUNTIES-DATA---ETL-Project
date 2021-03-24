-- Drop any tables with these table names before loading
DROP TABLE IF EXISTS Counties;
DROP TABLE IF EXISTS Vaccine;
DROP TABLE IF EXISTS Deaths;
DROP TABLE IF EXISTS Cases;
DROP TABLE IF EXISTS Total_tests;
DROP TABLE IF EXISTS Employment_Unemployment;
DROP TABLE IF EXISTS Hospitalized_COVID_patients;
DROP TABLE IF EXISTS Hospital_beds;
DROP TABLE IF EXISTS ICU_COVID_patients;


-- Create the Counties table & check table data import
CREATE TABLE "Counties" (
    "county" varchar(50) NOT NULL,
    "date"  date,
    "population" int,
     PRIMARY KEY ("county","date")
);

SELECT 
	* 
FROM 
    "Counties";

-- Create the Vaccine table & check table data import
CREATE TABLE "Vaccine" (
    "county" varchar(50) NOT NULL,
    "date" date,
    "total_doses" int,  
    FOREIGN KEY("county", "date")
    REFERENCES "Counties" ("county", "date")
);

SELECT 
	* 
FROM 
    "Vaccine";

-- Create the Deaths table & check table data import
CREATE TABLE "Deaths" (
    "county" varchar(50) NOT NULL,
    "date" date,
    "deaths" int,
    "reported_deaths" int,
    FOREIGN KEY("county", "date")
    REFERENCES "Counties" ("county", "date")
);

SELECT 
	* 
FROM 
    "Deaths";

-- Create the Cases table & check table data import
CREATE TABLE "Cases" (
    "county" varchar(50)   NOT NULL,
    "date" date,
    "cases" int,
    "reported_cases" int,
    FOREIGN KEY("county", "date")
    REFERENCES "Counties" ("county", "date")
);

SELECT 
	* 
FROM 
    "Cases";

-- Create the Total tests table & check table data import
CREATE TABLE "Total_tests" (
    "county" varchar(50)   NOT NULL,
    "date" date,
    "total_tests" int,
    "positive_tests" int,
    "reported_tests" int,
    FOREIGN KEY("county", "date")
    REFERENCES "Counties" ("county", "date")
);

SELECT 
	* 
FROM 
    "Total_tests";

-- Create the Employment/Unemployment table & check table data import
CREATE TABLE "Employment_Unemployment" (
    "county" varchar(50)   NOT NULL,
    "date" date   NOT NULL,
    "labor_force" int   NOT NULL,
    "employment" int   NOT NULL,
    "unemployment" int   NOT NULL,
    "unemployment_rate" real   NOT NULL,
    FOREIGN KEY("county", "date")
    REFERENCES "Counties" ("county", "date")
);

SELECT 
	* 
FROM 
    "Employment_Unemployment";

-- Create the Hospitalized COVID patients table & check table data import
CREATE TABLE "Hospitalized_COVID_patients" (
    "county" varchar(50)   NOT NULL,
    "date" date   NOT NULL,
    "confirmed_patients" int   NOT NULL,
    "suspected_patients" int   NOT NULL,
    "total_covid_patients" int   NOT NULL,
    FOREIGN KEY("county", "date")
    REFERENCES "Counties" ("county", "date")
);

SELECT 
	* 
FROM 
    "Hospitalized_COVID_patients";

-- Create the Hospital beds table & check table data import
CREATE TABLE "Hospital_beds" (
    "county" varchar(50)   NOT NULL,
    "date" date   NOT NULL,
    "all_hospital_beds" int   NOT NULL,
    "icu_available_beds" int   NOT NULL,
    FOREIGN KEY("county", "date")
    REFERENCES "Counties" ("county", "date")
);

SELECT 
	* 
FROM 
    "Hospital_beds";

-- Create the ICU covid patients table & check table data import
CREATE TABLE "ICU_COVID_patients" (
    "county" varchar(50)   NOT NULL,
    "date" date   NOT NULL,
    "icu_covid_confirmed" int   NOT NULL,
    "icu_covid_suspected" int   NOT NULL,
    FOREIGN KEY("county", "date")
    REFERENCES "Counties" ("county", "date")
);

SELECT 
	* 
FROM 
    "Hospital_beds";


