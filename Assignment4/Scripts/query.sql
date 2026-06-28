create index employee_id_status
on employees(id, status);

create index salary_amount
on salaries(employee_id, amount);

create index project_id_status
on projects(id, status);

create index emp_on_projects
on employees_on_projects(employee_id, project_id);

explain analyze

select e.full_name, d.name as department, s.amount as salary, count(p.id) as project_count, sum(p.budget) as total_budget
from employees e
join salaries s on e.id = s.employee_id
join employees_departments ed on e.id = ed.employee_id
join departments d on ed.department_id = d.id
join employees_on_projects ep on e.id = ep.employee_id
join projects p on ep.project_id = p.id
where e.status = 'active' and p.status = 'planning'
group by e.full_name, d.name, s.amount
order by s.amount desc
limit 5

