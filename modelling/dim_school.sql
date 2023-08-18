CREATE OR REPLACE TABLE dim_school AS
SELECT
    "School_code"::INTEGER AS "School_code",
    "School_name",
    "Street",
    "Town_suburb",
    "Postcode"::INTEGER AS "Postcode",
    "latest_year_enrolment_FTE"::FLOAT AS "latest_year_enrolment_FTE",
    "Indigenous_pct",
    "LBOTE_pct",
    "ICSEA_value"::INTEGER AS "ICSEA_value",
    "Level_of_schooling",
    "Selective_school",
    "Opportunity_class",
    "School_subtype",
    "Date_1st_teacher"::DATE AS "Date_1st_teacher",
    "LGA",
    "Latitude"::FLOAT AS "Latitude",
    "Longitude"::FLOAT AS "Longitude",
    "Assets_unit",
    "SA4"
FROM
    stg_masterdata;

