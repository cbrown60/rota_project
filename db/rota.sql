DROP TABLE schedules; 
DROP TABLE shifts;
DROP TABLE employees; 


CREATE TABLE employees (
id SERIAL4 PRIMARY KEY,
name VARCHAR(255),
hours_wanted INT2,
hourly_rate DECIMAL(8,2)
);

CREATE TABLE shifts (
  id SERIAL4 PRIMARY KEY, 
  start_time TIME,
  end_time TIME 
);

CREATE TABLE schedules (
id SERIAL4 PRIMARY KEY, 
employee_id INT4 REFERENCES employees(id) ON DELETE CASCADE,
shift_id INT4 REFERENCES shifts(id) ON DELETE CASCADE,
shift_date DATE
);
