CREATE OR  REPLACE TABLE fact_compstudent AS
(
WITH tb1 AS (
    SELECT
        "School code" AS "School_code",
        "Year",
        CAST("Value" AS INT) AS "CompStudent_#"
    FROM
        stg_compclass
    WHERE
        "Measure_On" = 'Student' AND
        "Measure_Type" = 'Number'
),
tb2 AS (
    SELECT
        "School code" AS "School_code",
        "Year",
        CASE WHEN "Value" = 'NULL' THEN NULL ELSE CAST("Value" AS FLOAT) / 100 END AS "CompStudent_%"
    FROM
        stg_compclass
    WHERE
        "Measure_On" = 'Student' AND
        "Measure_Type" = 'Percentage'
)
SELECT
    tb1.*,
    tb2."CompStudent_%",
 CAST(ROUND("CompStudent_#" / tb2."CompStudent_%") AS INT) AS "AllStudent#"
FROM
    tb1
LEFT JOIN
    tb2
ON
    tb1."School_code" = tb2."School_code" AND 
    tb1."Year" = tb2."Year"
);

