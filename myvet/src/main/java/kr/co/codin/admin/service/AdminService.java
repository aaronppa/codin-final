package kr.co.codin.admin.service;

import java.util.List;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.Notice;
import kr.co.codin.repository.domain.Page;
import kr.co.codin.repository.domain.Search;

public interface AdminService {
	List<Notice> noticeList(Search search);
	Notice noticeDetail(int no);
	int noticeCount();
	void write(Notice notice);
	void save(Notice notice);
	List<Member> vetList(Search search);
	List<Member> memberList(Search search);
	int memberCount();
}

