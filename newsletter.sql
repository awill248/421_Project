use awill248;

drop table if exists newsletter;

create table newsletter (
`userid` INT NOT NULL AUTO_INCREMENT,
`email1` 	VARCHAR(45)	not null,
primary key( userid ));