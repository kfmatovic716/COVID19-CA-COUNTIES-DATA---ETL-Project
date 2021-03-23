 -- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/DrvtUi
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Counties" (
    "county" varchar(50)   NOT NULL,
    "date" date   NOT NULL,
    "population" int   NOT NULL,
    CONSTRAINT "pk_Counties" PRIMARY KEY (
        "county","date"
     )
);

-- CONSTRAINT PK_Counties PRIMARY KEY (county, date)
CREATE TABLE "Vaccine" (
    "county" varchar(50)   NOT NULL,
    "date" date   NOT NULL,
    "total_doses" int   NOT NULL
);

-- CONSTRAINT Vaccine FOREIGN KEY
CREATE TABLE "Deaths" (
    "county" varchar(50)   NOT NULL,
    "date" date   NOT NULL,
    "deaths" int   NOT NULL,
    "cumulative_deaths" int   NOT NULL,
    "reported_deaths" int   NOT NULL,
    "cumulative_reported_deaths" int   NOT NULL
);

CREATE TABLE "Cases" (
    "county" varchar(50)   NOT NULL,
    "date" date   NOT NULL,
    "cases" int   NOT NULL,
    "cumulative_cases" int   NOT NULL,
    "reported_cases" int   NOT NULL,
    "cumulative_reported_cases" int   NOT NULL
);

CREATE TABLE "Total_tests" (
    "county" varchar(50)   NOT NULL,
    "date" date   NOT NULL,
    "total_tests" int   NOT NULL,
    "cumulative_total_tests" int   NOT NULL,
    "positive_tests" int   NOT NULL,
    "cumulative_positive_tests" int   NOT NULL,
    "reported_tests" int   NOT NULL,
    "cumulative_reported_tests" int   NOT NULL
);

CREATE TABLE "Employment_Unemployment" (
    "county" varchar(50)   NOT NULL,
    "date" date   NOT NULL,
    "labor_force" int   NOT NULL,
    "employment" int   NOT NULL,
    "unemployment" int   NOT NULL,
    "unemployment_rate" int   NOT NULL
);

CREATE TABLE "Hospitalized_COVID_patients" (
    "county" varchar(50)   NOT NULL,
    "date" date   NOT NULL,
    "confirmed_patients" int   NOT NULL,
    "suspected_patients" int   NOT NULL,
    "total_covid_patients" int   NOT NULL
);

CREATE TABLE "Hospital_beds" (
    "county" varchar(50)   NOT NULL,
    "date" date   NOT NULL,
    "all_hospital_beds" int   NOT NULL,
    "icu_available_beds" int   NOT NULL
);

CREATE TABLE "ICU_COVID_patients" (
    "county" varchar(50)   NOT NULL,
    "date" date   NOT NULL,
    "ICU_COVID_confirmed" int   NOT NULL,
    "ICU_COVID_suspected" int   NOT NULL
);

ALTER TABLE "Vaccine" ADD CONSTRAINT "fk_Vaccine_county_date" FOREIGN KEY("county", "date")
REFERENCES "Counties" ("county", "date");

ALTER TABLE "Deaths" ADD CONSTRAINT "fk_Deaths_county_date" FOREIGN KEY("county", "date")
REFERENCES "Counties" ("county", "date");

ALTER TABLE "Cases" ADD CONSTRAINT "fk_Cases_county_date" FOREIGN KEY("county", "date")
REFERENCES "Counties" ("county", "date");

ALTER TABLE "Total_tests" ADD CONSTRAINT "fk_Total_tests_county_date" FOREIGN KEY("county", "date")
REFERENCES "Counties" ("county", "date");

ALTER TABLE "Employment_Unemployment" ADD CONSTRAINT "fk_Employment_Unemployment_county_date" FOREIGN KEY("county", "date")
REFERENCES "Counties" ("county", "date");

ALTER TABLE "Hospitalized_COVID_patients" ADD CONSTRAINT "fk_Hospitalized_COVID_patients_county_date" FOREIGN KEY("county", "date")
REFERENCES "Counties" ("county", "date");

ALTER TABLE "Hospital_beds" ADD CONSTRAINT "fk_Hospital_beds_county_date" FOREIGN KEY("county", "date")
REFERENCES "Counties" ("county", "date");

ALTER TABLE "ICU_COVID_patients" ADD CONSTRAINT "fk_ICU_COVID_patients_county_date" FOREIGN KEY("county", "date")
REFERENCES "Counties" ("county", "date");

