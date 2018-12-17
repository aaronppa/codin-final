package kr.co.codin.msg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Message;
import kr.co.codin.repository.domain.RecipientGroup;
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

	@Override
	public void insertChatId(Message msg) {
		mapper.insertChatId(msg);
	}

	@Override
	public void insertMsg(Message msg) {
		mapper.insertMsg(msg);
	}

	@Override
	public void insertRecipientGroup(RecipientGroup rg) {
		mapper.insertRecipientGroup(rg);
		
	}

	@Override
	public List<Message> selectMyChat(int memberNo) {
		return mapper.selectMyChat(memberNo);
	}

	@Override
	public List<Message> selectChatMsg(RecipientGroup myRg) {
		return mapper.selectChatMsg(myRg);
	}

	@Override
	public void selfRead(RecipientGroup myRg) {
		mapper.selfRead(myRg);	
	}

	@Override
	public void resetDateRead(int chatId) {
		mapper.resetDateRead(chatId);
	}

	@Override
	public void updateMyReadDate(RecipientGroup myRg) {
		mapper.updateMyReadDate(myRg);
	}

	@Override
	public int countUnreadMsg(int recipientNo) {
		return mapper.countUnreadMsg(recipientNo);
	}

	
}
