create or replace function update_status()
returns trigger
as $$
begin
	new.status := 'terminated';    
	return new;
end;
$$ language plpgsql;

create trigger make_inactive
before update on employees
for each row
when (old.fired_at is null and new.fired_at is not null)
execute function update_employee_status();