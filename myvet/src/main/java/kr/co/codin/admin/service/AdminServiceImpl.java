package kr.co.codin.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.Notice;
import kr.co.codin.repository.domain.Page;
import kr.co.codin.repository.mapper.NoticeMapper;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	NoticeMapper noticeMapper;
	
	@Override
	public void write(Notice notice) {
		noticeMapper.insertNotice(notice);
		
	}

	@Override
	public void save(Notice notice) {
		noticeMapper.insertNoticeSave(notice);
	}

	@Override
	public List<Member> vetList(Page page) {
		// TODO Auto-generated method stub
		return null;
	}
}
