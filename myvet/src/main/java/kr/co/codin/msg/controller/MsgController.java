package kr.co.codin.msg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.codin.msg.service.MsgService;

@Controller
@RequestMapping("msg")
public class MsgController {
	
	@Autowired
	private MsgService service;
	
	@RequestMapping("main.do")
	public void main() throws Exception{
		
	}
}
