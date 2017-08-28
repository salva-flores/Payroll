select r.id as employeeId, d.activityDate, d.startTime, d.endTime
from pay_overtime_detail d 
inner join pay_overtime_request r on d.requestId = r.id 
inner join main_employee e on r.employeeId = e.id
order by e.id, d.activityDate, d.startTime