ALTER TABLE `myvet`.`file` 
CHANGE COLUMN `board_code` `board_code` INT NOT NULL ,
CHANGE COLUMN `board_no` `board_no` INT NOT NULL ,
CHANGE COLUMN `ori_name` `ori_name` VARCHAR(500) NOT NULL ,
CHANGE COLUMN `sys_name` `sys_name` VARCHAR(500) NOT NULL ,
CHANGE COLUMN `file_path` `file_path` VARCHAR(3000) NOT NULL ,
CHANGE COLUMN `file_size` `file_size` INT NOT NULL ;
