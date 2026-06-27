create role administrator with LOGIN PASSWORD 'admin';
grant all privileges on all tables in schema public to administrator;

create role manager_hr with LOGIN PASSWORD 'hrmanager';
grant select, insert, update on employees, salaries, departments to manager_hr;

create role analyst with LOGIN password 'analyst';
grant select on all tables in schema public to analyst;