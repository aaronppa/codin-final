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

