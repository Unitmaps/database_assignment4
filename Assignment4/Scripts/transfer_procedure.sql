create or replace procedure transfer_employee(
    employeeId int,
    prev_dept_id int,
    new_dept_id int
)
language plpgsql
as $$
begin
    delete from employees_departments 
    where employee_id = employeeId and department_id = prev_dept_id;
    
    insert into employees_departments (employee_id, department_id) 
    values (employeeId, new_dept_id);
end;
$$;