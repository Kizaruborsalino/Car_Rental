create schema Car_Rental;

CREATE TABLE CAR
(Car_ID integer primary key auto_increment,
Class varchar(20),
License_plate varchar(20),
Make varchar(15),
Model varchar(20),
Year_made year,
Color varchar(20),
Location_ID integer,
unique (License_plate)
);

Create Table Location
(Location_ID integer primary key auto_increment,
Location_name varchar(20)
);

Create Table Customer
(Customer_ID integer primary key auto_increment,
Driver_License varchar(20),
First_name varchar(20),
Last_name varchar(20),
Phone_number varchar(20),
Address_ID integer
);

Create Table Employee
(Employee_ID integer primary key auto_increment,
Driver_License varchar(20),
First_name varchar(20),
Lat_name varchar(20),
Phone_number varchar(20),
Employee_Type enum('DRIVER', 'CLERK', 'CLEANER', 'MANAGER'),
Address_ID integer
); 

Create table Rental
(Rental_ID integer primary key auto_increment,
Rental_policy enum('ONE_DAY', 'ONE_WEEK', 'TWO_WEEKS', 'ONE_MONTH'),
Dropoff_charge varchar(20),
Rent_duration varchar(20),
Upgraded bool,
Date_rented date,
Date_returned date,
Odometer_reading integer,
Fuel_volume enum('EMPTY', 'QUARTER_FULL', 'HALF_FULL', 'FULL'),
Rented_location integer,
Drop_off_location integer
);

Create Table Car_Class
(Car_class_ID integer primary key auto_increment,
price float,
class enum('SEDAN', 'COMPACT', 'SUB_COMPACT', 'LUXURY')
);

show tables;

Alter table Car ADD FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID) on delete cascade;

Alter table Location add column Address_ID integer;
Alter table Location ADD FOREIGN KEY (Address_ID) REFERENCES Address(Address_ID) on delete cascade;

Create Table Address
(Address_ID integer primary key auto_increment,
Street Char(10),
Street_Number char(10),
City char(20),
Province char(20),
Postal_code char(6),
Unique (Street, Street_number, City, Province)
);

Alter table Customer ADD FOREIGN KEY (Address_ID) REFERENCES Address (Address_ID) on delete cascade;

Alter table Employee ADD FOREIGN KEY (Address_ID) REFERENCES Address (Address_ID) on delete cascade;

Alter table Rental ADD FOREIGN KEY (Rented_location) REFERENCES Location (Location_ID) on delete cascade;
Alter table Rental ADD FOREIGN KEY (Drop_off_location) REFERENCES Location (Location_ID) on delete cascade;

show tables;


insert into Car(Class, License_Plate, Make, Year_made, Color) values ('LUXURY', 'KCR456J', 'PORSCHE', 2018, 'BURGUNDY');
insert into Car(Class, License_Plate, Make, Year_made, Color)values ('LUXURY', 'KDC286C', 'MERCEDES', 2018, 'MAGENTA_BLACK');
insert into Car(Class, License_plate, Make, Year_made, Color) values ('SEDAN', 'KBR235J', 'MAZDA',  2017, 'SILVER');

select * from Car;
insert into Car(Class, License_plate, Make, Model, Year_made, Color) values ('SEDAN', 'KCR286B', 'TOYOTA', 'CROWN', 2015, 'GREY');
insert into Car(Class, License_Plate, Make, Model, Year_made, Color) values ('COMPACT', 'KDA534H', 'MISSAN', 'SENTRA', 2023, 'LONG BEACH BLUE');
insert into Car(Class, License_Plate, Make, Model, Year_made, Color) values ('SUB_COMPACT', 'KCR156Y', 'HYUNDAI', 'ACCENT', 2022, 'MINT GREEN');

insert into Location(Location_name) values ('Coventry');
insert into Location(Location_name) values ('Shibuya');
insert into Location(Location_name) values('Beverly Hills');
insert into Location(Location_name) values ('Chicago');
insert into Location(Location_name) values ('York');
insert into Location(Location_name) values ('Canterbury');

select * from Location;
 insert into Customer(Driver_license, First_name, Last_name, Phone_number) values ('Aokiji21', 'AOKIJI', 'KUZAN', '+44 7951 020543');
 insert into Customer(Driver_license, First_name, Last_name, Phone_number) values ('Fujitora99', 'ADMIRAL', 'FUJITORA', '+44 7129 8055021');
 insert into Customer(Driver_license, First_name, Last_name, Phone_number) values ('Doflamingo01', 'DONQUIXOTE', 'DOFLAMINGO', '+44 7215 537456');
 insert into Customer(Driver_license, First_name, Last_name, Phone_number) values ('Kizaru02', 'KIZARU', 'BORSALINO', '+44 7950 995401');
 insert into Customer(Driver_license, First_name, Last_name, Phone_number) values ('Itachi10', 'ITACHI', 'UCHIHA', '+44 7435 7994231');
 insert into Customer(Driver_license, First_name, Last_name, Phone_number) values ('Madara00', 'MADARA', 'UCHIHA', '+ 44 7749 8502145');
 
 Alter table Employee rename column Lat_name to Last_name;
 
insert into Employee(Driver_license, First_name, Last_name, Phone_number, Employee_Type) values ('Mereleona23', 'MEREOLEONA', 'VERMILLION', '+44 7124 546721', 'MANAGER');
insert into Employee(Driver_license, First_name, Last_name, Phone_number, Employee_Type) values ('Julius11', 'JULIUS', 'NOVACHRONO', '+44 7245 453609', 'MANAGER');
insert into Employee(Driver_license, First_name, Last_name, Phone_number, Employee_Type) values ('Nozel05', 'NOZEL', 'SILVA', '+44 7154 658976', 'CLERK');
insert into Employee(Driver_license, First_name, Last_name, Phone_number, Employee_Type) values ('Sister12', 'SISTER', 'LILY', '+44 7231 278950', 'CLEANER');
insert into Employee(Driver_license, First_name, Last_name, Phone_number, Employee_Type) values ('Mieczyslaw7', 'MIECZYSLAW', 'STILINSKI', '+44 7235 678653', 'DRIVER');
insert into Employee(Driver_license, First_name, Last_name, Phone_number, Employee_Type) values ('Alison54', 'ALISON', 'ARGENT', '+44 7345 687432', 'DRIVER');

SELECT * FROM EMPLOYEE;

insert into Rental(Rental_policy, Dropoff_charge, Rent_duration, Upgraded, Date_rented, Date_returned, Odometer_reading, Fuel_volume) values ( 'ONE_WEEK', '5%', '2_WEEKS', '1', '2023-01-15', '2023-01-29', 4190, 'FUll');
insert into Rental(Rental_policy, Dropoff_charge, Rent_duration, Upgraded, Date_rented, Date_returned, Odometer_reading, Fuel_volume) values ( 'ONE_WEEK', '8%', '1_WEEK', '0', '2023-01-15', '2023-01-23', 11160, 'HALF_FULL');
insert into Rental(Rental_policy, Dropoff_charge, Rent_duration, Upgraded, Date_rented, Date_returned, Odometer_reading, Fuel_volume) values ('ONE_MONTH', '15%', '1_MONTH', '0', '2023-01-12', '2023-02-12', 19160, 'QUARTER_FULL');
insert into Rental(Rental_policy, Dropoff_charge, Rent_duration, Upgraded, Date_rented, Date_returned, Odometer_reading, Fuel_volume) values ('TWO_WEEKS', '5%', '3_WEEKS', '1', '2023-02-01', '2023-02-22', 24890, 'EMPTY');
insert into Rental(Rental_policy, Dropoff_charge, Rent_duration, Upgraded, Date_rented, Date_returned, Odometer_reading, Fuel_volume) values ('ONE_WEEK', '6%', '10_DAYS', '0', '2023-02-05', '2023-02-14', 10002, 'FULL');
insert into Rental(Rental_policy, Dropoff_charge, Rent_duration, Upgraded, Date_rented, Date_returned, Odometer_reading, Fuel_volume) values ('ONE_DAY', '2%', '8_DAYS', '1', '2023-03-02', '2023-02-09', 8972, 'HALF_FULL');

select * from Rental;

insert into Car_Class(Price, class) values ('150000', 'LUXURY');
insert into Car_Class(Price, class) values ('80000', 'COMPACT');
insert into Car_Class(Price, class) values ('90000', 'SUB_COMPACT');
insert into Car_Class(Price, class) values('50000', 'SEDAN');

insert into Address(Street, Street_number, City, Province, Postal_code) values ('Lavington', '1094', 'Nairobi', 'Arcade', '40412');
insert into Address(Street, Street_number, City, Province, Postal_code) values ('Runda', '1140', 'Tokyo', 'Syokimau', '5497');
insert into Address(Street, Street_number, City, Province, Postal_code) values ('Bogani', '1765' 'Galleria', 'Karen', '00100');
insert into Address(Street, Street_number, City, Province, Postal_code) values ('Milimani', '34678', 'Nakuru', 'Njoro', '00230');
insert into Address(Street, Street_number, City, Province, Postal_code) values ('Kitisuru', '1890', 'Westlands', 'Uthiru', '00154');
insert into Address(Street, Street_number, City, Province, Postal_code) values ('Mimosa', '3402', 'Gigiri', 'Rosslyn_Riviera', '00101');

SELECT*
FROM address;

select Location.Location_name, Address.Street, Address.City, Address.Province
from Location inner join Address
on  Location.Address_ID = Address.Address_ID;

select * from Location;
select * from Address;
select * from Customer;
select * from Employee;
Select * from Rental;




update Employee
set Address_ID=10
where Employee_ID=6;

select Customer.Driver_license, First_name, Last_name, Phone_number
from Customer inner join Address
on Customer.Address_ID =Address.Address_ID;

select Employee.Driver_license, Employee.First_name, Employee.Last_name, Employee.Phone_Number, Address.Street, Address.Street_number, Address.City, Address.Province, Address.Postal_code
from Employee inner join Address
on Employee.Address_ID = Address.Address_ID;
 
 Update Rental
 Set Drop_off_location=6
 where Rental_ID=1;
 
select Location. Location_name, Rental.Rental_policy, Rental.Dropoff_charge, Rental.Rent_duration, Rental.Upgraded, Rental.Date_rented, Rental.Date_returned, Rental.Odometer_reading
from Rental Left join Location
on Rental.Rented_location = Location.Location_ID;

select Location. Location_name, Rental.Rental_policy, Rental.Dropoff_charge, Rental.Rent_duration, Rental.Upgraded, Rental.Date_rented, Rental.Date_returned, Rental.Odometer_reading
from Rental Right join Location
on Rental.Drop_off_location = Location.Location_ID;











