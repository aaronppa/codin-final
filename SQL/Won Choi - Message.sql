-- ----------------------------------------------------------------------------------------------------최원영(메시지)
-- message
CREATE TABLE message (
	msg_id       INT           PRIMARY KEY auto_increment, -- msg_id
	chat_id      INT           NOT NULL, -- chat_id
	sender_no    INT           NOT NULL,     -- sender_no
	msg_body VARCHAR(1000) NULL,     -- message_body
	date_sent    DATETIME      NULL default now(),     -- date_sent
	msg_type    INT           NOT NULL      -- msg_type
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
