select w.name, wd.name, wd.sequence, wd.input, wd.actors
from sys_workflow_detail wd
inner join sys_workflow w on wd.workflow = w.id
view_users