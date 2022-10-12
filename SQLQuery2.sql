create table Students(
	Name varchar(30),
	Code varchar(20) primary key,
	BirthDay date,
	IdClass varchar(20) foreign key references Class(Code)
);
create table Class(
	Name varchar(30),
	Code varchar(20) primary key,
	Room int
);
create table Subjects(
	Name varchar(30),
	Code varchar(20) primary key
);
create table Result(
	Id varchar(255) primary key,
	Score int,
	Result varchar(10),
	IdStudens varchar(20) foreign key references Students(Code),
	IdSubjects varchar(20) foreign key references Subjects(Code)
);





drop table Students;