create view active_employee_info as
	select e.full_name, e.email, p.name as project_name, ep.role_on_project, ep.joined_at
	from employees e
	join employees_on_projects ep on e.id = ep.employee_id
	join projects p on ep.project_id = p.id
	where e.status = 'active' and p.status = 'active';

select *
from active_employee_info