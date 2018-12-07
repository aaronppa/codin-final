package kr.co.codin.msg.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.codin.msg.service.MsgService;
import kr.co.codin.repository.domain.SearchMemberHospital;

@Controller
@RequestMapping("msg")
public class MsgController {
	
	@Autowired
	private MsgService service;
	
	@RequestMapping("main.do")
	public void main() throws Exception{
		;;
	}
	
	@RequestMapping("searchMember.do")
	@ResponseBody
	public Map<String, SearchMemberHospital> searchMember(String keyword) throws Exception{
		System.out.println("Msg Search Member: "+keyword);
		service.searchMember(keyword);
		return null;
	}
}
