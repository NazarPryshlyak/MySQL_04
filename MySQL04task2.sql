drop database if exists students_hostel;
create database students_hostel char set utf8;

use students_hostel;

create table parents (
      id int not null primary key auto_increment,
      parent_name varchar(45) not null,
      work_place varchar(60) not null,
      tel_number varchar(12) not null,
      student_id int not null
);

create table student (
      id int not null primary key auto_increment,
      student_name varchar(45) not null,
      home_adress varchar(120) not null,
      birth_date date not null,
      group_id int not null,
      room_id int not null
);

create table faculty (
      id int not null primary key auto_increment,
      faculty varchar(30) not null,
      speciality varchar(30) not null unique
);

create table group_t (
      id int not null primary key auto_increment,
      id_group varchar(6) not null unique,
      course tinyint not null,
      speciality_id int not null
);

create table rooms (
      id int not null primary key auto_increment,
	  room_number smallint not null unique,
      note text
);

create table furniture (
      id int not null primary key auto_increment,
      invent_number int not null unique,
      furniture_name varchar (30) not null,
      room_id int not null
);

create table incidents (
      id int not null primary key auto_increment,
      incident varchar(30) not null,
      room_id int not null
);

alter table parents add foreign key (student_id) references student(id);
alter table group_t add foreign key (speciality_id) references faculty(id);
alter table student add foreign key (group_id) references group_t(id);
alter table student add foreign key (room_id) references rooms(id);
alter table furniture add foreign key (room_id) references rooms(id);
alter table incidents add foreign key (room_id) references rooms(id);