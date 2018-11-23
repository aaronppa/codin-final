package kr.co.codin.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@RequestMapping("main.do")
	public void main() {
		
	}
	
	@RequestMapping("writenotice.do")
	public String writePopup() {
		return "admin/writeNotice_popup";
	}
}
