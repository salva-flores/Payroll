select e.firstName , cs.unitId, cs.parentUnitId
from main_company_structure cs
inner join main_employee e ON cs.unitId = e.companyUnitId
where e.id = 4