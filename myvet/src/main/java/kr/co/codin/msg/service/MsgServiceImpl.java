package kr.co.codin.msg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.SearchMemberHospital;
import kr.co.codin.repository.mapper.MsgMapper;

@Service
public class MsgServiceImpl implements MsgService{
	@Autowired
	MsgMapper mapper;
	
	@Override
	public List<SearchMemberHospital> searchMember(String keyword) {
		
		return mapper.selectSearchMember(keyword);
	}

	@Override
	public List<SearchMemberHospital> searchHospital(String keyword) {
		return mapper.selectSearchHospital(keyword);
	}

}
