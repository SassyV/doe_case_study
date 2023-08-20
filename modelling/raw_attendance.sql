CREATE TABLE raw_attendance AS 
SELECT * FROM  read_csv_auto('/workspaces/doe_case_study/data/2022-attendance-data-final.csv');