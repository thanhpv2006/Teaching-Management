-- Chi doc; chay bang BTL app_user trong Workbench.
USE teaching_management;
SELECT CURRENT_USER() AS mysql_account,DATABASE() AS schema_name,VERSION() AS mysql_version;
SHOW GRANTS;
SELECT * FROM v_class_roster LIMIT 5;
SELECT * FROM v_student_grades LIMIT 5;
SELECT * FROM v_tuition_summary LIMIT 5;
