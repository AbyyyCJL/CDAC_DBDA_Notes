
create database fxn_proc;

use fxn_proc;

#  Create a stored function by the name of Age_calc. Your stored function should accept the date of birth of a person as a parameter. The stored function should
# calculate the age of the person in years. The stored function should return the age in years.


delimiter $$
create function Age_calc(bir_date date)
returns int 
deterministic
begin
	declare no_of_yrs int;
    select (year(curdate()) - year(bir_date)) into no_of_yrs;
    
    return no_of_yrs;
end;;
$$

delimiter ;

drop function Age_calc;

select Age_calc('2002-05-27');

DELIMITER $$

CREATE FUNCTION Age_calc(bir_date DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE no_of_yrs INT;
    DECLARE current_year INT;
    DECLARE birth_year INT;
    DECLARE birth_month INT;
    DECLARE birth_day INT;
    DECLARE current_month INT;
    DECLARE current_day INT;

    -- Extract current date components
    SET current_year = YEAR(CURDATE());
    SET current_month = MONTH(CURDATE());
    SET current_day = DAY(CURDATE());

    -- Extract birthdate components
    SET birth_year = YEAR(bir_date);
    SET birth_month = MONTH(bir_date);
    SET birth_day = DAY(bir_date);

    -- Calculate initial age
    SET no_of_yrs = current_year - birth_year;

    -- Adjust age if the birthday has not occurred yet this year
    IF (current_month < birth_month) OR (current_month = birth_month AND current_day < birth_day) THEN
        SET no_of_yrs = no_of_yrs - 1;
    END IF;

    RETURN no_of_yrs;
END$$

DELIMITER ;

