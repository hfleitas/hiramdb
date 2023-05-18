-- This file contains SQL statements that will be executed after the build script.
merge into settings as Target 
using (values 
	(1),  
	(2), 
	(3), 
	(4), 
	(5), 
	(6), 
	(7), 
	(8), 
	(9),
	(10),
	(11)
) 
as Source (id) 
on Target.id = Source.id 

-- update matched rows, update other columns that need static values.
when matched then 
update set id = Source.id 

-- insert new rows 
when not matched by Target then
insert (id) 
values (id) 

-- delete rows that are in the target but not the source 
when not matched by Source then 
delete;
GO
