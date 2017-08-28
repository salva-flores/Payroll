create view users
as SELECT u.id as UserId, m.firstName as Name, m.id as EmployeeId
FROM main_employee m
INNER JOIN sec_user_emp u ON m.id = u.employeeId
order by u.id asc;

select * from users;