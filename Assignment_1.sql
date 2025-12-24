create database Passenger;
create table passenger(
passenger_name varchar(30) not null,
Category varchar(30) not null,
Gender varchar(30) not null,
Boarding_station varchar(30) not null,
Dest_station varchar(30) not null,
Distance int not null,
Compartment varchar(30) not null
);
insert into passenger(passenger_name,Category,Gender,Boarding_station,Dest_station,Distance,Compartment)values
('Sam','General','M','Chennai','Bangalore',350,'AC'),
('Charlie','Tatkal','M','Hyderabad','Mumbai',700,'NON-AC'),
('Tina','General','F','Bangalore','Goa',600,'AC'),
('Carl','General','M','Mumbai','Chennai',1500,'AC'),
('Sarah','Tatkal','F','Goa','Trivandrum',1000,'AC'),
('John','General','M','Hyderabad','Nagpur',500,'NON-AC'),
('Linda','Tatkal','F','Mumbai','Goa',700,'AC'),
('Mike','Tatkal','M','Bangalore','Hyderabad',500,'NON-AC'),
('chris','General','M','Nagpur','Pune',700,'NON-AC');
select * from passenger;
select Gender,count(*) from passenger where Distance>=600 group by Gender;
select * from passenger where passenger_name like 's%';
select Distance from passenger where Distance>500;
select Compartment,count(*) from passenger group by Compartment;
select Boarding_station,count(*) from passenger where Boarding_station='Mumbai';
select passenger_name,Boarding_station,Distance,Category from passenger where Category='Tatkal';
select * from passenger where Boarding_station in ('Chennai','Nagpur');
select Boarding_station from passenger order by Boarding_station asc;
create table Price(
Compartment varchar(20) not null,
Distance int not null,
Price int not null
);
use dummy;
insert into Price(Compartment,Distance,Price) values
('AC',350,770),('AC',500,1100),('AC',600,1320),('AC',700,1540),
('AC',1000,2200),('AC',1200,2640),('AC',1500,3300),('NON-AC',350,434),
('NON-AC',500,620),('NON-AC',600,744),('NON-AC',700,868);
insert into Price(Compartment,Distance,Price) values
('NON-AC',1000,1240),
('NON-AC',1200,1488),('NON-AC',1500,1860);
select * from Price;
show tables;
select min(Price) from Price where Compartment='AC';
select max(Price) from Price where Compartment='NON-AC';
select p.Price from Price p inner join passenger pp on p.Distance=pp.Distance where pp.Boarding_station='Chennai'and pp.Dest_station='Bangalore' and p.Compartment='AC';
select count(*) from passenger where Category='Tatkal';
select Boarding_station from passenger where Category='General';
select max(Price),Compartment from Price group by Compartment;
select Price from Price where Distance=700;
select Boarding_station,count(*) from passenger where Boarding_station='Hyderabad' group by Boarding_station;
select Gender,count(*) from passenger group by Gender;
select Passenger_name,Gender,Boarding_station from passenger;
select p.Price from Price p join passenger pp on p.Distance=pp.Distance where pp.Boarding_station='Mumbai'and pp.Dest_station='Goa' and p.Compartment='AC';
select distinct(Boarding_station) from passenger;
