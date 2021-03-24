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


-- Create the Vaccine table & check table data import
CREATE TABLE "Vaccine" (
    "county" varchar(50)   NOT NULL,
    "date" date   NOT NULL,
    "total_doses" int   NOT NULL,
    CONSTRAINT "pk_Vaccine" PRIMARY KEY (
        "county","date")
);

-- SELECT 
-- 	* 
-- FROM 
--     "Vaccine";


-- Create the Counties table & check table data import
CREATE TABLE "Counties" (
    "county" varchar(50)   NOT NULL,
    "date" date   NOT NULL,
    "population" int   NOT NULL,
    CONSTRAINT "fk_Counties_county_date" FOREIGN KEY("county", "date")
    REFERENCES "Vaccine" ("county", "date")
);

-- SELECT 
-- 	* 
-- FROM 
--     "Counties";


-- Create the Deaths table & check table data import    
CREATE TABLE "Deaths" (
    "county" varchar(50)   NOT NULL,
    "date" date   NOT NULL,
    "deaths" int   NOT NULL,
    "cumulative_deaths" int   NOT NULL,
    "reported_deaths" int   NOT NULL,
    "cumulative_reported_deaths" int   NOT NULL,
    CONSTRAINT "fk_Deaths_county_date" FOREIGN KEY("county", "date")
    REFERENCES "Vaccine" ("county", "date")
);

-- SELECT 
-- 	* 
-- FROM 
--     "Deaths";

-- Create the Cases table & check table data import    
CREATE TABLE "Cases" (
    "county" varchar(50)   NOT NULL,
    "date" date   NOT NULL,
    "cases" int   NOT NULL,
    "cumulative_cases" int   NOT NULL,
    "reported_cases" int   NOT NULL,
    "cumulative_reported_cases" int   NOT NULL,
    CONSTRAINT "fk_Cases_county_date" FOREIGN KEY("county", "date")
    REFERENCES "Vaccine" ("county", "date")
);

-- SELECT 
-- 	* 
-- FROM 
--     "Cases";

-- Create the Total tests table & check table data import    
CREATE TABLE "Total_tests" (
    "county" varchar(50)   NOT NULL,
    "date" date   NOT NULL,
    "total_tests" int   NOT NULL,
    "cumulative_total_tests" int   NOT NULL,
    "positive_tests" int   NOT NULL,
    "cumulative_positive_tests" int   NOT NULL,
    "reported_tests" int   NOT NULL,
    "cumulative_reported_tests" int   NOT NULL,
    CONSTRAINT "fk_Total_tests_county_date" FOREIGN KEY("county", "date")
    REFERENCES "Vaccine" ("county", "date")
);

-- SELECT 
-- 	* 
-- FROM 
--     "Total_tests";

-- Create the Employment/Unemployment table & check table data import    
CREATE TABLE "Employment_Unemployment" (
    "county" varchar(50)   NOT NULL,
    "date" date   NOT NULL,
    "labor_force" int   NOT NULL,
    "employment" int   NOT NULL,
    "unemployment" int   NOT NULL,
    "unemployment_rate" float   NOT NULL,
    CONSTRAINT "fk_Employment_Unemployment_county_date" FOREIGN KEY("county", "date")
    REFERENCES "Vaccine" ("county", "date")
);

-- SELECT 
-- 	* 
-- FROM 
--     "Employment_Unemployment";

-- Create the Hospitalized COVID patients table & check table data import
CREATE TABLE "Hospitalized_COVID_patients" (
    "county" varchar(50)   NOT NULL,
    "date" date   NOT NULL,
    "confirmed_patients" int   NOT NULL,
    "suspected_patients" int   NOT NULL,
    "total_covid_patients" int   NOT NULL,
    CONSTRAINT "fk_Hospitalized_COVID_patients_county_date" FOREIGN KEY("county", "date")
    REFERENCES "Vaccine" ("county", "date")
);

-- SELECT 
-- 	* 
-- FROM 
--     "Hospitalized_COVID_patients";

-- Create the Hospital beds table & check table data import    
CREATE TABLE "Hospital_beds" (
    "county" varchar(50)   NOT NULL,
    "date" date   NOT NULL,
    "all_hospital_beds" int   NOT NULL,
    "icu_available_beds" int   NOT NULL,
    CONSTRAINT "fk_Hospital_beds_county_date" FOREIGN KEY("county", "date")
    REFERENCES "Vaccine" ("county", "date")
);

-- SELECT 
-- 	* 
-- FROM 
--     "Hospital_beds";

-- Create the ICU covid patients table & check table data import
CREATE TABLE "ICU_COVID_patients" (
    "county" varchar(50)   NOT NULL,
    "date" date   NOT NULL,
    "icu_covid_confirmed" int   NOT NULL,
    "icu_covid_suspected" int   NOT NULL,
    CONSTRAINT "fk_ICU_COVID_patients_county_date" FOREIGN KEY("county", "date")
    REFERENCES "Vaccine" ("county", "date")
);

-- SELECT 
-- 	* 
-- FROM 
--     "ICU_COVID_patients";

-- Set constraints    
-- ALTER TABLE "Counties" ADD CONSTRAINT "fk_Counties_county_date" FOREIGN KEY("county", "date")
-- REFERENCES "Vaccine" ("county", "date");

-- ALTER TABLE "Deaths" ADD CONSTRAINT "fk_Deaths_county_date" FOREIGN KEY("county", "date")
-- REFERENCES "Vaccine" ("county", "date");

-- ALTER TABLE "Cases" ADD CONSTRAINT "fk_Cases_county_date" FOREIGN KEY("county", "date")
-- REFERENCES "Vaccine" ("county", "date");

-- ALTER TABLE "Total_tests" ADD CONSTRAINT "fk_Total_tests_county_date" FOREIGN KEY("county", "date")
-- REFERENCES "Vaccine" ("county", "date");

-- ALTER TABLE "Employment_Unemployment" ADD CONSTRAINT "fk_Employment_Unemployment_county_date" FOREIGN KEY("county", "date")
-- REFERENCES "Vaccine" ("county", "date");

-- ALTER TABLE "Hospitalized_COVID_patients" ADD CONSTRAINT "fk_Hospitalized_COVID_patients_county_date" FOREIGN KEY("county", "date")
-- REFERENCES "Vaccine" ("county", "date");

-- ALTER TABLE "Hospital_beds" ADD CONSTRAINT "fk_Hospital_beds_county_date" FOREIGN KEY("county", "date")
-- REFERENCES "Vaccine" ("county", "date");

-- ALTER TABLE "ICU_COVID_patients" ADD CONSTRAINT "fk_ICU_COVID_patients_county_date" FOREIGN KEY("county", "date")
-- REFERENCES "Vaccine" ("county", "date");

