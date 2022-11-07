create table Categories(
  CateID char(6) primary key,
  CateName nvarchar(100) not null unique,
  Description nvarchar(200)
);
create table Parts(
  PartID int Primary key identity,
  PartName nvarchar(100) Not null unique,
  CateID char (6) Foreign Key references Categories (CateID),
  Description nvarchar(1000),
  Price decimal(12,0) Not null default 0,
  Quantity int default 0,
  Warranty int default 1,
  Photo nvarchar (200) check(Photo like 'photo/%') default 'photo/nophoto.png'
);
INSERT into Categories(CateID, CateName, Description)
 VALUES (1,'RAM','Random Access Memory'),
 (2,'CPU','Central Processing Unit'),
 (3,'SSD','Soid State');
select * from Categories;

INSERT into Parts(PartName, CateID, Description, Price, Quantity, Warranty,Photo)
    VALUEs(N'Ram Kingston Fury Beast RGB',1,N'Dung lượng: 16GB,Bus: 5600MHz',199,99,9,'photo/ram123.png'),
	(N'Ram Corsair RGB',2,N'Dung lượng: 18GB,Bus: 5600MHz',300,99,9,'photo/ram456.png'),
	(N'Ram Adata RGB',3,N'Dung lượng: 28GB,Bus: 5600MHz',500,99,9,'photo/ram456.png');
	
select * from Parts;

--4

select * from Parts where Price>100;

--5

select * from Parts where CateID in (select CateID from Categories where CateName like 'CPU');

--6

CREATE VIEW v_Parts AS
select a.PartID,a.PartName,b.CateName,a.Price,a.Quantity from Parts a 
left join Categories b on a.CateID = b.CateID;

select * from v_Parts;


create view v_TopParts as
select top 5 PartName from Parts order by Price desc;
select * from v_TopParts;