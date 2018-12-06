package kr.co.codin.admin.service;

import java.util.List;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.Notice;
import kr.co.codin.repository.domain.Search;
import kr.co.codin.repository.domain.VetAuth;

public interface AdminService {
	List<Notice> noticeList(Search search);
	Notice noticeDetail(int no);
	int noticeCount(Search search);
	void write(Notice notice);
	void save(Notice notice);
	List<Member> memberList(Search search);
	int memberCount(Search search);
	Member memberDetail(int itemno);
	Member vetAuthDetail(int itemno);
	void updateStatus(Member vetApproval);
}

