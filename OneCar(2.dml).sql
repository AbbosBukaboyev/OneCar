prompt insert intial data

-- users
insert into users(first_name, last_name, login, password, status) values ('admin', 'admin', 'admin', '12345', 'A');
insert into users(first_name, last_name, phone_number, status) values ('Abbos', 'Bukaboev', '12345', 'A');
insert into users(first_name, last_name, email, status) values ('Rustam', 'Ahmad', 'test@gmail.com', 'A');

-- user_roles
insert into user_roles(user_id, role_code) values (1, 'ADMIN');
insert into user_roles(user_id, role_code) values (2, 'EMPLOYEE');
insert into user_roles(user_id, role_code) values (3, 'CLIENT');

-- clients
insert into clients(client_id, status) values (2, 'A');
insert into clients(client_id, status) values (3, 'A');

-- car_brands
insert into car_brands(name, description) values ('Toyota', 'A Japanese multinational automotive manufacturer.');
insert into car_brands(name, description) values ('Ford', 'An American multinational automaker headquartered in Dearborn, Michigan.');
insert into car_brands(name, description) values ('BMW', 'A German multinational company which produces luxury vehicles and motorcycles.');
insert into car_brands(name, description) values ('Honda', 'A Japanese public multinational conglomerate manufacturer of automobiles, motorcycles, and power equipment.');
insert into car_brands(name, description) values ('Tesla', 'An American electric vehicle and clean energy company based in Palo Alto, California.');

-- car_models
insert into car_models(car_brand_id, name, description) values (1, 'Corolla', 'A compact car produced by Toyota.');
insert into car_models(car_brand_id, name, description) values (2, 'Mustang', 'A series of American automobiles manufactured by Ford.');
insert into car_models(car_brand_id, name, description) values (3, 'X5', 'A mid-size luxury SUV produced by BMW.');
insert into car_models(car_brand_id, name, description) values (4, 'Civic', 'A line of cars manufactured by Honda.');
insert into car_models(car_brand_id, name, description) values (5, 'Model S', 'An all-electric five-door liftback sedan produced by Tesla.');

-- cars
insert into cars(car_brand_id, car_model_id, vin_number, year_of_manufacture) values (1, 1, '1HGBH41JXMN109186', '2021');
insert into cars(car_brand_id, car_model_id, vin_number, year_of_manufacture) values (2, 2, '1HGCM82633A123456', '2022');
insert into cars(car_brand_id, car_model_id, vin_number, year_of_manufacture) values (3, 3, '2HGCM82633A123457', '2023');
insert into cars(car_brand_id, car_model_id, vin_number, year_of_manufacture) values (4, 4, '1HGCM82633A123458', '2020');
insert into cars(car_brand_id, car_model_id, vin_number, year_of_manufacture) values (5, 5, '5YJSA1E26MF123459', '2019');

-- user_cars
insert into user_cars(user_id, car_id, state_number, color, status) values (2, 1, 'AB123CD', 'Red', 'A');
insert into user_cars(user_id, car_id, state_number, color, status) values (2, 2, 'EF456GH', 'Blue', 'A');
insert into user_cars(user_id, car_id, state_number, color, status) values (3, 3, 'IJ789KL', 'Black', 'A');
insert into user_cars(user_id, car_id, state_number, color, status) values (3, 4, 'MN012OP', 'White', 'A');
insert into user_cars(user_id, car_id, state_number, color, status) values (3, 5, 'QR345ST', 'Gray', 'A');

-- service_groups
insert into service_groups(name, status, order_no) values ('Basic Maintenance', 'A', 1);
insert into service_groups(name, status, order_no) values ('Advanced Maintenance', 'A', 2);
insert into service_groups(name, status, order_no) values ('Repairs', 'A', 3);
insert into service_groups(name, status, order_no) values ('Inspections', 'A', 4);
insert into service_groups(name, status, order_no) values ('Cleaning', 'A', 5);

-- services
insert into services(name, service_group_id, price, status, order_no) values ('Oil Change', 1, 29.99, 'A', 1);
insert into services(name, service_group_id, price, status, order_no) values ('Tire Rotation', 2, 19.99, 'A', 2);
insert into services(name, service_group_id, price, status, order_no) values ('Brake Replacement', 3, 149.99, 'A', 3);
insert into services(name, service_group_id, price, status, order_no) values ('Battery Check', 4, 9.99, 'A', 4);
insert into services(name, service_group_id, price, status, order_no) values ('Car Wash', 5, 15.99, 'A', 5);

-- car_components
insert into car_components(name, component_type, status, price) values ('Oil Filter', 'O', 'A', 5.99);
insert into car_components(name, component_type, status, price) values ('Tire', 'T', 'A', 89.99);
insert into car_components(name, component_type, status, price) values ('Headlight', 'L', 'A', 49.99);
insert into car_components(name, component_type, status, price) values ('Radiator', 'R', 'A', 299.99);
insert into car_components(name, component_type, status, price) values ('Fan Belt', 'B', 'A', 19.99);

-- requests
insert into requests(request_time, request_type, user_id, car_id, issue_details, status) values (current_timestamp, 'M', 2, 1, 'Oil change needed', 'C');
insert into requests(request_time, request_type, user_id, car_id, issue_details, status) values (current_timestamp, 'R', 2, 2, 'Brake replacement', 'I');
insert into requests(request_time, request_type, user_id, car_id, issue_details, status) values (current_timestamp, 'M', 3, 3, 'Tire rotation needed', 'E');
insert into requests(request_time, request_type, user_id, car_id, issue_details, status) values (current_timestamp, 'R', 3, 4, 'Radiator repair', 'W');
insert into requests(request_time, request_type, user_id, car_id, issue_details, status) values (current_timestamp, 'M', 3, 5, 'Battery check', 'A');

-- request_services
insert into request_services(request_id, service_id, price, note) values (1, 1, 29.99, 'Urgent');
insert into request_services(request_id, service_id, price, note) values (2, 3, 149.99, 'Customer waiting');
insert into request_services(request_id, service_id, price, note) values (3, 2, 19.99, 'Customer waiting');
insert into request_services(request_id, service_id, price, note) values (4, 4, 9.99, 'Urgent');
insert into request_services(request_id, service_id, price, note) values (5, 4, 9.99, 'Urgent');

-- request_service_items
insert into request_service_items(request_id, service_id, component_id, count, price, total_amount) values (1, 1, 1, 1, 29.99, 29.99);
insert into request_service_items(request_id, service_id, component_id, count, price, total_amount) values (2, 3, 2, 4, 149.99, 599.96);
insert into request_service_items(request_id, service_id, component_id, count, price, total_amount) values (3, 2, 2, 4, 19.99, 79.96);
insert into request_service_items(request_id, service_id, component_id, count, price, total_amount) values (4, 4, 4, 1, 9.99, 9.99);
insert into request_service_items(request_id, service_id, component_id, count, price, total_amount) values (5, 4, 4, 1, 9.99, 9.99);
