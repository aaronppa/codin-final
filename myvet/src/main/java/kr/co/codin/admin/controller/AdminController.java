package kr.co.codin.admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.codin.admin.service.AdminService;
import kr.co.codin.admin.service.NoticeService;
import kr.co.codin.repository.domain.Notice;
import kr.co.codin.repository.domain.Page;
import kr.co.codin.repository.domain.PageResult;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;

	@Autowired
	private NoticeService noticeService;
	
	
	@RequestMapping("main.do")
	public void main(Model model) throws Exception{
		int pageNo = 1;
		Page page = new Page(pageNo);
		model.addAttribute("notice", noticeService.noticeList(page));
		model.addAttribute("noticePageResult", new PageResult(1, noticeService.noticeCount()));
		
	}
	
	@RequestMapping("writeForm.do")
	public String writePopup() {
		return "admin/writeNotice_popup";
	}
	
	@RequestMapping("write.do")
	@ResponseBody
	public void write(Notice notice) throws Exception{
		System.out.println("Write Notice: "+notice);
		adminService.write(notice);
	}
	
	@RequestMapping("save.do")
	@ResponseBody
	public void save(Notice notice) throws Exception{
		System.out.println("Save Notice"+notice);
		adminService.save(notice);     
	}
	
	@RequestMapping(value="/{boardType}/{pageNo}.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> boardPage(@PathVariable String boardType, @PathVariable int pageNo) throws Exception{
		switch(boardType) {
		case "notice": 
			System.out.println("Request 들어옴.");
			return noticeList(pageNo);
		default: return null;
		}
	}
	
	
	public Map<String, Object> noticeList(int pageNo) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("notice", noticeService.noticeList(new Page(pageNo)));
		map.put("noticePageResult", new PageResult(pageNo, noticeService.noticeCount()));
		return map;
	}
	
}
