package kr.co.codin.msg.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.codin.msg.service.MsgService;
import kr.co.codin.repository.domain.Message;

@Controller
@RequestMapping("msg")
public class MsgController {

	@Autowired
	private MsgService service;

	@RequestMapping("main.do")
	public void main() throws Exception{
		;;
	}

	// 수신자 검색 
	@RequestMapping("searchMember.do")
	@ResponseBody
	public Map<String, Object> searchMember(String keyword) throws Exception{
		Map<String, Object> map = new HashMap<>();
		if(keyword!="") {
			System.out.println("Msg Search Member: "+keyword);
			map.put("member", service.searchMember(keyword));
			System.out.println("Msg Search Member Result: "+service.searchMember(keyword));
			map.put("hospital", service.searchHospital(keyword));
			System.out.println("Msg Search Hospital Result: "+service.searchHospital(keyword));
		}
		return map;
	}
	
	// 메세지 입력
	@RequestMapping("insert.do")
	public void insertMsg(Message message, 
						  @RequestParam(value="recipientNo") List<Integer> memberRecipients, 
					      @RequestParam(value="recipientHosNo") List<Integer> hosRecipients) throws Exception {
		System.out.println(message+", "+memberRecipients+", "+hosRecipients);
	}
}
