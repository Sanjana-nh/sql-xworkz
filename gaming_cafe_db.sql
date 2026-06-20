create database gaming_cafe_db;
use gaming_cafe_db;

create table customers (
id int, 
name varchar(50), 
gender enum('Male', 'Female', 'Other'), 
dob date, 
phone bigint, 
email varchar(50), 
is_member boolean, 
favorite_game set('Rivals', 'CyberPunk', 'Minecraft', 'Fortnite'), 
hours_played float, 
wallet_balance decimal(8,2)
);

desc customers;

rename table customers to cafe_customers;

desc cafe_customers;

alter table cafe_customers add address varchar(100), add city varchar(30), add state varchar(30), add zip_code char(6);

alter table cafe_customers drop dob, drop gender;

alter table cafe_customers modify phone varchar(15), modify is_member int;

alter table cafe_customers change column name full_name varchar(50), change column phone contact_number varchar(15), change column email email_address varchar(50);

insert into cafe_customers values (1, 'Sanjana', '9876543210', 'sanj@email.com', false, 'Rivals', 45.5, 150.00, '123 main road', 'JP Nagar', 'Banglore', '577010');
insert into cafe_customers values (2, 'Rinith', '8765432109', 'rini@email.com', true, 'Minecraft', 12.0, 0.00, '456 main road', ' RR Nagar', 'Banglore', '577011'),
(3, 'Taylor Swift', '7654321098', 'taylor@email.com', false, 'Fortnite', 120.5, 300.50, '789 Pine Ln', 'Gotham', 'NYC', '200020'),
(4, 'Chris Evans', '6543210987', 'chris@email.com', false, 'CyberPunk', 300.0, 50.00, '321 Elm St', 'Star City', 'CA', '900001');
insert into cafe_customers (id, full_name , contact_number,favorite_game) values(5, 'Morgan Freeman', '5432109876','Minecraft');
insert into cafe_customers (is_member ,hours_played , address, city)values(  false , 88.0, '987 Cedar Rd', 'Metro City'),( true, 2.0, '147 Birch St', 'Gotham'),(true,  410.5, '258 Ash Ave', 'Gotham');

Select * from cafe_customers;

create table computers (
pc_id int, 
brand varchar(30), 
processor varchar(30), 
ram_capacity int, 
has_rgb boolean, 
purchase_date date, 
section enum('VIP', 'Standard'), 
mac_addr char(17), 
hourly_rate decimal(5,2), 
is_operational boolean
);

desc  computers;

rename table computers to gaming_rigs;

desc gaming_rigs;

alter table gaming_rigs add gpu_model varchar(40), add storage_type varchar(20), add monitor_size int, add last_maintenance date;

alter table gaming_rigs drop mac_addr, drop has_rgb;

alter table gaming_rigs modify ram_capacity bigint, modify is_operational int;

alter table gaming_rigs change column brand manufacturer varchar(30), change column section floor_section enum('VIP', 'Standard'), change column hourly_rate price_per_hour decimal(5,2);

insert into gaming_rigs values (101, 'Alienware', 'i9-13900K', 32, '2023-01-15', 'VIP', 5.00, 1, 'RTX 4090', 'NVMe SSD', 27, '2023-10-01');
insert into gaming_rigs values (102, 'ASUS ROG', 'i7-12700K', 16, '2022-06-20', 'Standard', 3.00, 1, 'RTX 3080', 'SSD', 24, '2023-09-15'),
(103, 'MSI', 'Ryzen 9 7900X', 32, '2023-03-10', 'VIP', 5.00, 1, 'RX 7900 XTX', 'NVMe SSD', 27, '2023-10-05');
insert into gaming_rigs (pc_id, manufacturer, processor, gpu_model) values (104, 'Corsair', 'i7-13700K', 'RTX 4080');
insert into gaming_rigs (ram_capacity, floor_section, price_per_hour, is_operational) values (16, 'Standard', 2.50, 1), (32, 'VIP', 6.00, 0), (16, 'Standard', 3.00, 1);

select * from gaming_rigs;

create table games (
game_id int, 
title varchar(50), 
category set('Action', 'RPG', 'Shooter'), 
release_year year, 
is_multiplayer boolean, 
age_rating enum('E', 'T', 'M'), 
disk_size_gb float, 
price decimal(6,2), 
developer varchar(40), 
average_rating float
);

desc games;

rename table games to cafe_games;

desc cafe_games;

alter table cafe_games add platform varchar(20), add total_downloads int, add is_installed boolean, add last_update date;

alter table cafe_games drop developer, drop average_rating;

alter table cafe_games modify price int, modify disk_size_gb double;

alter table cafe_games change column title game_title varchar(50), change column category game_genre set('Action', 'RPG', 'Shooter'), change column release_year launch_year year;

insert into cafe_games values (201, 'Valorant', 'Shooter', 2020, true, 'T', 35.5, 0, 'PC', 5000, true, '2023-10-15');
insert into cafe_games values (202, 'Cyberpunk 2077', 'RPG', 2020, false, 'M', 70.0, 60, 'PC', 1500, true, '2023-09-21'),
(203, 'Elden Ring', 'RPG,Action', 2022, true, 'M', 60.0, 60, 'PC', 3000, true, '2023-08-10');
insert into cafe_games (game_id, game_title, game_genre, is_multiplayer) values (204, 'Minecraft', 'Action', true);
insert into cafe_games (age_rating, price, platform, total_downloads) values ('M', 40, 'PC', 2500), ('T', 0, 'PC', 6000), ('E', 20, 'Console', 1200);

select * from cafe_games;

create table snack_bar (
item_id int, 
item_name varchar(30), 
item_type enum('Drink', 'Food'), 
price decimal(5,2), 
is_veg boolean, 
stock_count int, 
expiry date, 
calories int, 
supplier varchar(40), 
barcode char(12)
);

desc snack_bar;

rename table snack_bar to cafe_menu;

desc cafe_menu;

alter table cafe_menu add discount_pct int, add reorder_level int, add is_available boolean, add date_added date;

alter table cafe_menu drop supplier, drop barcode;

alter table cafe_menu modify price float, modify calories bigint;

alter table cafe_menu change column item_name product_name varchar(30), change column item_type product_category enum('Drink', 'Food'), change column stock_count quantity_in_stock int;

insert into cafe_menu values (301, 'Energy Drink', 'Drink', 3.50, true, 150, '2024-12-31', 220, 0, 50, true, '2023-01-10');
insert into cafe_menu values (302, 'Nachos', 'Food', 5.00, true, 80, '2023-11-30', 350, 10, 20, true, '2023-05-15'),
(303, 'Chicken Wings', 'Food', 8.50, false, 40, '2023-10-25', 600, 0, 15, true, '2023-08-01');
insert into cafe_menu (item_id, product_name, product_category, price) values (304, 'French Fries', 'Food', 4.00);
insert into cafe_menu (is_veg, quantity_in_stock, calories, is_available) values (true, 120, 90, true), (false, 0, 300, false), (true, 300, 210, true);

select * from cafe_menu;

create table staff (
    emp_id int, 
    name varchar(40), 
    role set('Manager', 'Tech', 'Cashier'), 
    gender enum('M', 'F'), 
    join_date date, 
    salary decimal(8,2), 
    is_active boolean, 
    phone bigint, 
    email varchar(40), 
    shift_type char(5)
);

desc staff;

rename table staff to cafe_employees;

desc cafe_employees;

alter table cafe_employees add address varchar(50), add city varchar(30), add emergency_contact bigint, add blood_group varchar(5);

alter table cafe_employees drop gender, drop shift_type;

alter table cafe_employees modify salary float,modify phone varchar(15);

alter table cafe_employees change column name employee_name varchar(40), change column role job_role set('Manager', 'Tech', 'Cashier'), change column join_date hire_date date;

insert into cafe_employees values (401, 'Natasha', 'Manager', '2020-05-10', 45000.0, true, '1112223333', 'nat@cafe.com', '101 Gold Street', 'Metro City', 9998887777, 'O+');
insert into cafe_employees values (402, 'Bruce Wayne', 'Tech', '2021-08-15', 38000.0, true, '2223334444', 'bruce@cafe.com', 'Bat Cave', 'NYC', 8887776666, 'AB+'),
(403, 'Iron Man', 'Cashier', '2022-01-20', 25000.0, true, '3334445555', 'iron@cafe.com', 'Farm House', 'Banglore', 7776665555, 'A-');
insert into cafe_employees (emp_id, employee_name, job_role, phone) values (404, 'Sider Man', 'Tech', '4445556666');
insert into cafe_employees (is_active, salary, city, blood_group) values (false, 25000.0, 'MG road', 'O-'), (true, 40000.0, 'Jump City', 'AB-'), (true, 42000.0, 'Coffee City', 'A+');

select * from cafe_employees;