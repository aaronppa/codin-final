package kr.co.codin.repository.mapper;

import java.util.List;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.Notice;
import kr.co.codin.repository.domain.Search;

public interface AdminMapper {
	List<Notice> noticeList(Search search);
	Notice noticeDetail(int no);
	int noticeCount();
	void insertNotice(Notice notice);
	void insertNoticeSave(Notice notice);
	List<Member> memberList(Search search);
	int memberCount();
}
