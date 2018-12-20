package kr.co.codin.msg.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.codin.msg.service.MsgService;
import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.Message;
import kr.co.codin.repository.domain.RecipientGroup;

@Controller
@RequestMapping("msg")
public class MsgController {

	@Autowired
	private MsgService service;
	
	// 첫 로딩시 대화방 리스트 불러오기 
	@RequestMapping("main.do")
	public void main(Model model, HttpSession session) throws Exception{
		Member member = (Member) session.getAttribute("user");
		System.out.println("main.do first loading:"+member.getMemberNo()+" "+member.getMemberNickname());
		List<Message> myChats = service.selectMyChat(member.getMemberNo());
		System.out.println("myChats Results:"+myChats);
		model.addAttribute("myChat", myChats);
	}

	// 개별 대화방의 대화내용 불러오기
	@RequestMapping(value="/{me}/{chatId}.do")
	@ResponseBody
	public List<Message> retrieveChat(@PathVariable int me, @PathVariable int chatId) throws Exception{
		System.out.println("내대화방 메세지 불러오기 접근 대화방 ID: "+chatId);
		RecipientGroup myRg = new RecipientGroup();
		myRg.setRecipientNo(me);
		myRg.setRecipientGroupId(chatId);
		
		// 메세지 읽음 날짜 Stamp찍기 
		service.updateMyReadDate(myRg);
		
		return service.selectChatMsg(myRg);
	}
	
	
	// 수신자 검색 
	@RequestMapping("searchMember.do")
	@ResponseBody
	public Map<String, Object> searchMember(String type, String keyword) throws Exception{
		Map<String, Object> map = new HashMap<>();
		System.out.println("수신자 찾기 들어옴");
		System.out.println("Type: "+type);
		System.out.println("Keyword: "+keyword);
		switch(type) {
		case "member": map.put("member", service.searchMember(keyword));
		               break;
		case "hospital": map.put("hospital", service.searchHospital(keyword));
						 break;
		default: return null;
		}
		return map;
	} // searchMember.do
	
	
	// 메세지 입력
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	@ResponseBody
	public int insertMsg(Message msg, 
						 @RequestParam(value="recipientType", required = false) int recipientType,
						 @RequestParam(value="recipientNo", required = false) List<Integer> recipients) throws Exception {
		int chatId=0;
		RecipientGroup self = new RecipientGroup();
		if(recipientType==0) {
			msg.setMsgType(1);			
		} else if(recipientType==1) {
			msg.setMsgType(5);
		}
		System.out.println("insert.do 들어옴");
		System.out.println("메세지: "+msg+", 수신자: "+recipients);
		
		// 신규메세지인 경우 
		if(msg.getChatId()==0) {
			System.out.println("신규메세지 입력 들어옴.");
			service.insertChatId(msg);
			chatId = msg.getChatId();
			System.out.println("New ChatId: "+chatId);
			
			// 본인도 수신자 그룹 리스트에 포함시켜야함. 			
			self.setRecipientGroupId(chatId);
			self.setRecipientNo(msg.getSenderNo());
			// 본인 수신자그룹에 포함 
			service.insertRecipientGroup(self);
	
			for(int recipient : recipients) {
				RecipientGroup rg = new RecipientGroup();
				rg.setRecipientType(recipientType);			
				rg.setRecipientGroupId(chatId);
				rg.setRecipientNo(recipient);
				service.insertRecipientGroup(rg);
			}
			
			System.out.println("Insert Msg param: "+msg);
			service.insertMsg(msg);
			// 읽음 날짜 모두 리셋 
			service.resetDateRead(chatId);
			// 본인 메세지는 바로 읽은 날짜 Stamp 찍기 
			service.selfRead(self);
		} 
		// 기존 대화방인 경우 
		else{
			service .insertMsg(msg);
			// 읽음 날짜 모두 리셋 
			service.resetDateRead(msg.getChatId());
			// 본인 메세지는 바로 읽은 날짜 Stamp 찍기 
			self.setRecipientGroupId(msg.getChatId());
			self.setRecipientNo(msg.getSenderNo());
			self.setMsgId(msg.getMsgId());
			service.selfRead(self);
		}
		
		return chatId;
	} // insert.do
	
	// 신규 메세지 도착 알림
	@RequestMapping("alertnew.do")
	@ResponseBody
	public Map<String, Object> alertNew(int memberNo) throws Exception{
		System.out.println("updating unread Cnt");
		Map<String, Object> map = new HashMap<>();
		map.put("NewMsgCnt", service.countUnreadMsg(memberNo));
		map.put("NewMsg", service.selectMyChatNew(memberNo));
		System.out.println("new unread: "+map);
		return map;
	}
	
	// 대화방 나가면 수신자 그룹에서 trash 처리 
	
} // End Class
