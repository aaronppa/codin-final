package kr.co.codin.msg.service;

import java.util.List;

import kr.co.codin.repository.domain.SearchMemberHospital;

public interface MsgService {

	List<SearchMemberHospital> searchMember(String keyword);
	List<SearchMemberHospital> searchHospital(String keyword);
	
}
