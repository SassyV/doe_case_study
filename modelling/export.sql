COPY fact_compclass TO 'export/fact_compclass.csv' (HEADER, DELIMITER ',');
COPY fact_compstudent TO 'export/fact_compstudent.csv' (HEADER, DELIMITER ',');
COPY dim_school TO 'export/dim_school.csv' (HEADER, DELIMITER ',');
COPY fact_attendance TO 'export/fact_attendance.csv' (HEADER, DELIMITER ',');