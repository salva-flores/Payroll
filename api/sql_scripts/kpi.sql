select MONTHNAME(date) as Mes, count(*) as Solicitudes, sum(r.estimatedTime) as Horas, 
(select count(*)
from pay_overtime_request r
where MONTH(r.dateTimeStamp)=month(date) and r.state='Pendiente') as Pendientes
from pay_overtime_request r
where MONTH(r.dateTimeStamp)=month(date)