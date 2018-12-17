select m.chat_id, r.recipient_no, r.recipient_type, m.sender_no, mem.member_nickname sender_nickname, r.date_read, r.trash
  from recipient_group r
  inner join message m on m.chat_id=r.recipient_group_id
  inner join (select member_nickname, member_no
					from member) as mem on m.sender_no = mem.member_no
 where recipient_no = 4;
 
 select m.chat_id, r.recipient_no, r.recipient_type, m.sender_no, member_nickname sender_nickname, m.date_sent, r.date_read, r.trash, member_file_path, member_sys_name
   from message m
	inner join (select * 
                     from recipient_group r
                     inner join (select member_no, member_nickname, member_file_path, member_sys_name
										from member
									  where member_no = 4) mem on mem.member_no = r.recipient_no) r on m.chat_id = r.recipient_group_id;

select m.chat_id, r.recipient_no, r.recipient_type, m.sender_no, member_nickname sender_nickname, m.date_sent, r.date_read, r.trash, member_file_path, member_sys_name
   from message m
	inner join (select * 
                     from recipient_group r
                     inner join (select member_no, member_nickname, member_file_path, member_sys_name
										from member
									  where member_no = 4) mem on mem.member_no = r.recipient_no
                                      where trash != 1
                                      ) r on m.chat_id = r.recipient_group_id;


select *
 from recipient_group r
 inner join (select member_no, member_nickname, member_file_path, member_sys_name
				 from member) mem on mem.member_no = r.recipient_no
where recipient_group_id = 11;

-- 내 대화방 불러오기 
select msg_id, chat_id, msg_body, latest_msg_date, msg_type, recipient_no
from recipient_group r
inner join(select *
	            from message m
                 inner join (select MAX(date_sent) as latest_msg_date
		                          from message
                                  group by chat_id
                                  ) max on max.latest_msg_date = m.date_sent) l on l.chat_id = r.recipient_group_id
where recipient_no = 3
order by msg_id desc;

-- 각 대화방별 대화 불러오기 
select msg_id, chat_id, sender_no, msg_body, date_sent, recipient_no, recipient_type, date_read, trash, msg_type, mem.member_nickname 
from recipient_group r
inner join message m on m.chat_id = r.recipient_group_id
inner join member mem on mem.member_no = m.sender_no
where chat_id = 1
and trash =0
and recipient_no = 3
order by date_sent asc;

-- 각 대화방별 대화 불러오기 Test
select *
from recipient_group r
inner join(select *
	            from message) m on m.chat_id = r.recipient_group_id
where chat_id = 1
and trash =0
and recipient_no = 3
order by date_sent asc;

--  내 대화방의 수신자 불러오기
select recipient_group_id, recipient_no, trash, member_no, member_nickname, member_file_path, member_sys_name
		from recipient_group  r
 		inner join (select member_no, member_nickname, member_file_path, member_sys_name
				    from member) mem on mem.member_no = r.recipient_no
		where trash = 0
        and recipient_group_id = 1;
        
-- update test 나만 뺴고
select msg_id, chat_id, sender_no, msg_body, date_sent, recipient_no, recipient_type, date_read, trash, msg_type, mem.member_nickname 
from recipient_group r
inner join message m on m.chat_id = r.recipient_group_id
inner join member mem on mem.member_no = m.sender_no
-- where chat_id = 1
-- and msg_id = 67
and trash =0
-- and recipient_no = 3
order by date_sent asc;

-- 읽은 메세지 있는 지 확인 
select msg_id, chat_id, sender_no, mem.member_nickname as sender_nickname, msg_body, date_sent, recipient_no, recipient_type, date_read, trash, msg_type
from recipient_group r
inner join message m on m.chat_id = r.recipient_group_id
inner join member mem on mem.member_no = m.sender_no
where date_read is null
and recipient_no= 3;



