package kr.co.codin.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.codin.admin.service.NoticeService;
import kr.co.codin.repository.domain.Page;
import kr.co.codin.repository.domain.PageResult;

@Controller
@RequestMapping("notice")
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	@RequestMapping("list.do")
	public void noticeList(Model model, @RequestParam(value="pageNo", defaultValue="1") int pageNo) {
		
		Page page = new Page(pageNo);
		System.out.println(pageNo);
		System.out.println(service.noticeCount());
		
		model.addAttribute("notice", service.noticeList(page));
		model.addAttribute("pageResult", new PageResult(pageNo, service.noticeCount()));
	}
}
