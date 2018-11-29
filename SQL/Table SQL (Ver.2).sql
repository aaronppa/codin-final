-- ----------------------------------------------------------------------------------------------------공용
-- bnoticeoard_list
CREATE TABLE board_list (
	board_code INT          primary key auto_increment, -- board_code
	item_name  VARCHAR(100) NULL      -- item_name
);

-- file
CREATE TABLE file_info (
	file_id    INT           primary key auto_increment, -- file_id
	board_code INT           NULL,     -- board_code
	board_no   INT   		 NULL,     -- board_no
	ori_name   VARCHAR(500)  NULL,     -- ori_name
	sys_name   VARCHAR(500)  NULL,     -- sys_name
	file_path  VARCHAR(3000) NULL,     -- file_path
	file_size  INT           NULL      -- file_size
);

-- ----------------------------------------------------------------------------------------------------유병욱(병원메뉴)
-- notice
CREATE TABLE notice (
	notice_no       INTEGER       primary key auto_increment, -- notice_no
	notice_title    VARCHAR(100)  NOT NULL, -- notice_title
	notice_writer   INT           NULL,     -- notice_writer
	notice_reg_date DATETIME      NULL default now(),     -- notice_reg_date
	notice_view_cnt INT           NULL default 0,     -- notice_view_cnt
	notice_content  VARCHAR(5000) NOT NULL,  -- notice_content
    temp_save		INT			  NULL default 0
);

-- hos_hours
CREATE TABLE hos_hours (
	hours_no   INT  primary key auto_increment, -- hours_no
	hos_code   INT  NOT NULL, -- hos_code
	open_day   INT  NOT NULL, -- open_day
	open_time  TIME NULL,     -- open_time
	close_time TIME NULL,     -- close_timehos_basichos_basichos_basic
	dayoff     CHAR NULL      -- dayoff
);

-- hos_basic
CREATE TABLE hos_basic (
	hos_code      INT           primary key auto_increment, -- hos_code
	title         VARCHAR(100)  NOT NULL, -- title
	roadAddress   VARCHAR(300)  NULL,     -- roadAddress
	address       VARCHAR(300)  NULL,     -- address
	mapx          INT           NOT NULL, -- mapx
	mapy          INT           NOT NULL, -- mapy
	hos_seach_cnt INT           NULL,     -- hos_seach_cnt
	telephone     VARCHAR(50)   NULL,     -- telephone
	hos_register  CHAR          NOT NULL, -- hos_register
	lunch_start   TIME          NULL,     -- lunch_start
	lunch_end     TIME          NULL,     -- lunch_end
	hos_comment   VARCHAR(3000) NULL      -- hos_comment
);

-- hos_review
CREATE TABLE hos_review (
	review_no               INT           primary key auto_increment, -- review_no
	hos_code                INT           NOT NULL, -- hos_code
	review_content          VARCHAR(1000) NOT NULL, -- review_content
	review_point            INT           NOT NULL, -- review_point
	review_writer_no 		INT           NOT NULL,     -- review_writer_no
    review_reg_date			datetime	  NOT NULL default now(),
    board_code				INT			  NOT NULL
);

-- hos_facility
CREATE TABLE hos_facility (
	facility_no       INT  primary key auto_increment, -- facility_no
	hos_code          INT  NOT NULL, -- hos_code
	facility_code     INT  NOT NULL, -- facility_code
	facility_bookable CHAR NOT NULL, -- facility_bookable
	staff_no          INT  NOT NULL, -- staff_no
	max_booking       INT  NULL default 1,     -- max_booking
);

-- hos_facilitylist
CREATE TABLE hos_facilitylist (
	facility_code INT          primary key auto_increment, -- facility_code
	facility_name VARCHAR(100) NOT NULL  -- facility_name
);

-- hos_block
CREATE TABLE hos_block (
	block_code  INT  primary key auto_increment, -- block_code
	hos_code    INT  NULL,     -- hos_code
	block_day   DATE NULL,     -- block_day
	block_no    INT  NULL,     -- block_no
	block_start TIME NULL,     -- block_start
	block_end   TIME NULL,     -- block_end
	facility_no INT  NULL      -- facility_no
);

-- hos_booking
CREATE TABLE hos_booking (
	booking_no    INT  primary key auto_increment, -- booking_no
	block_code    INT  NOT NULL, -- block_code
	booking_owner INT  NOT NULL, -- booking_owner
	booking_pet   INT  NULL,     -- booking_pet
	confirm       CHAR NOT NULL  -- confirm
);

-- hos_board
CREATE TABLE hos_board (
	hos_board_id            INT          primary key auto_increment, -- hos_board_id
	board_code              INT          NOT NULL, -- board_code
	hos_code                INT          NOT NULL, -- hos_code
	hos_board_no            INT          NOT NULL, -- hos_board_no
	hos_board_category_code INT          NOT NULL, -- hos_board_category_code
	hos_board_title         VARCHAR(100) NOT NULL, -- hos_board_title
	hos_board_writer_no     INT          NULL,     -- hos_board_writer_no
	hos_board_view_cnt      INT          NOT NULL default 0, -- hos_board_view_cnt
	hos_board_reg_date      DATETIME     NOT NULL default now() -- hos_board_reg_date
);

-- hos_board_comment
CREATE TABLE hos_board_comment (
	hos_board_comment_no        INT           primary key auto_increment, -- hos_board_comment_no
	hos_board_id                INT           NOT NULL, -- hos_board_id
	hos_board_comment_writer_no INT           NULL,     -- hos_board_comment_writer_no
	hos_board_comment_content   VARCHAR(5000) NOT NULL,  -- hos_board_comment_content
    hos_board_comment_reg_date  DATETIME      NOT NULL default now()
);

-- hos_board_category_list
CREATE TABLE hos_board_category_list (
	hos_board_category_code INT         primary key auto_increment, -- hos_board_category_code
	hos_board_category_name VARCHAR(50) NOT NULL  -- hos_board_category_name
);

-- hos_noshow
CREATE TABLE hos_noshow (
	noshow_no     INT primary key auto_increment, -- noshow_no
	noshow_person INT NOT NULL,     -- noshow_person
	noshow_pet    INT NOT NULL,     -- noshow_pet
	booking_no    INT NOT NULL  -- booking_no
);

-- hos_staff
CREATE TABLE hos_staff (
	staff_no        INT          primary key auto_increment, -- staff_no
	hos_code        INT          NOT NULL, -- hos_code
	staff_member_no INT          NOT NULL, -- staff_member_no
	staff_reg_date  DATETIME     NOT NULL default now(), -- staff_reg_date
	staff_title     VARCHAR(100) NOT NULL, -- staff_title
	hos_admin       CHAR         NOT NULL  -- hos_admin
);

-- hos_chart
CREATE TABLE hos_chart (
	chart_no     INT           primary key auto_increment, -- chart_no
	board_code   INT           NOT NULL, -- board_code
	hos_code     INT           NOT NULL, -- hos_code
	disease      VARCHAR(100)  NOT NULL, -- disease
	vet_no       INT           NOT NULL, -- vet_no
	diagnosis    VARCHAR(5000) NOT NULL, -- diagnosis
	warning      VARCHAR(3000) NULL,     -- warning
	member_no    INT           NOT NULL, -- member_no
	pet_no       INT           NOT NULL, -- pet_no
	next_booking DATE          NULL,      -- next_booking
    chart_reg_date DATETIME    NOT NULL default now()
);

-- ----------------------------------------------------------------------------------------------------최원영(메시지)
-- message
CREATE TABLE message (
	msg_id       INT           PRIMARY KEY auto_increment, -- msg_id
	chat_id      INT           NOT NULL, -- chat_id
	sender_no    INT           NOT NULL,     -- sender_no
	msg_body 	 VARCHAR(1000) NULL,     -- message_body
	date_sent    DATETIME      NULL default now(),     -- date_sent
	msg_type     INT           NOT NULL      -- msg_type
);

-- chat
CREATE TABLE chat (
	chat_id            INT  PRIMARY KEY auto_increment, -- chat_id
	recipient_group_id INT NOT NULL      -- recipient_group_id
);

-- recipient_group
CREATE TABLE recipient_group (
	recipient_group_id INT      PRIMARY KEY auto_increment, -- recipient_group_id
	recipient_no       INT      Not NULL,     -- recipient_no
	recipient_type     INT      not NULL,     -- recipient_type
	date_read          DATETIME NULL,     -- date_read
	trash              INT      NULL  default 0   -- trash
);

-- message_type
CREATE TABLE message_type (
	type_id INT          PRIMARY KEY, -- type_id
	type    VARCHAR(100) NOT NULL  -- type
);

-- message_ignore
CREATE TABLE message_ignore (
	ignore_no               INT PRIMARY KEY auto_increment, -- ignore_no
	member_no               INT NOT NULL, -- member_no
	target_member_no INT not NULL      -- ignore_target_member_no
);

-- ----------------------------------------------------------------------------------------------------이경(로그인)
-- member
CREATE TABLE member (
	member_no            INT           primary key auto_increment, -- member_no
	member_email         VARCHAR(50)   NOT NULL, -- member_email
	password             VARCHAR(100)   NOT NULL, -- password
	member_grade         CHAR          NOT NULL, -- member_grade
	member_name          VARCHAR(50)   NOT NULL, -- member_name
	member_phone         VARCHAR(15)   NOT NULL, -- member_phone
	member_nickname      VARCHAR(50)   NULL,     -- member_nickname
	hos_code             INT           NULL,     -- hos_code
	member_career        VARCHAR(1000) NULL,     -- member_career
	mailing_opt          CHAR          NULL,     -- mailing_opt
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

-- ----------------------------------------------------------------------------------------------------최창유(QnA)
CREATE TABLE qna (
	qna_no        INT           auto_increment primary key, -- qna_no
	board_code    INT           NOT NULL, -- board_code
	title         VARCHAR(50)   NOT NULL, -- title
	writer_no     INT           NOT NULL,     -- writer_no
	content       VARCHAR(4000) NOT NULL, -- content
	reg_date      DATETIME      NULL default now(),     -- reg_date
	view_cnt      INT           NULL default 0,     -- view_cnt
	category_code INT           NULL,     -- category_code
	answered      CHAR          NULL default 'N'      -- answered
);


-- qna_recommend
CREATE TABLE qna_recommend (
	no        INT primary key auto_increment, -- no
	member_no INT NOT NULL,     -- member_no
	qna_no    INT NOT NULL,     -- qna_no
	recommend INT(1) NOT NULL      -- recommend
);

-- qna_recommend

-- qna_comment
CREATE TABLE qna_comment (
	comment_no INT          primary key auto_increment, -- comment_no
	qna_no     INT          NOT NULL, -- qna_no
	commenter_no  INT          NOT NULL,     -- commenter_no
	content    VARCHAR(500) NOT NULL, -- content
	reg_date   DATETIME     NOT NULL default now(),     -- reg_date 
	pick       CHAR         NULL default 'N'     -- pick
);



-- qna_comment_recommend
CREATE TABLE qna_comment_recommend (
	no         INT primary key auto_increment, -- no
	member_no  INT NOT NULL, -- member_no
	comment_no INT NOT NULL, -- comment_no
	recommend  INT(1) NOT NULL  -- recommend
);



-- report_list
CREATE TABLE report_list (
	report_no        INT    primary key auto_increment, -- report_no
	board_code       INT    NOT NULL, -- board_code
	content_no       INT    NOT NULL, -- content_no
	comment_no       INT    NOT NULL,     -- comment_no
	report_member_no INT    NOT NULL,     -- report_member_no
	target_member_no INT    NOT NULL,     -- target_member_no
	report_code      INT    NOT NULL, -- report_code
	process_result   INT(1) NOT NULL,  -- process_result
    report_date		 DATETIME NOT NULL default now(),
    report_content   varchar(1000) null
);


-- qna_category_list
CREATE TABLE qna_category_list (
	category_code INT         primary key auto_increment, -- category_code
	category_name VARCHAR(50) NOT NULL  -- category_name
);


-- report_code_list
CREATE TABLE report_code_list (
	report_code INT         primary key auto_increment, -- report_code
	report_type VARCHAR(50) NOT NULL  -- report_type
);

-- ----------------------------------------------------------------------------------------------------조용제(Boards)
-- gallery
CREATE TABLE gallery (
	gallery_no INT           primary key	auto_increment, -- gallery_no
	board_code INT           NOT NULL, -- board_code
	writer_no  INT           NULL,     -- writer_no
	pet_no     INT           NULL,     -- pet_no
	title      VARCHAR(50)   NOT NULL, -- title
	content    VARCHAR(3000) NOT NULL, -- content
	reg_date   DATETIME      NULL default now(),     -- reg_date
	view_cnt   INT           NULL default 0     -- view_cnt
);


-- gallery_recommend
CREATE TABLE gallery_recommend (
	no         INT primary key 	auto_increment, -- no
	gallery_no INT NOT NULL, -- gallery_no
	member_no  INT NOT NULL, -- recommend_member_no
	recommend  INT NOT NULL  -- recommend
);



-- gallery_comment
CREATE TABLE gallery_comment (
	comment_no INT           primary key		auto_increment, -- comment_no
	gallery_no INT           NOT NULL, -- gallery_no
	commenter_no  INT           NULL,     -- comment_writer_no
	comment    VARCHAR(1000) NOT NULL, -- comment
	reg_date   DATETIME      NULL default now()      -- reg_date
);



-- gallery_comment_recommend
CREATE TABLE gallery_comment_recommend (
	no         int primary key		auto_increment, -- no
	comment_no INT NULL,     -- comment_no
	member_no  INT NULL,     -- member_no
	recommend  INT NULL      -- recommend
);



-- news
CREATE TABLE news (
	news_no       INT           primary key		auto_increment, -- news_no
	board_code    INT           NOT NULL, -- board_code
	title         VARCHAR(50)   NOT NULL, -- title
	member_no     INT           NULL,     -- writer_no
	content       VARCHAR(1000) NOT NULL, -- content
	reg_date      DATETIME      NULL default now(),     -- reg_date
	view_cnt      INT           NULL default 0,     -- view_cnt
	category_code INT           NOT NULL  -- category_code
);



-- news_recommend
CREATE TABLE news_recommend (
	no        int primary key	auto_increment, -- no
	news_no   INT NOT NULL, -- news_no
	member_no INT NOT NULL, -- member_no
	recommend INT NOT NULL  -- recommend
);



-- news_comment_recommend
CREATE TABLE news_comment_recommend (
	no         INT primary key			auto_increment, -- no
	comment_no INT NULL,     -- comment_no
	member_no  INT NULL,     -- recommend_member_no
	recommend  INT NULL      -- recommend
);


-- news_comment
CREATE TABLE news_comment (
	comment_no INT           primary key			auto_increment, -- comment_no
	news_no    INT           NOT NULL, -- news_no
	commenter_no  INT           NULL,     -- comment_writer_no
	comment    VARCHAR(1000) NOT NULL, -- comment
	reg_date   DATETIME      NULL default now()      -- reg_date
);


-- news_category_list
CREATE TABLE news_category_list (
	category_code INT         primary key auto_increment, -- category_code
	category_name VARCHAR(40) NULL      -- category_name
);

