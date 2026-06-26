-- use harryjoins; 
-- select * from employees;
-- select first_name from employees;

-- DELIMITER //
-- CREATE PROCEDURE list_employees()

-- begin
-- select * from employees;
-- select first_name from employees;

-- end//

-- DELIMITER ;

call list_employees();