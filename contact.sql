use awill248;

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

