-- ----------------------------------------------------------------------------------------------------공용
-- board_list
CREATE TABLE board_list (
	board_code INT          NOT NULL, -- board_code
	item_name  VARCHAR(100) NULL      -- item_name
);

-- board_list
ALTER TABLE board_list
	ADD CONSTRAINT PK_board_list -- board_list 기본키
		PRIMARY KEY (
			board_code -- board_code
		);

-- file
CREATE TABLE file (
	file_id    INT           NOT NULL, -- file_id
	board_code INT           NULL,     -- board_code
	board_no   VARCHAR(20)   NULL,     -- board_no
	ori_name   VARCHAR(500)  NULL,     -- ori_name
	sys_name   VARCHAR(500)  NULL,     -- sys_name
	file_path  VARCHAR(3000) NULL,     -- file_path
	file_size  INT           NULL      -- file_size
);

-- file
ALTER TABLE file
	ADD CONSTRAINT PK_file -- file 기본키
		PRIMARY KEY (
			file_id -- file_id
		);

-- ----------------------------------------------------------------------------------------------------유병욱(병원메뉴)
-- notice
CREATE TABLE notice (
	notice_no       INTEGER       NOT NULL, -- notice_no
	notice_title    VARCHAR(100)  NOT NULL, -- notice_title
	notice_writer   INT           NULL,     -- notice_writer
	notice_reg_date DATETIME      NULL default now(),     -- notice_reg_date
	notice_view_cnt INT           NULL default 0,     -- notice_view_cnt
	notice_content  VARCHAR(5000) NOT NULL  -- notice_content
);

-- notice
ALTER TABLE notice
	ADD CONSTRAINT PK_notice -- notice 기본키
		PRIMARY KEY (
			notice_no -- notice_no
		);

-- hos_hours
CREATE TABLE hos_hours (
	hours_no   INT  NOT NULL, -- hours_no
	hos_code   INT  NOT NULL, -- hos_code
	open_day   INT  NOT NULL, -- open_day
	open_time  TIME NULL,     -- open_time
	close_time TIME NULL,     -- close_time
	dayoff     CHAR NULL      -- dayoff
);

-- hos_hours
ALTER TABLE hos_hours
	ADD CONSTRAINT PK_hos_hours -- hos_hours 기본키
		PRIMARY KEY (
			hours_no -- hours_no
		);

-- hos_basic
CREATE TABLE hos_basic (
	hos_code      INT           NOT NULL, -- hos_code
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
	hos_homepage  VARCHAR(300)  NULL,     -- hos_homepage
	hos_comment   VARCHAR(3000) NULL      -- hos_comment
);

-- hos_basic
ALTER TABLE hos_basic
	ADD CONSTRAINT PK_hos_basic -- hos_basic 기본키
		PRIMARY KEY (
			hos_code -- hos_code
		);

-- hos_sns
CREATE TABLE hos_sns (
	sns_no   INT          NOT NULL, -- sns_no
	hos_code INT          NOT NULL, -- hos_code
	sns_kind VARCHAR(50)  NOT NULL, -- sns_kind
	sns_name VARCHAR(100) NOT NULL  -- sns_name
);

-- hos_sns
ALTER TABLE hos_sns
	ADD CONSTRAINT PK_hos_sns -- hos_sns 기본키
		PRIMARY KEY (
			sns_no -- sns_no
		);

-- hos_review
CREATE TABLE hos_review (
	review_no               INT           NOT NULL, -- review_no
	hos_code                INT           NOT NULL, -- hos_code
	review_content          VARCHAR(1000) NOT NULL, -- review_content
	review_point            INT           NOT NULL, -- review_point
	review_writer_no 		INT           NOT NULL,     -- review_writer_no
    review_reg_date			datetime	  NOT NULL default now()
);

-- hos_review
ALTER TABLE hos_review
	ADD CONSTRAINT PK_hos_review -- hos_review 기본키
		PRIMARY KEY (
			review_no -- review_no
		);

-- hos_facility
CREATE TABLE hos_facility (
	facility_no       INT  NOT NULL, -- facility_no
	hos_code          INT  NOT NULL, -- hos_code
	facility_code     INT  NOT NULL, -- facility_code
	facility_bookable CHAR NOT NULL, -- facility_bookable
	staff_no          INT  NOT NULL, -- staff_no
	max_booking       INT  NULL default 1,     -- max_booking
	staff_no2         INT  NULL      -- staff_no2
);

-- hos_facility
ALTER TABLE hos_facility
	ADD CONSTRAINT PK_hos_facility -- hos_facility 기본키
		PRIMARY KEY (
			facility_no -- facility_no
		);

-- hos_facilitylist
CREATE TABLE hos_facilitylist (
	facility_code INT          NOT NULL, -- facility_code
	facility_name VARCHAR(100) NOT NULL  -- facility_name
);

-- hos_facilitylist
ALTER TABLE hos_facilitylist
	ADD CONSTRAINT PK_hos_facilitylist -- hos_facilitylist 기본키
		PRIMARY KEY (
			facility_code -- facility_code
		);

-- hos_block
CREATE TABLE hos_block (
	block_code  INT  NOT NULL, -- block_code
	hos_code    INT  NULL,     -- hos_code
	block_day   DATE NULL,     -- block_day
	block_no    INT  NULL,     -- block_no
	block_start TIME NULL,     -- block_start
	block_end   TIME NULL,     -- block_end
	facility_no INT  NULL      -- facility_no
);

-- hos_block
ALTER TABLE hos_block
	ADD CONSTRAINT PK_hos_block -- hos_block 기본키
		PRIMARY KEY (
			block_code -- block_code
		);

-- hos_booking
CREATE TABLE hos_booking (
	booking_no    INT  NOT NULL, -- booking_no
	block_code    INT  NOT NULL, -- block_code
	booking_owner INT  NOT NULL, -- booking_owner
	booking_pet   INT  NULL,     -- booking_pet
	confirm       CHAR NOT NULL  -- confirm
);

-- hos_booking
ALTER TABLE hos_booking
	ADD CONSTRAINT PK_hos_booking -- hos_booking 기본키
		PRIMARY KEY (
			booking_no -- booking_no
		);

-- hos_board
CREATE TABLE hos_board (
	hos_board_id            INT          NOT NULL, -- hos_board_id
	board_code              INT          NOT NULL, -- board_code
	hos_code                INT          NOT NULL, -- hos_code
	hos_board_no            INT          NOT NULL, -- hos_board_no
	hos_board_category_code INT          NOT NULL, -- hos_board_category_code
	hos_board_title         VARCHAR(100) NOT NULL, -- hos_board_title
	hos_board_writer_no     INT          NULL,     -- hos_board_writer_no
	hos_board_view_cnt      INT          NOT NULL default 0, -- hos_board_view_cnt
	hos_board_reg_date      DATETIME     NOT NULL default now() -- hos_board_reg_date
);

-- hos_board
ALTER TABLE hos_board
	ADD CONSTRAINT PK_hos_board -- hos_board 기본키
		PRIMARY KEY (
			hos_board_id -- hos_board_id
		);

-- hos_board_comment
CREATE TABLE hos_board_comment (
	hos_board_comment_no        INT           NOT NULL, -- hos_board_comment_no
	hos_board_id                INT           NOT NULL, -- hos_board_id
	hos_board_comment_writer_no INT           NULL,     -- hos_board_comment_writer_no
	hos_board_comment_content   VARCHAR(5000) NOT NULL,  -- hos_board_comment_content
    hos_board_comment_reg_date  DATETIME      NOT NULL default now()
);

-- hos_board_comment
ALTER TABLE hos_board_comment
	ADD CONSTRAINT PK_hos_board_comment -- hos_board_comment 기본키
		PRIMARY KEY (
			hos_board_comment_no -- hos_board_comment_no
		);

-- hos_board_category_list
CREATE TABLE hos_board_category_list (
	hos_board_category_code INT         NOT NULL, -- hos_board_category_code
	hos_board_category_name VARCHAR(50) NOT NULL  -- hos_board_category_name
);

-- hos_board_category_list
ALTER TABLE hos_board_category_list
	ADD CONSTRAINT PK_hos_board_category_list -- hos_board_category_list 기본키
		PRIMARY KEY (
			hos_board_category_code -- hos_board_category_code
		);

-- hos_noshow
CREATE TABLE hos_noshow (
	noshow_no     INT NOT NULL, -- noshow_no
	noshow_person INT NOT NULL,     -- noshow_person
	noshow_pet    INT NOT NULL,     -- noshow_pet
	booking_no    INT NOT NULL  -- booking_no
);

-- hos_noshow
ALTER TABLE hos_noshow
	ADD CONSTRAINT PK_hos_noshow -- hos_noshow 기본키
		PRIMARY KEY (
			noshow_no -- noshow_no
		);

-- hos_staff
CREATE TABLE hos_staff (
	staff_no        INT          NOT NULL, -- staff_no
	hos_code        INT          NOT NULL, -- hos_code
	staff_member_no INT          NOT NULL, -- staff_member_no
	staff_reg_date  DATETIME     NOT NULL default now(), -- staff_reg_date
	staff_title     VARCHAR(100) NOT NULL, -- staff_title
	hos_admin       CHAR         NOT NULL  -- hos_admin
);

-- hos_staff
ALTER TABLE hos_staff
	ADD CONSTRAINT PK_hos_staff -- hos_staff 기본키
		PRIMARY KEY (
			staff_no -- staff_no
		);

-- hos_chart
CREATE TABLE hos_chart (
	chart_no     INT           NOT NULL, -- chart_no
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

-- hos_chart
ALTER TABLE hos_chart
	ADD CONSTRAINT PK_hos_chart -- hos_chart 기본키
		PRIMARY KEY (
			chart_no -- chart_no
		);

-- ----------------------------------------------------------------------------------------------------최원영(메시지)
-- message
CREATE TABLE message (
	msg_id       INT           NOT NULL, -- msg_id
	chat_id      INT           NOT NULL, -- chat_id
	sender_id    INT           NULL,     -- sender_id
	message_body VARCHAR(1000) NULL,     -- message_body
	date_sent    DATETIME      NULL default now(),     -- date_sent
	mail_type    INT           NULL      -- mail_type
);

-- message
ALTER TABLE message
	ADD CONSTRAINT PK_message -- message 기본키
		PRIMARY KEY (
			msg_id -- msg_id
		);

-- chat
CREATE TABLE chat (
	chat_id            INT NOT NULL, -- chat_id
	recipient_group_id INT NULL      -- recipient_group_id
);

-- chat
ALTER TABLE chat
	ADD CONSTRAINT PK_chat -- chat 기본키
		PRIMARY KEY (
			chat_id -- chat_id
		);

-- recipient_group
CREATE TABLE recipient_group (
	recipient_group_id INT      NOT NULL, -- recipient_group_id
	recipient_id       INT      NULL,     -- recipient_id
	recipient_type     INT      NULL,     -- recipient_type
	date_read          DATETIME NULL,     -- date_read
	trash              INT      NULL      -- delete
);

-- recipient_group
ALTER TABLE recipient_group
	ADD CONSTRAINT PK_recipient_group -- recipient_group 기본키
		PRIMARY KEY (
			recipient_group_id -- recipient_group_id
		);

-- message_type
CREATE TABLE message_type (
	type_id INT          NOT NULL, -- type_id
	type    VARCHAR(100) NOT NULL  -- type
);

-- message_type
ALTER TABLE message_type
	ADD CONSTRAINT PK_message_type -- message_type 기본키
		PRIMARY KEY (
			type_id -- type_id
		);

-- message_ignore
CREATE TABLE message_ignore (
	ignore_no               INT NOT NULL, -- ignore_no
	member_no               INT NOT NULL, -- member_no
	ignore_target_member_no INT NULL      -- ignore_target_member_no
);

-- message_ignore
ALTER TABLE message_ignore
	ADD CONSTRAINT PK_message_ignore -- message_ignore 기본키
		PRIMARY KEY (
			ignore_no -- ignore_no
		);

-- ----------------------------------------------------------------------------------------------------이경(로그인)
-- member
CREATE TABLE member (
	member_no            INT           NOT NULL, -- member_no
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

-- member
ALTER TABLE member
	ADD CONSTRAINT PK_member -- member 기본키
		PRIMARY KEY (
			member_no -- member_no
		);

-- vet_auth
CREATE TABLE vet_auth (
	vet_file_no       INT         NOT NULL, -- vet_file_no
	member_no         INT         NULL,     -- member_no
	vet_ori_name      VARCHAR(50) NULL,     -- vet_ori_name
	vet_sys_name      VARCHAR(50) NULL,     -- vet_sys_name
	vet_file_path     VARCHAR(50) NULL,     -- vet_file_path
	vet_file_size     INT         NULL,     -- vet_file_size
	vet_file_reg_date DATETIME    NULL default now()     -- vet_file_reg_date
);

-- vet_auth
ALTER TABLE vet_auth
	ADD CONSTRAINT PK_vet_auth -- vet_auth 기본키
		PRIMARY KEY (
			vet_file_no -- vet_file_no
		);

-- pet
CREATE TABLE pet (
	pet_no            INT           NOT NULL, -- pet_no
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

-- pet
ALTER TABLE pet
	ADD CONSTRAINT PK_pet -- pet 기본키
		PRIMARY KEY (
			pet_no -- pet_no
		);

-- fav_hos
CREATE TABLE fav_hos (
	fav_hos_no INT NOT NULL, -- fav_hos_no
	pet_no     INT NOT NULL, -- pet_no
	member_no  INT NOT NULL, -- member_no
	hos_code   INT NOT NULL  -- hos_code
);

-- fav_hos
ALTER TABLE fav_hos
	ADD CONSTRAINT PK_fav_hos -- fav_hos 기본키
		PRIMARY KEY (
			fav_hos_no -- fav_hos_no
		);

-- pet_vaccine
CREATE TABLE pet_vaccine (
	vaccine_no   INT  NOT NULL, -- vaccine_no
	pet_no       INT  NOT NULL, -- pet_no
	vaccine_date DATETIME NOT NULL default now(), -- vaccine_date
	vaccine_code INT  NOT NULL, -- vaccine_code
	next_vaccine DATE NOT NULL, -- next_vaccine
	member_no    INT  NOT NULL  -- vet_no
);

-- pet_vaccine
ALTER TABLE pet_vaccine
	ADD CONSTRAINT PK_pet_vaccine -- pet_vaccine 기본키
		PRIMARY KEY (
			vaccine_no -- vaccine_no
		);

-- vaccine
CREATE TABLE vaccine (
	vaccine_code    INT          NOT NULL, -- vaccine_code
	vaccine_name    VARCHAR(100) NOT NULL, -- vaccine_name
	vaccine_expdate INT          NOT NULL  -- vaccine_expdate
);

-- vaccine
ALTER TABLE vaccine
	ADD CONSTRAINT PK_vaccine -- vaccine 기본키
		PRIMARY KEY (
			vaccine_code -- vaccine_code
		);

-- ----------------------------------------------------------------------------------------------------최창유(QnA)
-- qna
CREATE TABLE qna (
	qna_no        INT           NOT NULL, -- qna_no
	board_code    INT           NOT NULL, -- board_code
	title         VARCHAR(50)   NOT NULL, -- title
	writer_no     INT           NULL,     -- writer_no
	content       VARCHAR(4000) NOT NULL, -- content
	reg_date      DATETIME      NULL default now(),     -- reg_date
	view_cnt      INT           NULL default 0,     -- view_cnt
	category_code INT           NULL,     -- category_code
	answered      CHAR          NULL default 'N'      -- answered
);

-- qna
ALTER TABLE qna
	ADD CONSTRAINT PK_qna -- qna 기본키
		PRIMARY KEY (
			qna_no -- qna_no
		);

-- qna_recommend
CREATE TABLE qna_recommend (
	no        INT NOT NULL, -- no
	member_no INT NULL,     -- member_no
	qna_no    INT NULL,     -- qna_no
	recommend INT NULL      -- recommend
);

-- qna_recommend
ALTER TABLE qna_recommend
	ADD CONSTRAINT PK_qna_recommend -- qna_recommend 기본키
		PRIMARY KEY (
			no -- no
		);

-- qna_comment
CREATE TABLE qna_comment (
	comment_no INT          NOT NULL, -- comment_no
	qna_no     INT          NOT NULL, -- qna_no
	writer_no  INT          NULL,     -- writer_no
	content    VARCHAR(500) NOT NULL, -- content
	reg_date   DATETIME     NULL default now(),     -- reg_date
	pick       CHAR         NULL      -- pick
);

-- qna_comment
ALTER TABLE qna_comment
	ADD CONSTRAINT PK_qna_comment -- qna_comment 기본키
		PRIMARY KEY (
			comment_no -- comment_no
		);

-- qna_comment_recommend
CREATE TABLE qna_comment_recommend (
	no         INT NOT NULL, -- no
	member_no  INT NOT NULL, -- member_no
	comment_no INT NOT NULL, -- comment_no
	recommend  INT NOT NULL  -- recommend
);

-- qna_comment_recommend
ALTER TABLE qna_comment_recommend
	ADD CONSTRAINT PK_qna_comment_recommend -- qna_comment_recommend 기본키
		PRIMARY KEY (
			no -- no
		);

-- report_list
CREATE TABLE report_list (
	report_no        INT    NOT NULL, -- report_no
	board_code       INT    NOT NULL, -- board_code
	content_no       INT    NOT NULL, -- content_no
	comment_no       INT    NULL,     -- comment_no
	report_member_no INT    NULL,     -- report_member_no
	target_member_no INT    NULL,     -- target_member_no
	report_code      INT    NOT NULL, -- report_code
	process_result   INT(1) NOT NULL,  -- process_result
    report_date		 DATETIME NOT NULL default now()
);

-- report_list
ALTER TABLE report_list
	ADD CONSTRAINT PK_report_list -- report_list 기본키
		PRIMARY KEY (
			report_no -- report_no
		);

-- qna_category_list
CREATE TABLE qna_category_list (
	category_code INT         NOT NULL, -- category_code
	category_name VARCHAR(50) NOT NULL  -- category_name
);

-- qna_category_list
ALTER TABLE qna_category_list
	ADD CONSTRAINT PK_qna_category_list -- qna_category_list 기본키
		PRIMARY KEY (
			category_code -- category_code
		);

-- report_code_list
CREATE TABLE report_code_list (
	report_code INT         NOT NULL, -- report_code
	report_type VARCHAR(50) NOT NULL  -- report_type
);

-- report_code_list
ALTER TABLE report_code_list
	ADD CONSTRAINT PK_report_code_list -- report_code_list 기본키
		PRIMARY KEY (
			report_code -- report_code
		);
-- ----------------------------------------------------------------------------------------------------조용제(Boards)
-- gallery
CREATE TABLE gallery (
	gallery_no INT           NOT NULL, -- gallery_no
	board_code INT           NOT NULL, -- board_code
	writer_no  INT           NULL,     -- writer_no
	pet_no     INT           NULL,     -- pet_no
	title      VARCHAR(50)   NOT NULL, -- title
	content    VARCHAR(3000) NOT NULL, -- content
	reg_date   DATETIME      NULL default now(),     -- reg_date
	view_cnt   INT           NULL default 0     -- view_cnt
);

-- gallery
ALTER TABLE gallery
	ADD CONSTRAINT PK_gallery -- gallery 기본키
		PRIMARY KEY (
			gallery_no -- gallery_no
		);

-- gallery_recommend
CREATE TABLE gallery_recommend (
	no         INT NOT NULL, -- no
	gallery_no INT NOT NULL, -- gallery_no
	member_no  INT NOT NULL, -- member_no
	recommend  INT NOT NULL  -- recommend
);

-- gallery_recommend
ALTER TABLE gallery_recommend
	ADD CONSTRAINT PK_gallery_recommend -- gallery_recommend 기본키
		PRIMARY KEY (
			no -- no
		);

-- gallery_comment
CREATE TABLE gallery_comment (
	comment_no INT           NOT NULL, -- comment_no
	gallery_no INT           NOT NULL, -- gallery_no
	member_no  INT           NULL,     -- writer_no
	comment    VARCHAR(1000) NOT NULL, -- comment
	reg_date   DATETIME      NULL default now()      -- reg_date
);

-- gallery_comment
ALTER TABLE gallery_comment
	ADD CONSTRAINT PK_gallery_comment -- gallery_comment 기본키
		PRIMARY KEY (
			comment_no -- comment_no
		);

-- gallery_comment_recommend
CREATE TABLE gallery_comment_recommend (
	no         INT NOT NULL, -- no
	comment_no INT NULL,     -- comment_no
	member_no  INT NULL,     -- member_no
	recommend  INT NULL      -- recommend
);

-- gallery_comment_recommend
ALTER TABLE gallery_comment_recommend
	ADD CONSTRAINT PK_gallery_comment_recommend -- gallery_comment_recommend 기본키
		PRIMARY KEY (
			no -- no
		);

-- news
CREATE TABLE news (
	news_no       INT           NOT NULL, -- news_no
	board_code    INT           NOT NULL, -- board_code
	title         VARCHAR(50)   NOT NULL, -- title
	member_no     INT           NULL,     -- writer_no
	content       VARCHAR(1000) NOT NULL, -- content
	reg_date      DATETIME      NULL default now(),     -- reg_date
	view_cnt      INT           NULL default 0,     -- view_cnt
	category_code INT           NOT NULL  -- category_code
);

-- news
ALTER TABLE news
	ADD CONSTRAINT PK_news -- news 기본키
		PRIMARY KEY (
			news_no -- news_no
		);

-- news_recommend
CREATE TABLE news_recommend (
	no        INT NOT NULL, -- no
	news_no   INT NOT NULL, -- news_no
	member_no INT NOT NULL, -- member_no
	recommend INT NOT NULL  -- recommend
);

-- news_recommend
ALTER TABLE news_recommend
	ADD CONSTRAINT PK_news_comment -- news_comment 기본키
		PRIMARY KEY (
			no -- no
		);

-- news_comment_recommend
CREATE TABLE news_comment_recommend (
	no         INT NOT NULL, -- no
	comment_no INT NULL,     -- comment_no
	member_no  INT NULL,     -- member_no
	recommend  INT NULL      -- recommend
);

-- news_comment_recommend
ALTER TABLE news_comment_recommend
	ADD CONSTRAINT PK_news_comment_recommend -- news_comment_recommend 기본키
		PRIMARY KEY (
			no -- no
		);

-- news_comment
CREATE TABLE news_comment (
	comment_no INT           NOT NULL, -- comment_no
	news_no    INT           NOT NULL, -- news_no
	writer_no  INT           NULL,     -- writer_no
	comment    VARCHAR(1000) NOT NULL, -- comment
	reg_date   DATETIME      NULL default now()      -- reg_date
);

-- news_comment
ALTER TABLE news_comment
	ADD CONSTRAINT PK_news_comment -- news_comment2 기본키
		PRIMARY KEY (
			comment_no -- comment_no
		);

-- news_category_list
CREATE TABLE news_category_list (
	category_code INT         NOT NULL, -- category_code
	category_name VARCHAR(40) NULL      -- category_name
);

-- news_category_list
ALTER TABLE news_category_list
	ADD CONSTRAINT PK_news_category_list -- news_category_list 기본키
		PRIMARY KEY (
			category_code -- category_code
		);



