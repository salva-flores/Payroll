//Devuelve el nombre del jefe de un empleado dado

select boss.firstName as Jefe
from main_company_structure cs
inner join main_employee e ON cs.unitId = e.companyUnitId
inner join main_employee boss ON cs.parentUnitId = boss.companyUnitId
inner join cat_company_unit cu on cs.unitId = cu.id
where e.id = 30

