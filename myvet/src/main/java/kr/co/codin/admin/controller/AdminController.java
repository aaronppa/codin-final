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
import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.Notice;
import kr.co.codin.repository.domain.PageResult;
import kr.co.codin.repository.domain.Search;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	// 처음 관리자 페이지 로딩시 Share 방식으로 JSTL 처리 
	@RequestMapping("main.do")
	public void main(Model model) throws Exception{
		// Notice First Page
		Search noticeSearch = new Search(1);
		PageResult noticePageResult = new PageResult(1, service.noticeCount(noticeSearch));
		model.addAttribute("notice", service.noticeList(noticeSearch));
		model.addAttribute("noticePageResult", noticePageResult);
		
		// Vet Auth First Page
		// 첫 로딩시에는 대기("P") 아이템만 조회 
		Search vetSearch = new Search(1, "P");
		PageResult memberVetPageResult = new PageResult(1, service.memberCount(vetSearch));
		System.out.println("vetAuth Search Param: "+vetSearch);
		model.addAttribute("memberVet", service.memberList(vetSearch));
		System.out.println("Main.do memberCount: "+service.memberCount(vetSearch));
		model.addAttribute("memberVetPageResult", memberVetPageResult);
		System.out.println("vet First Page: "+model);
	}
	
	// 모든 상세조회는 하기 Method를 통해서 처리 
	@RequestMapping("detail.do")
	public String detail(String boardType, int itemno, Model model) {
		String url = null;
		switch(boardType) {
			case "notice": 
				System.out.println("Notice Detail Request 들어옴");
				model.addAttribute("detail", service.noticeDetail(itemno));
				url="admin/noticedetail";
				break;
			case "member": 
				System.out.println("Member Detail Request 들어옴");
				model.addAttribute("detail", service.memberDetail(itemno));
				url="admin/memberdetail";
				break;
			case "vetAuth":
				System.out.println("VetAuth Detail Request 들어옴");
				model.addAttribute("detail", service.vetAuthDetail(itemno));
				url="admin/vetauthdetail";
				break;
		}
		
		// 각 detai popup jsp 페이지로 이동  
		return url;
	}
	
	// 검색 및 페이징 목록 조회 
	// 검색시에는 main.do 페이지에서 최초 pageno=1을 넘겨줌
	// 검색이후 페이징에서는 각 검색 FormData와 페이지 번호의 URL 값에 따라 페이징 조건 처리 
	
	@RequestMapping(value="/{boardType}/{pageNo}.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> boardPage(@PathVariable String boardType, @PathVariable int pageNo, Search search) throws Exception{
		System.out.println("검색/페이징 목록 처리 들어옴");
		search.setPageNo(pageNo);
		System.out.println(search.toString());
		switch(boardType) {
			case "notice": 
				System.out.println("Notice List 불러오기 Request 들어옴."+search);
				System.out.println(noticeList(search));
				return noticeList(search);
			case "member":
				System.out.println("Member List 불러오기 Request 들어옴."+search);
				System.out.println(memberList(search));
				return memberList(search);
			case "vetAuth":
				System.out.println("Vet List 불러오기 Request 들어옴."+search);
				System.out.println(memberList(search));
				return memberList(search);
			default: return null;
		}
	}
	
	// 검색/페이징 목록 조회시 사용되는 공통 Method 
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
	
	// 공지사항 글쓰기 Form Page 
	@RequestMapping("writeForm.do")
	public String writePopup() {
		return "admin/writeNotice_popup";
	}
	
	// 공지사항 글쓰기 
	@RequestMapping("write.do")
	@ResponseBody
	public void write(Notice notice) throws Exception{
		System.out.println("Write Notice: "+notice);
		if(notice.getNoticeNo()==0) {
			service.writeNew(notice);
		} else {
			service.writeTemp(notice.getNoticeNo());
		}
	}
	
	// 공지사항 임시저장 
	@RequestMapping("save.do")
	@ResponseBody
	public void save(Notice notice) throws Exception{
		System.out.println("Save Notice"+notice);
		if(notice.getNoticeNo()==0) {
			service.saveNew(notice);
		} else {
			service.saveTemp(notice);
		}
	}
	
	@RequestMapping("edit.do")
	@ResponseBody
	public void openEdit(Notice notice) throws Exception{
		System.out.println("Edit Notice"+notice);
	}
	
	// 수의사 인정 처리 
	@RequestMapping(value="/process/{itemno}.do", method=RequestMethod.GET)
	@ResponseBody
	public void processApproval(@PathVariable int itemno, String approval) {
		Member vetApproval = new Member();
		vetApproval.setMemberNo(itemno);
		vetApproval.setMemberGrade(approval);
		service.updateStatus(vetApproval);
		System.out.println("수의사 인증 요청 처리 완료");
	}
}
