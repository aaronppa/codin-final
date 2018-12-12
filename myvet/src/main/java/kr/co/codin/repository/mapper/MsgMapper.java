package kr.co.codin.repository.mapper;

import java.util.List;

import kr.co.codin.repository.domain.Message;
import kr.co.codin.repository.domain.RecipientGroup;
import kr.co.codin.repository.domain.SearchMemberHospital;

public interface MsgMapper {
	List<SearchMemberHospital> selectSearchMember(String keyword);
	List<SearchMemberHospital> selectSearchHospital(String keyword);
	void insertChatId();
	void insertMsg(Message msg);
	void insertRecipientGroup(RecipientGroup rg);
}
