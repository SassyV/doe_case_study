CREATE OR REPLACE  TABLE stg_attendance AS (
WITH up_atte  AS (
    UNPIVOT raw_attendance
    ON COLUMNS(* EXCLUDE ("school_code","school_name"))
    INTO
        NAME Year
        VALUE Value
) 
SELECT * FROM up_atte
);