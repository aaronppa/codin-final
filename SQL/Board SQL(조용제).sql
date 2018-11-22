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
	category_code INT         primary key, -- category_code
	category_name VARCHAR(40) NULL      -- category_name
);

-- news_category_list
ALTER TABLE news_category_list
	ADD CONSTRAINT PK_news_category_list -- news_category_list 기본키
		PRIMARY KEY (
			category_code -- category_code
		);
