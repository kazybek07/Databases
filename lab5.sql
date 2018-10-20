Create database lab4;
CREATE table Warehouses(
  code serial primary key,
  location varchar(255),
  capacity integer
);

create table Boxes(
  code character(4),
  contents character varying(255),
  value real,
  warehouse integer,
  foreign key (warehouse) references Warehouses(code)
);
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(2,'Chicago',4);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);

 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4H8P','Rocks',250,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4RT3','Scissors',190,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('7G3H','Rocks',200,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8JN6','Papers',75,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8Y6U','Papers',50,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('9J6F','Papers',175,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('LL08','Rocks',140,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P0H6','Scissors',125,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P2T6','Scissors',150,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('TU55','Papers',90,5);



SELECT * from Warehouses;
SELECT contents, value from boxes where value >=50 and value <=150;
SELECT distinct on(code) *from Boxes;
SELECT warehouse, count(contents) from boxes group by warehouse;
select warehouse, value from boxes where contents = 'Papers';
insert into Warehouses (location, capacity) values ('New York', 3);
insert into Boxes values ('H5RT', 'Papers', 200, 2);
update Boxes set value = value * 0.8 where value = (select value from Boxes limit 1 offset 2);
delete from Boxes where value < 150;
delete from Warehouses where location in (select location from warehouses where location = 'New York') returning  Warehouses;
delete from Boxes where warehouse in (select code from warehouses where location = 'New York');