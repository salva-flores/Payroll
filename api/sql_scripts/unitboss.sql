SELECT cu.name as Departamento, e.id, e.firstName as Jefe, e.email 
from main_company_structure cs 
inner join main_employee e ON cs.headId = e.id 
inner join cat_company_unit cu on cs.unitId = cu.id 
where cs.unitId = 1