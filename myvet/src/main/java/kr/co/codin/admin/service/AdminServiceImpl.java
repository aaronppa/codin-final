package kr.co.codin.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.Notice;
import kr.co.codin.repository.domain.Page;
import kr.co.codin.repository.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	AdminMapper mapper;
	
	@Override
	public void write(Notice notice) {
		mapper.insertNotice(notice);
		
	}

	@Override
	public void save(Notice notice) {
		mapper.insertNoticeSave(notice);
	}

	@Override
	public List<Member> vetList(Page page) {
		// TODO Auto-generated method stub
		return null;
	}

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

}
