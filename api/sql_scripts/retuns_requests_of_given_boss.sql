select emp.firstName, r.*
from main_company_structure cs
inner join main_employee emp ON cs.unitId = emp.companyUnitId
inner join main_employee boss ON cs.parentUnitId = boss.companyUnitId
inner join cat_company_unit cu on cs.unitId = cu.id
inner join pay_overtime_request r on emp.id = r.employeeId
where boss.id=29
