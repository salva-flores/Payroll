SELECT
  e.id, e.firstName
FROM
  main_employee e
LEFT OUTER JOIN
  sec_user_emp ue
ON
  e.id = ue.employeeId
WHERE
  ue.employeeId IS NULL