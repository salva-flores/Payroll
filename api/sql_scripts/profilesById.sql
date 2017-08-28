SELECT
			 r.id,
			 r.name,
			 r.description,
			 r.object,
			 r.idtype,
			 rt.name AS nameType,
			 pr.idrecurso
FROM
			 sec_resource r
INNER JOIN
			 sec_resourcetype rt ON r.idtype = rt.id
INNER JOIN
			 sec_profiles_resource pr ON r.id = pr.idrecurso 
			 where pr.idperfil = '1sec_resource'
