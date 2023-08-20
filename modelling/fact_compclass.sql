CREATE OR  REPLACE TABLE fact_compclass AS
(
WITH tb1 AS (
    SELECT
        "School code" AS "School_code",
        "Year",
        CAST("Value" AS INT) AS "CompClass_#"
    FROM
        stg_compclass
    WHERE
        "Measure_On" = 'Class' AND
        "Measure_Type" = 'Number'
),
tb2 AS (
    SELECT
        "School code" AS "School_code",
        "Year",
        CASE WHEN "Value" = 'NULL' THEN NULL ELSE CAST("Value" AS FLOAT) / 100 END AS "CompClass_%"
    FROM
        stg_compclass
    WHERE
        "Measure_On" = 'Class' AND
        "Measure_Type" = 'Percentage'
)
SELECT
    tb1.*,
    tb2."CompClass_%",
 CAST(ROUND("CompClass_#" / tb2."CompClass_%") AS INT) AS "AllClass#"
FROM
    tb1
LEFT JOIN
    tb2
ON
    tb1."School_code" = tb2."School_code" AND 
    tb1."Year" = tb2."Year" 
);

