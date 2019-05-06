use awill248;
drop table if exists login;

CREATE TABLE users (
`userid` INT NOT NULL AUTO_INCREMENT,
`email` VARCHAR(45) NOT NULL,
`password` VARCHAR(45) NOT NULL,
PRIMARY KEY (`userid`));