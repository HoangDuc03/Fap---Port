select * from CountView

insert into CountView values(0)

update CountView
set viewed = viewed + 1

delete CountView
where viewed = 1