create table Published(
	PId varchar(20) primary key,
	Name nvarchar(255) not null ,
	Address nvarchar(255) not null,
);

create table Types(
	TpId varchar(20) primary key,
	Name nvarchar(255) not null
);

create table Authors(
	AtId int primary key,
	Name nvarchar(255) not null
);

create table Books(
	BId varchar(20) primary key,
	Name nvarchar(255) not null,
	Description nvarchar(255) ,
	YearPublished int not null,
	PublishedCount int not null,
	Price int not null,
	Stock int not null,
	PId varchar(20) not null foreign key references Published(PId),
	TpId varchar(20) not null foreign key references Types(TpId)
);

create table BookAuthors(
	BId varchar(20) not null foreign key references Books(BId),
	AtId int not null foreign key references Authors(AtId)
);

--drop table BookAuthors;
--drop table Books;
--drop table Authors;
--drop table Types;
--drop table Published;


insert into Published(PId,Name,Address)
	values('P001',N'Tri Thức',N'53 Nguyễn Du, Hai Bà Trưng, Hà Nội'),
		('P002',N'Kim Đồng',N' Số 55 Quang Trung, Nguyễn Du, Hai Bà Trưng, Hà Nội'),
		('P003',N'Giáo dục',N' Số 81 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội');

insert into Types(TpId,Name)
	values('T001',N'Giáo Trình'),
		('T002',N'Khoa học xã hội'),
		('T003',N'Văn học'),
		('T004',N'Sách thiếu nhi');

insert into Authors(AtId,Name)
	values(001,N'Eran Katz'),
		(002,N'Neung In Publishing Company'),
		(003,N'Erich Auerbach'),
		(004,N'Đào Hữu Vinh');

insert into Books(BId,Name,Description,YearPublished,PublishedCount,Price,Stock,PId,TpId)
	values ('B001',N'Trí tuệ Do Thái',N'Bạn có muốn biết: Người Do Thái sáng tạo ra cái gì và nguồn gốctrí tuệ của họ xuất phát từ đâu không?',
	2010,1,79000,100,'P001','T002'),
		('B002',N'DANH NHÂN THẾ GIỚI- LINCOLN',N'Abraham Lincoln là người đề cao chủ nghĩa bình đẳng, là người đã đem lại tự do và bảo vệ quyền lợi cho tầng lớp nô lệ da đen nên được mệnh danh là người Cha của họ. ',
	2012,2,27000,150,'P002','T004'),
		('B003',N'Tài liệu chuyên Hóa Học lớp 12',N'Nhằm giúp các bạn ôn thi thật tốt cho kì thi THPTQG,...',
	2020,1,120000,200,'P003','T001'),
		('B004',N'Mimesis phương thức thể hiện thực tại trong văn học phương Tây',N'Tác phẩm là chuyên luận nghiên cứu văn bản so sánh được giới nghiên cứu phương Tây đánh giá như một trong những cuốn sách phê bình văn học kinh điển của nghiên cứu văn học phương Tây trong thế kỷ XX.',
	2014,5,210000,60,'P001','T003');

insert into BookAuthors(BId,AtId)
	values('B001',001),
		('B002',002),
		('B003',004),
		('B004',003);

select Name from Books where YearPublished > 2008;
select Name, MAX(Price) FROM Books GROUP BY Name;
select * from Books where Name like N'% tuệ %';
select * from Books where Name like N'%t%'order by Price desc;
select * from Books where PId in (select PId from Published where Name like N'Tri Thức');
select * from Published where PId in (select PId from Books where Name like N'Trí tuệ Do Thái');
