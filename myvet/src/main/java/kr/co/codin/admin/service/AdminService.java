package kr.co.codin.admin.service;

import java.util.List;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.Notice;
import kr.co.codin.repository.domain.Page;

public interface AdminService {
	List<Notice> noticeList(Page page);
	Notice noticeDetail(int no);
	int noticeCount();
	void write(Notice notice);
	void save(Notice notice);
	List<Member> vetList(Page page);
}

