-- drop database HospitalSysmexDB2;
create database HospitalSysmexDB2;
use HospitalSysmexDB2;


-- Create Table

create table if not exists RefereeType(
refereeTypeID int primary key NOT NULL AUTO_INCREMENT,
refereeFrom varchar(30) NOT NULL
) engine = InnoDB ;


create table Referees(
refereeID int primary key NOT NULL AUTO_INCREMENT,
refereeTypeID int,
refFirstName varchar(15) NOT NULL,
refLastName varchar(15) NOT NULL,
foreign key(refereeTypeID) references RefereeType(refereeTypeID)
) engine = InnoDB ;


create table Patient(
patientID int primary key NOT NULL AUTO_INCREMENT,
patientFirstName varchar(20) NOT NULL,
patientLastName varchar(20) NOT NULL,
dob date NOT NULL,
gender enum('Male','Female','other') NOT NULL,
NHI char(7) NOT NULL,
HTA enum('yes','no') NOT NULL
) engine = InnoDB ;


create table Department(
depID int primary key NOT NULL AUTO_INCREMENT,
depName varchar(25) NOT NULL
) engine = InnoDB ;

create table Surgeonss(
empID int primary key NOT NULL AUTO_INCREMENT,
depID int,
surgeonFirstName varchar(20) NOT NULL,
surgeonLastName varchar(20) NOT NULL, 
foreign key(depID) references Department(depID)
) engine = InnoDB ;

create table Reference2(
refID int primary key NOT NULL AUTO_INCREMENT,
refDate date NOT NULL,
FSA date NOT NULL,
WLD date NOT NULL,
empID int,
refereeID int,
patientID int,
foreign key(empID) references Surgeonss(empID),
foreign key(refereeID) references Referees(refereeID),
foreign key(patientID) references Patient(patientID)
) engine = InnoDB ;

-- Insert Table


insert into RefereeType(refereeFrom) 
	values('GP'),('Internal'),('Private'),('Other Hospital');

insert into Referees(refFirstName,refLastname,refereeTypeID)
 values('Hilary','Trump',1),('Bill','Key',1),('Donald','Clinton',1),('Amit','Oliver',2),('Lesley','Young',1),('John','English',1),('Ralph','Smith',1),('Linda','Moore',3),
('Michael','Scott',1),('John','Richards',2),('Linda','Moore',1),('Ralph','Smith',4),('Hilary','Trump',3);

insert into Patient(patientFirstName,patientLastName,dob,gender,NHI,HTA)
  values('Maggie','Boyle','1979-09-12','FEMALE','QDX4955','Yes'),('Faith ','Greene','1972-05-31','MALE','ECP7715','Yes'),('Lacey','Robertson','1944-10-07','FEMALE','ZIK8925','Yes'),
  ('Derek','Olsen','1983-03-31','MALE','LTS6784','Yes'),('Brynn','Oneal','1976-05-27','MALE','HGM6173','Yes'),('Donna','Ballard','1958-08-16','FEMALE','CEV6132','No'),('Jane','Colon','1972-06-07','FEMALE','PGJ7161','Yes'),
  ('Alfonso','Stephens','1980-08-29','MALE','NKX8076','Yes'),('Quinn','Wood','1975-07-24','FEMALE','MXC8908','Yes'),('Isabelle','Lang','1958-12-10','FEMALE','NTQ8299','Yes'),('Olympia','Reynolds','2006-10-06','FEMALE','QNE4372','Yes'),
  ('Lee','Swanson','1964-05-27','MALE','GIR5104','Yes'),('Caryn','Huber','1984-08-29','MALE','XKD2272','Yes'),('Xerxes','Morales','2006-07-19','FEMALE','DVX6602','Yes'),('Graiden','Alexander','1968-10-24','MALE','JIB5920','Yes'),
  ('Dahlia','Boone','2002-05-01','MALE','YCX9278','Yes'),('Fredericka','Rivers','1979-01-30','FEMALE','LMV5416','Yes'),('Hadassah','Dyer','1968-10-01','MALE','YBB1095','Yes'),('Kaye','Crosby','1944-06-20','FEMALE','TBC7855','Yes'),
  ('Mariam','Fitzgerald','1957-06-28','MALE','SXL9274','Yes'),('Dominique','Williamson','1973-09-11','MALE','AUX6004','Yes'),('Isadora','Leach','2007-05-16','MALE','SEO7156','Yes'),('Walter','Riggs','1966-12-06','FEMALE','XUA5670','Yes'),
  ('Lacota','Peterson','2004-04-03','MALE','GMC9989','Yes'),('Wendy','Lester','1978-04-30','FEMALE','SHN9256','Yes'),('Nige','Yang','2004-05-22','FEMALE','XSI7349','Yes'),('Quamar','Kelley','2007-05-07','MALE','NHK9888','Yes'),('Carl','Frye','1948-12-05','MALE','NCR0550','Yes'),
  ('Rama','Lambert','1958-03-15','FEMALE','CNF6489','Yes'),('Tallulah','Woodard','1944-04-16','MALE','MSC5721','Yes'),('Jaden','Boyle','1962-02-05','FEMALE','VWH6907','Yes'),('Boris','Whitley','1946-07-08','FEMALE','GOZ3094','Yes'),
  ('Maris', 'Golden','2004-04-15','MALE','CMZ6415','Yes'),('Maxine','Burks','2004-07-22','FEMALE','TNH6480','Yes'),('Ora','David','1974-01-12','MALE','QIJ3412','Yes'),('Wynter','Baxter','2003-03-23','MALE','BAK4481','Yes'),
  ('Chastity','Collier','1970-03-19','FEMALE','CBD3031','Yes'),('Eric','Buck','1967-02-28','FEMALE','BBB5629','Yes'),('Kay','Young','1949-05-21','Male','SYK7786','Yes'),('Daryl','Hill','1959-05-08','MALE','ODR2838','Yes'),('Melanie','Haney','1965-11-10','MALE','KDD9523','Yes'),
  ('Quinn','Roach','2016-06-29','FEMALE','ASD4088','Yes'),('Felicia','Walls','1975-06-06','MALE','GIQ8970','Yes'),('Hall','Tucker','2005-05-09','MALE','GEK5713','Yes'),('Ignacia','Chandler','1946-07-09','FEMALE','TGS0798','Yes'),('Galvin','Morris','1968-04-05','FEMALE','CYC0720','Yes'),
('Aspen','Mcgee','1980-11-23','MALE','SMH8891','Yes'),('Forrest','Potts','1964-05-09','MALE','FBG1062','Yes'),('Daquan','Nichols','2002-02-26','FEMALE','XKX1957','Yes'),('Cameran','Ellis','2003-04-15','FEMALE','AFH7245','Yes'),('Barrett','Reid','2004-02-08','OTHER','TXP4069','Yes'),
('Tyrone','Ballard','1946-05-14','FEMALE','MRL3058','Yes'),('Hammett','Irwin','1975-03-29','MALE','FVL8648','Yes'),('Eagan','Brooks','2007-12-17','MALE','GKY3212','No'),('Chiquita','Ball','1964-06-02','FEMALE','ETV6899','Yes'),('Caryn','Huber','1984-08-29','MALE','XKD2272','Yes'),
('Eric','Frye','1957-10-04','FEMALE','VFY9388','Yes'),('Summer','Walters','1983-02-25','FEMALE','JBK3991','Yes'),('Madaline','Henderson','1947-12-20','FEMALE','ZYF6173','Yes'),('Jaime','Duffy','1967-07-18','FEMALE','VSV3481','Yes'),('Ruby','James','1957-06-05','FEMALE','MHR6896','Yes'),
('Brian','Shannon','1946-10-05','FEMALE','YDV0095','Yes'),('Gay','Mueller','1975-11-14','MALE','BDF4913','Yes'),('Jonas','Gamble','2005-08-13','FEMALE','IWU6403','Yes'),('Francis','Woods','2005-10-19','FEMALE','BVF7686','Yes'),('Penelope','Sanchez','1965-10-25','MALE','RIQ9260','Yes'),
('Quentin','Guzman','1972-09-29','MALE','MMH2864','Yes'),('Patricia','Higgins','1977-12-09','FEMALE','RWT4192','Yes'),('Brent','Lindsay','1944-09-06','MALE','CYZ8554','Yes'),('Dale','White','1985-07-22','MALE','YBS8538','Yes'),('Warren','Stokes','1947-03-24','FEMALE','VZQ5362','Yes'),
('Howard','Molina','1970-06-27','FEMALE','CST7448','Yes'),('Cairo','Hopkins','2002-10-28','FEMALE','NWM8466','Yes'),('Stacey','Kirk','1959-02-27','FEMALE','LQI3268','Yes'),('Caldwell','Gould','1962-01-01','MALE','LFV3925','Yes'),('Edan','Olsen','1943-10-11','MALE','WHU5837','Yes'),
('Barry','Parker','1970-05-26','FEMALE','ABR7945','Yes'),('Quinn','Nicholson','1972-05-09','FEMALE','PLL2090','Yes'),('Tucker','Combs','2003-04-24','FEMALE','MFO6152','Yes'),('Kay','Young','1949-05-21','FEMALE','SYK7786','Yes'),('Xantha','Huber','1961-12-18','FEMALE','TWT8902','Yes'),
('Breanna','Vaughn','1967-05-06','MALE','WHL2345','Yes'),('Justine','Dean','1982-10-11','FEMALE','WSU4675','Yes'),('Uriah','Turner','1970-08-11','FEMALE','OBR6693','Yes'),('Idola','Barlow','1946-09-07','FEMALE','DPB3234','Yes'),('Melodie','Paul','1964-12-01','FEMALE','YSN6005','Yes'),
('Yuli','Frank','2007-05-31','MALE','FDM8849','Yes'),('Christine','Olsen','2003-03-26','OTHER','FQI2958','Yes'),('Cadman','Porter','1968-05-25','MALE','AFC3291','Yes'),('Molly','Haney','1969-07-19','MALE','OJC2233','Yes'),('Alana','Lucas','2005-07-25','FEMALE','NPF7673','Yes'),
('Armando','Moran','1972-01-12','FEMALE','ISJ1177','Yes'),('Oscar','Crane','2003-12-14','FEMALE','GDR6737','Yes'),('Summer','Thomas','1951-08-09','FEMALE','STU8856','Yes'),('Eagan','Brooks','2007-12-17','MALE','GKY3212','Yes'),('Joy','Walters','1972-08-16','MALE','CLZ1078','Yes'),
('Hoyt','Hester','1964-10-20','FEMALE','PZD7227','Yes'),('Duncan','Lucas','1955-10-19','FEMALE','CCB6831','Yes'),('Valentine','Moran','1964-04-26','FEMALE','IXF4149','Yes'),('Alan','Peterson','1957-09-29','FEMALE','NIV5772','Yes');


insert into Department(depName) 
  values('General Surgery'),('Cardiothoracic'),('Plastics'),('Orthopaedics'),('Paediatric Surgery'); 
  
  insert into Surgeonss(surgeonFirstName,surgeonLastName,depID)
values('Simon','Frampton',1),('Peri','Duffy',2),('Steve','Renison',2),('Richard','Cain',3),('Philip','Mitchell',3),('Evelyn','Rae',4),('Greta','McLean',3),
('Nabaz','Sayeed',5),('John','Martin',1),('Michael','Lewis',5),('Karen','Reid',1),('Lindsay','Nelson',4),('Andy La','Salle',2),
('Andrew','Hood',5),('Robert','Patrick',4);

load data local infile 'H:\\reference.csv'
into table Reference2 
fields terminated by ','                   
lines terminated by '\n'
(refDate,FSA,WLD,empID,refereeID,patientID);

 
-- Select Table

select * from Reference2;

select * from Surgeonss;

select * from Department;

select * from Patient;

select * from Referees;

select * from RefereeType;

