select r.employeeId, u.userName as Usuario, e.firstName as Empleado, count(r.estimatedTime) as Solicitudes, sum(r.estimatedTime) as Horas
from pay_overtime_request r
inner join main_employee e on r.employeeId=e.id
inner join sec_user u on r.employeeId=u.employeeId
group by r.employeeId