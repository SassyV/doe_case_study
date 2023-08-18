CREATE OR REPLACE  TABLE stg_compclass AS 
(
WITH up_comp AS (
    UNPIVOT raw_compclass
    ON COLUMNS(* EXCLUDE ("School code","School Name"))
    INTO
        NAME "Column_Name"
        VALUE Value
) 
SELECT  "School code",
    CASE WHEN POSITION('PCT' IN "Column_Name") > 0 THEN 'Percentage' ELSE 'Number' END AS Measure_Type,
    CASE WHEN POSITION('STUDENT' IN "Column_Name") > 0 THEN 'Student' ELSE 'Class' END AS Measure_On,
   CAST(SPLIT_PART("Column_Name", '_', -1) AS INT)+2000 AS Year,
   Value 
   FROM up_comp
);