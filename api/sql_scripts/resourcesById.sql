SELECT
			r.id,
			r.typeId,
			rt.name,
			r.name,
			r.description,
			
			r.icon,
			r.state
			 
FROM
			 sec_profile p
INNER JOIN
			 sec_profile_resource pr ON p.id = pr.profileId
INNER JOIN
			 sec_resource r ON pr.resourceId = r.id
INNER JOIN
			 sec_resource_type rt ON r.typeId = rt.id			 
WHERE

p.id=1
