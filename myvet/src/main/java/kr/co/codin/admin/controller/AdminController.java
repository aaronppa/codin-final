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
import kr.co.codin.repository.domain.Notice;
import kr.co.codin.repository.domain.Page;
import kr.co.codin.repository.domain.PageResult;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping("main.do")
	public void main(Model model) throws Exception{
		int pageNo = 1;
		Page page = new Page(pageNo);
		model.addAttribute("notice", service.noticeList(page));
		model.addAttribute("noticePageResult", new PageResult(1, service.noticeCount()));
	}
	
	@RequestMapping("detail")
	public String detail(String boardType, int itemno, Model model) {
		String url = null;
		switch(boardType) {
			case "notice": 
				model.addAttribute("detail", service.noticeDetail(itemno));
				url="admin/noticedetail";
		}
		
		return url;
	}
	
	@RequestMapping("writeForm.do")
	public String writePopup() {
		return "admin/writeNotice_popup";
	}
	
	@RequestMapping("write.do")
	@ResponseBody
	public void write(Notice notice) throws Exception{
		System.out.println("Write Notice: "+notice);
		service.write(notice);
	}
	
	@RequestMapping("save.do")
	@ResponseBody
	public void save(Notice notice) throws Exception{
		System.out.println("Save Notice"+notice);
		service.save(notice);     
	}
	
	@RequestMapping(value="/{boardType}/{pageNo}.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> boardPage(@PathVariable String boardType, @PathVariable int pageNo) throws Exception{
		switch(boardType) {
			case "notice": 
				System.out.println("Request 들어옴.");
				System.out.println(noticeList(pageNo));
				return noticeList(pageNo);
			default: return null;
		}
	}
	
	
	public Map<String, Object> noticeList(int pageNo) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("notice", service.noticeList(new Page(pageNo)));
		map.put("noticePageResult", new PageResult(pageNo, service.noticeCount()));
		return map;
	}
	
}
