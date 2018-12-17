package kr.co.codin.msg.service;

import java.util.List;

import kr.co.codin.repository.domain.Message;
import kr.co.codin.repository.domain.RecipientGroup;
import kr.co.codin.repository.domain.SearchMemberHospital;

public interface MsgService {

	List<SearchMemberHospital> searchMember(String keyword);
	List<SearchMemberHospital> searchHospital(String keyword);
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
