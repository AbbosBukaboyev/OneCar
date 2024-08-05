----------------------------------------------------------------------------------------------------
create table users(
  user_id                         number(10) generated always as identity not null,
  first_name                      varchar2(100 char) not null,
  last_name                       varchar2(100 char) not null,
  middle_name                     varchar2(100 char),
  login                           varchar2(50),
  password                        varchar2(64),
  phone_number                    varchar2(50),
  email                           varchar2(250),
  status                          varchar2(1)         not null,
  constraint users_pk primary key (user_id),
  constraint users_c1 check (decode(first_name, trim(first_name), 1, 0) = 1),
  constraint users_c2 check (decode(last_name, trim(last_name), 1, 0) = 1),
  constraint users_c3 check (decode(middle_name, trim(middle_name), 1, 0) = 1),
  constraint users_c4 check (regexp_like(login, '^[a-zA-Z0-9]{5,50}$')),
  constraint users_c5 check (decode(phone_number, trim(phone_number), 1, 0) = 1),
  constraint users_c6 check (regexp_like(email, '^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$', 'i')),
  constraint users_c7 check (status in ('A', 'P')),
  constraint users_c8 check (nvl2(login, 1, 0) + nvl2(password, 1, 0) in (0, 2)),
  constraint users_c9 check (coalesce(login, phone_number, email) is not null)
);

comment on column users.status is 'Status of user: (A)ctive, (P)assive';

create unique index users_u1 on users(login);
create unique index users_u2 on users(phone_number);
create unique index users_u3 on users(email);

----------------------------------------------------------------------------------------------------
create table user_roles(
  user_id                         number(10)   not null,
  role_code                       varchar2(20) not null,
  constraint user_roles_pk primary key (user_id, role_code),
  constraint user_roles_f1 foreign key (user_id) references users(user_id) on delete cascade,
  constraint user_roles_c1 check (role_code in ('ADMIN', 'EMPLOYEE', 'CLIENT'))
);

create unique index user_roles_u1 on user_roles(decode(role_code, 'ADMIN', user_id, null), decode(role_code, 'ADMIN', role_code, null));

create index user_roles_i1 on user_roles(user_id);

----------------------------------------------------------------------------------------------------
create table clients(
  client_id                       number(10)  not null,
  status                          varchar2(1) not null,
  constraint clients_pk primary key (client_id),
  constraint clients_f1 foreign key (client_id) references users(user_id),
  constraint clients_c1 check (status in ('A', 'P'))
);

comment on column clients.status is 'Status of client: (A)ctive, (P)assive';

----------------------------------------------------------------------------------------------------
create table car_brands(
  car_brand_id                    number(10) generated always as identity not null,
  name                            varchar2(100) not null,
  description                     varchar2(1000),
  constraint car_brands_pk primary key (car_brand_id),
  constraint car_brands_c1 check (decode(name, trim(name), 1, 0) = 1)
);

create unique index car_brands_u1 on car_brands(name);

----------------------------------------------------------------------------------------------------
create table car_models(
  car_model_id                    number(10) generated always as identity not null,
  car_brand_id                   number(10)     not null,
  name                            varchar2(100) not null,
  description                     varchar2(1000),
  constraint car_models_pk primary key (car_model_id),
  constraint car_models_u1 unique (car_model_id, car_brand_id),
  constraint car_models_f1 foreign key (car_brand_id) references car_brands(car_brand_id),
  constraint car_models_c1 check (decode(name, trim(name), 1, 0) = 1)
);

create unique index car_models_u2 on car_models(name);

----------------------------------------------------------------------------------------------------
create table cars(
  car_id                          number(10) generated always as identity not null,
  car_brand_id                    number(10)   not null,
  car_model_id                    number(10)   not null,
  vin_number                      varchar2(17) not null,
  year_of_manufacture             number(4)    not null,
  constraint cars_pk primary key (car_id),
  constraint cars_f1 foreign key (car_model_id, car_brand_id) references car_models(car_model_id, car_brand_id),
  constraint cars_c1 check (decode(vin_number, trim(vin_number), 1, 0) = 1),
  constraint cars_c2 check (year_of_manufacture > 1900)
);

create unique index cars_u1 on cars(vin_number);

create index cars_i1 on cars(car_model_id, car_brand_id);

----------------------------------------------------------------------------------------------------
create table client_cars(
  client_id                       number(10)   not null,
  car_id                          number(10)   not null,
  state_number                    varchar2(50) not null,
  color                           varchar2(20),
  status                          varchar2(1)  not null,
  constraint client_cars_pk primary key (client_id, car_id),
  constraint client_cars_f1 foreign key (client_id) references clients(client_id),
  constraint client_cars_f2 foreign key (car_id) references cars(car_id),
  constraint client_cars_c1 check (decode(state_number, trim(state_number), 1, 0) = 1),
  constraint client_cars_c2 check (decode(color, trim(color), 1, 0) = 1)
);

create index client_cars_i1 on client_cars(client_id);
create index client_cars_i2 on client_cars(car_id);

----------------------------------------------------------------------------------------------------
create table service_groups(
  service_group_id                number(10) generated always as identity not null,
  name                            varchar2(100) not null,
  status                          varchar2(1)   not null,
  order_no                        number(6),
  constraint service_groups_pk primary key (service_group_id),
  constraint service_groups_c1 check (decode(name, trim(name), 1, 0) = 1),
  constraint service_groups_c2 check (status in ('A', 'P'))
);

comment on column service_groups.status is 'Status of service group: (A)ctive, (P)assive';

create unique index service_groups_u1 on service_groups(name);

----------------------------------------------------------------------------------------------------
create table services(
  service_id                      number(10) generated always as identity not null,
  service_group_id                number(10)    not null,
  name                            varchar2(100) not null,
  status                          varchar2(1)   not null,
  price                           number(20, 6) not null,
  order_no                        number(6),
  constraint services_pk primary key (service_id),
  constraint services_f1 foreign key (service_group_id) references service_groups(service_group_id),
  constraint services_c1 check (decode(name, trim(name), 1, 0) = 1),
  constraint services_c2 check (status in ('A', 'P')),
  constraint services_c3 check (price > 0),
  constraint services_c4 check (order_no > 0)
);

comment on column services.status is 'Status of service: (A)ctive, (P)assive';

create unique index services_u1 on services(name);

create index services_i1 on services(service_group_id);

----------------------------------------------------------------------------------------------------
create table car_components(
  component_id                    number(10) generated always as identity not null,
  name                            varchar2(200) not null,
  component_type                  varchar2(1)   not null,
  status                          varchar2(1)   not null,
  price                           number(20, 6) not null,
  constraint car_components_pk primary key (component_id),
  constraint car_components_c1 check (decode(name, trim(name), 1, 0) = 1),
  constraint car_components_c2 check (component_type in ('O', 'T', 'L', 'R', 'B', 'S')),
  constraint car_components_c3 check (status in ('A', 'P')),
  constraint car_components_c4 check (price > 0)
);

comment on column car_components.status is 'Component_type of car component: (O)il, (T)ire, (L)ight, (R)adiator, (B)elts, other(S)';
comment on column car_components.status is 'Status of car omponent: (A)ctive, (P)assive';

create unique index car_components_u1 on car_components(name);

----------------------------------------------------------------------------------------------------
create table requests(
  request_id                      number(10) generated always as identity not null,
  request_time                    timestamp with local time zone not null,
  request_type                    varchar2(1) not null,
  client_id                       number(10)  not null,
  car_id                          number(10)  not null,
  issue_details                   varchar2(4000),
  issue_file_sha                  varchar2(64),
  status                          varchar2(1) not null,
  constraint requests_pk primary key (request_id),
  constraint requests_f1 foreign key (client_id, car_id) references client_cars(client_id, car_id),
  constraint requests_c1 check (request_type in ('M', 'R')),
  constraint requests_c2 check (status in ('C', 'I', 'E', 'W', 'A', 'R', 'P', 'C')),
  constraint requests_c3 check (issue_details is not null or issue_file_sha is not null)
);

comment on column requests.request_type is 'Type of request: (M)aintenance, (R)epair';
comment on column requests.status is 'Status of request: (C)heck-in, (I)nspection, cost (E), (W)aiting client approval, (A)pproved by client, (R)ejected by client, work in (P)rogress, c(O)mpleted, C(A)ncelled';

create index requests_i1 on requests(client_id, car_id);

----------------------------------------------------------------------------------------------------
create table request_services(
  request_id                      number(10)    not null,
  service_id                      number(10)    not null,
  price                           number(20, 6) not null,
  note                            varchar2(4000),
  constraint request_services_pk primary key (request_id, service_id),
  constraint request_services_f1 foreign key (request_id) references requests(request_id) on delete cascade,
  constraint request_services_f2 foreign key (service_id) references services(service_id),
  constraint request_services_c1 check (price > 0)
);

create index request_services_i1 on request_services(service_id);

----------------------------------------------------------------------------------------------------
create table request_service_items(
  request_id                      number(20)    not null,
  service_id                      number(20)    not null,
  component_id                    number(6)     not null,
  count                           number(6)     not null,
  price                           number(20, 6) not null,
  total_amount                    number(20, 6) not null,
  constraint request_service_items_pk primary key (request_id, service_id, component_id),
  constraint request_service_items_f1 foreign key (request_id, service_id) references request_services(request_id, service_id) on delete cascade,
  constraint request_service_items_f2 foreign key (component_id) references car_components(component_id),
  constraint request_service_items_c1 check (count > 0),
  constraint request_service_items_c2 check (price > 0),
  constraint request_service_items_c3 check (total_amount = count * price)
);

create index request_service_items_i1 on request_service_items(service_id);
create index request_service_items_i2 on request_service_items(component_id);

/*drop table request_service_items;
drop table request_services;
drop table requests;
drop table car_components;
drop table services;
drop table service_groups;
drop table client_cars;
drop table cars;
drop table car_models;
drop table car_brands;
drop table clients;
drop table user_roles;
drop table users;
*/
