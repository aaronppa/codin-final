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
		System.out.println("내대화방 메세지 불러오기 접근");
		RecipientGroup myRg = new RecipientGroup();
		myRg.setRecipientNo(me);
		myRg.setRecipientGroupId(chatId);
		
		return service.selectChatMsg(myRg);
	}
	
	// 수신자 검색 
	@RequestMapping("searchMember.do")
	@ResponseBody
	public Map<String, Object> searchMember(String keyword) throws Exception{
		Map<String, Object> map = new HashMap<>();
		if(keyword!="") {
			// System.out.println("Msg Search Member: "+keyword);
			map.put("member", service.searchMember(keyword));
			// System.out.println("Msg Search Member Result: "+service.searchMember(keyword));
			map.put("hospital", service.searchHospital(keyword));
			// System.out.println("Msg Search Hospital Result: "+service.searchHospital(keyword));
		}
		return map;
	} // searchMember.do
	
	// 메세지 입력
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	@ResponseBody
	public int insertMsg(Message msg, 
						  @RequestParam(value="recipientNo", required = false) List<Integer> memberRecipients, 
					      @RequestParam(value="recipientHosNo", required = false) List<Integer> hosRecipients) throws Exception {
		int chatId=0;
			
		msg.setMsgType(1);
		
		System.out.println(msg+", "+memberRecipients+", "+hosRecipients);
		
		// 신규메세지인 경우 
		if(msg.getChatId()==0) {
			System.out.println("신규메세지 입력 들어옴.");
			service.insertChatId(msg);
			chatId = msg.getChatId();
			System.out.println("New ChatId: "+chatId);
			
			// 본인도 수신자 그룹 리스트에 포함시켜야함. 
			RecipientGroup self = new RecipientGroup();
			self.setRecipientGroupId(chatId);
			self.setRecipientNo(msg.getSenderNo());
			service.insertRecipientGroup(self);
			
			if(memberRecipients!=null) {
				for(int member : memberRecipients) {
					RecipientGroup rg = new RecipientGroup();
					rg.setRecipientGroupId(chatId);
					rg.setRecipientNo(member);
					service.insertRecipientGroup(rg);
				}
			}
			
			if(hosRecipients!=null) {
//				RecipientGroup self = new RecipientGroup();
//				self.setRecipientGroupId(chatId);
//				// Sender 가 병원직원일 경우.. 문제 발생...
//				self.setRecipientNo(msg.getSenderNo());
//				service.insertRecipientGroup(self);
				for(int hos : hosRecipients) {
					RecipientGroup rg = new RecipientGroup();
					rg.setRecipientGroupId(chatId);
					rg.setRecipientNo(hos);
					rg.setRecipientType(1);
					service.insertRecipientGroup(rg);
				}
			}
			System.out.println("Insert Msg param: "+msg);
			service.insertMsg(msg);
			
		} 
		// 기존 대화방인 경우 
		else{
			service.insertMsg(msg);
		}
		return chatId;
	} // insert.do
	
} // End Class
