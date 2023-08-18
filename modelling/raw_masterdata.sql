CREATE TABLE raw_masterdata AS 
SELECT * FROM  read_csv_auto('/workspaces/doe_case_study/data/public_school_nsw_master_dataset.csv');