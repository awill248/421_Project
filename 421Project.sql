use awill248;

drop table if exists symptom;
drop table if exists vital;
drop table if exists appointment;
drop table if exists patient;
drop table if exists doctor;
drop table if exists nurse;
drop table if exists clinic;
drop table if exists login;
drop table if exists contact;


CREATE TABLE contact (
`create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` TIMESTAMP NULL,
`id` INT NOT NULL AUTO_INCREMENT,
`name` VARCHAR(45) NOT NULL,
`email` VARCHAR(45) NOT NULL,
`subject` VARCHAR(45) NULL,
`message` VARCHAR(45) NULL,
PRIMARY KEY (`id`));

CREATE TABLE login (
`userid` INT NOT NULL AUTO_INCREMENT,
`email` VARCHAR(45) NOT NULL,
`password` VARCHAR(45) NOT NULL,
PRIMARY KEY (`userid`));

create table clinic 
   (clinic_id 		int	not null unique,
    clinic_name  	varchar(15)	not null,
    clinic_location varchar(15) not null, 
    clinic_address  varchar(15) not null, 
    clinic_phone 	varchar(15) not null, 
    primary key( clinic_id ));
   
create table nurse 
   (nurse_id 			int	not null unique,
    nurse_name  		varchar(15)	not null,
    nurse_education 	varchar(15) not null, 
    nurse_availability  varchar(15) not null,
    clinic_id 			int not null, 
    primary key( nurse_id ),
	foreign key (clinic_id) references clinic(clinic_id)); 
    
create table doctor 
	(doctor_id  		 int not null unique, 
     doctor_name    	 varchar(15) not null, 
     doctor_education 	 varchar(15) not null, 
	 doctor_availability varchar(15) not null, 
     clinic_id 			int not null, 
	 primary key( doctor_id), 
     foreign key(clinic_id) references clinic(clinic_id)); 
     
     create table patient 
	(patient_id  		int not null unique, 
     patient_name    	varchar(15) not null, 
     patient_phone 		varchar(15) not null, 
	 patient_insurance  varchar(15) not null, 
     patient_address 	varchar(15) not null, 
     patient_med_history    varchar(15) not null, 
	 nurse_id	int not null, 
     doctor_id  int not null, 
	 primary key( patient_id), 
     foreign key(nurse_id) references nurse(nurse_id),
     foreign key(doctor_id) references doctor(doctor_id)); 
     
     
create table appointment
	(app_id		int not null unique, 
	 app_time	int not null , 
     app_date 	int not null, 
     app_reason varchar(45) not null, 
     nurse_id	int not null, 
     doctor_id  int not null, 
     patient_id int not null, 
     primary key(app_id),
	 foreign key (nurse_id) references nurse(nurse_id), 
     foreign key (doctor_id) references doctor(doctor_id),
	 foreign key (patient_id) references patient(patient_id)); 
     
     
create table vital
	(vital_id 			int not  null unique, 
     vital_weight 		int not null, 
     vital_temperature 	int not null, 
     vital_height 		int not null, 
	 patient_id 		int not null, 
     primary key(vital_id), 
     foreign key(patient_id) references patient(patient_id)); 
     
create table symptom 
	(symptom_id  int not null unique, 
     symptom_start_date int not null, 
     symptom_description varchar(45) not null, 
	 patient_id int not null, 
     primary key(symptom_id), 
     foreign key(patient_id) references patient(patient_id)); 
