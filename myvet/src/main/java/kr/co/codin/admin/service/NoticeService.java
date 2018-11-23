package kr.co.codin.admin.service;

import java.util.List;

import kr.co.codin.repository.domain.Notice;
import kr.co.codin.repository.domain.Page;

public interface NoticeService {
	List<Notice> noticeList(Page page);
	Notice noticeDetail(int no);
	int noticeCount();
	void incrementViewCnt(int no);
}
