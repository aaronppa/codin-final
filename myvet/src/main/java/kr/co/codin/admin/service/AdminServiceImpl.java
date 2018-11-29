package kr.co.codin.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.Notice;
import kr.co.codin.repository.domain.Search;
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
	public List<Member> vetList(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Notice> noticeList(Search search) {
		return mapper.noticeList(search);
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
	public List<Member> memberList(Search search) {
		return mapper.memberList(search);
	}

	@Override
	public int memberCount() {
		return mapper.memberCount();
	}

}
