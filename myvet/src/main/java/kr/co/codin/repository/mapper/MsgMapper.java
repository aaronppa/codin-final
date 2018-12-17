package kr.co.codin.repository.mapper;

import java.util.List;

import kr.co.codin.repository.domain.Message;
import kr.co.codin.repository.domain.RecipientGroup;
import kr.co.codin.repository.domain.SearchMemberHospital;

public interface MsgMapper {
	List<SearchMemberHospital> selectSearchMember(String keyword);
	List<SearchMemberHospital> selectSearchHospital(String keyword);
	void insertChatId(Message msg);
	void insertMsg(Message msg);
	void insertRecipientGroup(RecipientGroup rg);
	List<Message> selectMyChat(int memberNo);
	List<Message> selectChatMsg(RecipientGroup myRg);
	void selfRead(RecipientGroup myRg);
	void resetDateRead(int chatId);
	void updateMyReadDate(RecipientGroup myRg);
	int countUnreadMsg(int recipientNo);
}
