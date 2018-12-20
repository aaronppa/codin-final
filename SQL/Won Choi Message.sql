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
select msg_id, chat_id, msg_body, latest_msg_date, msg_type, recipient_no, date_read, recipient_type
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

-- 각 대화방별 대화 불러오기 병원 포함 Test
		select msg_id, chat_id, msg_body, date_sent, recipient_no, recipient_type, date_read, trash, msg_type, sender_no, mem.member_nickname sender_nickname, title as sender_nickname
		from recipient_group r
			inner join message m on m.chat_id = r.recipient_group_id
			left outer join member mem on mem.member_no = m.sender_no
			left outer join hos_basic hos on hos.hos_code = m.sender_no
		where chat_id = 57
		and recipient_no = 11
		and trash =0
		order by msg_id asc;

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
and recipient_no= 45;

--  내 대화방의 수신자 불러오기 2
select recipient_group_id, recipient_no, recipient_type, trash, member_nickname, member_file_path, member_sys_name, hos_code, title, file_path as hos_file_path, sys_name as hos_sys_name
		from recipient_group  r
		left outer join (select member_no, member_nickname, member_file_path, member_sys_name
				         from member) mem on mem.member_no = r.recipient_no
		left outer join (select hos_code, title,file_path, sys_name
						 from hos_basic hb
						  left outer join (select file_id, file_path, sys_name, board_no
						 			 from file_info
						 			 where board_code = 30) f on f.file_id = hb.thumb_img
						 where hos_register = 'Y') h on h.hos_code = r.recipient_no
        where trash = 0
        and recipient_group_id = 60
        and recipient_no != 3;


select count(*)
		from(select *
		from recipient_group r
			inner join message m on m.chat_id = r.recipient_group_id
			left outer join (select member_no from member) mem on mem.member_no = m.sender_no
            left outer join hos_basic h on h.hos_code = m.sender_no
		where date_read is null
		and recipient_no = 3
		and m.sender_no !=3
        group by chat_id) as t;
        
select *
		from recipient_group r
			inner join message m on m.chat_id = r.recipient_group_id
			left outer join member mem on mem.member_no = m.sender_no
            left outer join hos_basic h on h.hos_code = m.sender_no
		  where date_read is null
		  and recipient_no = 45
		  and m.sender_no !=45
		  group by chat_id;

select *
		from recipient_group r
			inner join message m on m.chat_id = r.recipient_group_id
            left outer join member mem on mem.member_no = m.sender_no
            left outer join hos_basic h on h.hos_code = m.sender_no;

select *
		from recipient_group r; 