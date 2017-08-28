select u.id as User, e.firstName
from sec_user u
inner join main_employee e on u.employeeId = e.id
where u.employeeId='4'