package kr.co.codin.repository.mapper;

import java.util.List;

import kr.co.codin.repository.domain.Notice;
import kr.co.codin.repository.domain.Page;

public interface AdminMapper {
	List<Notice> noticeList(Page page);
	Notice noticeDetail(int no);
	int noticeCount();
	void insertNotice(Notice notice);
	void insertNoticeSave(Notice notice);
}
