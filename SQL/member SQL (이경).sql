-- ----------------------------------------------------------------------------------------------------이경(로그인)
-- member
CREATE TABLE member (
	member_no            INT           primary key auto_increment, -- member_no
	member_email         VARCHAR(50)   NOT NULL, -- member_email
	password             VARCHAR(50)   NOT NULL, -- password
	member_grade         CHAR          NOT NULL, -- member_grade
	member_name          VARCHAR(50)   NOT NULL, -- member_name
	member_phone         VARCHAR(15)   NOT NULL, -- member_phone
	member_nickname      VARCHAR(50)   NULL,     -- member_nickname
	hos_code             INT           NULL,     -- hos_code
	member_career        VARCHAR(1000) NULL,     -- member_career
	mailing_opt          CHAR          NULL,     -- mailing_opt
	member_file_no       INT           NULL,     -- member_file_no
	member_ori_name      VARCHAR(50)   NULL,     -- member_ori_name
	member_sys_name      VARCHAR(50)   NULL,     -- member_sys_name
	member_file_path     VARCHAR(50)   NULL,     -- member_file_path
	member_file_size     INT           NULL,     -- member_file_size
	member_file_reg_date DATETIME      NULL default now()      -- member_file_reg_date
);

-- vet_auth
CREATE TABLE vet_auth (
	vet_file_no       INT         primary key auto_increment, -- vet_file_no
	member_no         INT         NULL,     -- member_no
	vet_ori_name      VARCHAR(50) NULL,     -- vet_ori_name
	vet_sys_name      VARCHAR(50) NULL,     -- vet_sys_name
	vet_file_path     VARCHAR(50) NULL,     -- vet_file_path
	vet_file_size     INT         NULL,     -- vet_file_size
	vet_file_reg_date DATETIME    NULL default now()     -- vet_file_reg_date
);

-- pet
CREATE TABLE pet (
	pet_no            INT           primary key auto_increment, -- pet_no
	member_no         INT           NOT NULL, -- member_no
	pet_name          VARCHAR(20)   NOT NULL, -- pet_name
	pet_reg_no        INT           NULL,     -- pet_reg_no
	species           VARCHAR(20)   NOT NULL, -- species
	breed             VARCHAR(30)   NULL,     -- breed
	size              CHAR          NULL,     -- size
	pet_gender        CHAR          NULL,     -- pet_gender
	pet_age           INT           NULL,     -- pet_age
	weight            INT           NULL,     -- weight
	remark            VARCHAR(4000) NULL,     -- remark
	pet_file_no       INT           NULL,     -- pet_file_no
	pet_ori_name      VARCHAR(50)   NULL,     -- pet_ori_name
	pet_sys_name      VARCHAR(50)   NULL,     -- pet_sys_name
	pet_file_path     VARCHAR(50)   NULL,     -- pet_file_path
	pet_file_size     INT           NULL,     -- pet_file_size
	pet_file_reg_date DATETIME      NULL default now()      -- pet_file_reg_date
);

-- fav_hos
CREATE TABLE fav_hos (
	fav_hos_no INT primary key auto_increment, -- fav_hos_no
	pet_no     INT NOT NULL, -- pet_no
	member_no  INT NOT NULL, -- member_no
	hos_code   INT NOT NULL  -- hos_code
);

-- pet_vaccine
CREATE TABLE pet_vaccine (
	vaccine_no   INT  primary key auto_increment, -- vaccine_no
	pet_no       INT  NOT NULL, -- pet_no
	vaccine_date DATETIME NOT NULL default now(), -- vaccine_date
	vaccine_code INT  NOT NULL, -- vaccine_code
	next_vaccine DATE NOT NULL, -- next_vaccine
	member_no    INT  NOT NULL  -- vet_no
);

-- vaccine
CREATE TABLE vaccine (
	vaccine_code    INT          primary key auto_increment, -- vaccine_code
	vaccine_name    VARCHAR(100) NOT NULL, -- vaccine_name
	vaccine_expdate INT          NOT NULL  -- vaccine_expdate
);