--câu số 2
create table People(
	PId varchar(20) primary key,
	PName nvarchar(255) not null,
	Address nvarchar(255) not null,
	Birthday date 
);

create table PhoneBook(
	PbId varchar(20) primary key,
	PhoneNumber varchar(100) not null,
	PId varchar(20) foreign key references People(PId)
);

--câu số 3
insert into People(PId,PName,Address,Birthday)
	values('P001',N'Nguyễn Văn An',N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội','1987/11/18'),
		('P002',N'Trần Thị Lan',N'56 Mĩ Đình, Nam Từ Liêm, Hà Nội','2001/12/03'),
		('P003',N'Nguyễn Mạnh Hùng',N'94 Đông Me, Nam Từ Liêm, Hà Nội','1995/03/24'),
		('P004',N'Phạm Thùy Linh',N'16 Hoàng Đạo Thúy, THanh Xuân, Hà Nội','2009/12/12'),
		('P005',N'Vũ Tuấn Anh',N'25 Đội Cấn, Ba Đình, Hà Nội','2000/10/03');
delete from People;
delete from PhoneBook;
insert into PhoneBook(PbId,PhoneNumber,PId)
	values('B001','0356988741','P002'),
		('B002','0396520112','P001'),
		('B003','0836987451','P002'),
		('B004','0972354660','P005'),
		('B005','0288936523','P003'),
		('B006','0865323986','P004'),
		('B007','123456789','P005'),
		('B008','0386994123','P003');
 --câu số 4
select * from People;
select * from PhoneBook;

--câu số 5
select * from People order by PName asc;
select * from PhoneBook where PId in (select PId from People where PName like N'Nguyễn Văn An');
select * from People where Birthday = '2009/12/12';

--câu số 6
select count( PhoneNumber) as count_sđt, PId from PhoneBook group by PId  ;

select PhoneBook.PhoneNumber, People.* from People inner join PhoneBook on PhoneBook.PId = People.PId ;
select * from People where PId in(select PId from PhoneBook where PhoneNumber like '123456789');

--câu số 7

alter table People add ContactDate date;


--câu số 8.a
create index IX_HoTen on People(PName);
create index IX_SoDienThoai on PhoneBook(PhoneNumber);

--câu số 8.b
create view View_SoDienThoai as select People.PName, PhoneBook.PhoneNumber from People inner join PhoneBook on People.PId = PhoneBook.PId;

--câu số 8.c
create procedure SP_Them_DanhBa @PId varchar(20), @PName nvarchar(255), @Address nvarchar(255), @Birthday date 
	as
	insert into People(PId,PName,Address,Birthday)
		values('B006',N'Nguyễn Lan Anh',N'59 Đồng Me, Nam Từ Liêm, Hà Nội','2003/12/11');
select * from People;
exec SP_Them_DanhBa;
drop procedure SP_Them_DanhBa;



