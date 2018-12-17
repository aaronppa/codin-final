package kr.co.codin.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.codin.admin.service.NoticeService;
import kr.co.codin.repository.domain.Notice;
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
		
		model.addAttribute("notice", service.noticeList(page));
		model.addAttribute("pageResult", new PageResult(pageNo, service.noticeCount()));
	}
	
	@RequestMapping("indexNotice.do")
	@ResponseBody
	public List<Notice> indexNotice() {
		
		Page page = new Page(1, 5);
		
		return service.noticeList(page);
	}
	
	@RequestMapping("detail.do")
	public void noticeDetail (Model model, int noticeNo) {
		service.incrementViewCnt(noticeNo);
		model.addAttribute("notice", service.noticeDetail(noticeNo));
	}
}
