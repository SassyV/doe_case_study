CREATE TABLE raw_compclass AS 
SELECT * FROM  read_csv_auto('/workspaces/doe_case_study/data/2022-multi-age_composite-classes-final.csv');