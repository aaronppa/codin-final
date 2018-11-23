package kr.co.codin.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Notice;
import kr.co.codin.repository.domain.Page;
import kr.co.codin.repository.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	NoticeMapper mapper;

	@Override
	public List<Notice> noticeList(Page page) {
		return mapper.noticeList(page);
	}

	@Override
	public Notice noticeDetail(int no) {
		// TODO Auto-generated method stub
		return mapper.noticeDetail(no);
	}

	@Override
	public int noticeCount() {
		return mapper.noticeCount();
	}

	@Override
	public void incrementViewCnt(int no) {
		mapper.incrementViewCnt(no);
	}
}
