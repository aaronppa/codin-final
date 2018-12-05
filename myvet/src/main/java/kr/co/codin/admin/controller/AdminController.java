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
import kr.co.codin.repository.domain.PageResult;
import kr.co.codin.repository.domain.Search;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping("main.do")
	public void main(Model model) throws Exception{
		// Notice First Page
		Search noticeSearch = new Search(1);
		PageResult noticePageResult = new PageResult(1, service.noticeCount(noticeSearch));
		model.addAttribute("notice", service.noticeList(noticeSearch));
		model.addAttribute("noticePageResult", noticePageResult);
		
		// Vet Auth First Page
		Search vetSearch = new Search(1, "P");
		PageResult memberVetPageResult = new PageResult(1, service.memberCount(vetSearch));
		System.out.println("vetAuth Search Param: "+vetSearch);
		model.addAttribute("memberVet", service.memberList(vetSearch));
		System.out.println("Main.do memberCount: "+service.memberCount(vetSearch));
		model.addAttribute("memberVetPageResult", memberVetPageResult);
		System.out.println("vet First Page: "+model);
	}
	
	@RequestMapping("detail.do")
	public String detail(String boardType, int itemno, Model model) {
		String url = null;
		switch(boardType) {
			case "notice": 
				System.out.println("Detail Request 들어옴");
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
	
	// 목록 조회 
	@RequestMapping(value="/{boardType}/{pageNo}.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> boardPage(@PathVariable String boardType, @PathVariable int pageNo, Search search) throws Exception{
		System.out.println("목록 조회 들어옴");
		search.setPageNo(pageNo);
		System.out.println(search.toString());
		switch(boardType) {
			case "notice": 
				System.out.println("Notice List 불러오기 Request 들어옴.");
				System.out.println(noticeList(search));
				return noticeList(search);
			case "member":
				System.out.println("Member List 불러오기 Request 들어옴.");
				System.out.println(memberList(search));
				return memberList(search);
			case "vetAuth":
				System.out.println("MemberVet List 불러오기 Request 들어옴."+search);
				System.out.println(memberList(search));
				return memberList(search);
			default: return null;
		}
	}
	
	
	public Map<String, Object> noticeList(Search search) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("notice", service.noticeList(search));
		map.put("noticePageResult", new PageResult(search.getPageNo(), service.noticeCount(search)));
		return map;
	}
	
	public Map<String, Object> memberList(Search search) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("member", service.memberList(search));
		map.put("memberPageResult", new PageResult(search.getPageNo(), service.memberCount(search)));
		return map;
	}
	
}
