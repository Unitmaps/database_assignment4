# database_assignment4
## ERD explanation
<img width="864" height="1076" alt="postgres 3 - postgres - public" src="https://github.com/user-attachments/assets/3d146ec7-e53b-4cc2-991a-1df5a9b9dd67" />  
## Solution explanation
Solution consists of a view, a trigger, a procedure and a test query for explain - analyze check. Additionally, 3 roles for access control were created.  
View `active_employee_info` returns all active employees on active projects, their name, role, email, date of join and project name. Useful for quick display of active processes. Trigger `make_inactive` is executed before update on the table employees when `fired_at` status changes from NULL to date. It executes a 
