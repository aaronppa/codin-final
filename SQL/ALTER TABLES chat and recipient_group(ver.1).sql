drop table `recipient_group`;

CREATE TABLE `recipient_group` (
  `recipient_group_id` int(11) NOT NULL,
  `recipient_no` int(11) NOT NULL,
  `recipient_type` int(11) NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `trash` int(11) DEFAULT '0',
  PRIMARY KEY (`recipient_group_id`, `recipient_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

alter table `chat`
 drop column `recipient_group_id`;