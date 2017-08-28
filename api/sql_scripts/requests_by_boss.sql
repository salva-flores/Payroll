select (select boss.id
from main_company_structure cs
inner join main_employee e ON cs.unitId = e.companyUnitId
inner join main_employee boss ON cs.parentUnitId = boss.companyUnitId
inner join cat_company_unit cu on cs.unitId = cu.id
where e.id = emp.id) as Boss,
emp.firstName as Empleado, 
r.id, r.date, r.startTime, r.estimatedTime, r.requestedBy, r.description  
from pay_overtime_request r 
inner join main_employee emp on r.employeeId = emp.id
where r.state='Pendiente' 
order by emp.firstName;
