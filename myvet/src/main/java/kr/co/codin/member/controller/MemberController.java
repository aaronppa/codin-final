package kr.co.codin.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.codin.member.service.MemberService;
import kr.co.codin.pet.service.PetService;
import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.VetAuth;
import kr.co.codin.repository.mapper.MemberMapper;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private PetService pService;
	
	@Autowired
	private ServletContext context;
	
	@Autowired
	private MemberMapper mapper;
	
	@RequestMapping("/signup.do")
	public String signup(Member member, MultipartFile fileV, VetAuth vetFile) throws Exception {
		service.signup(member);
		int memberNo = member.getMemberNo();
		
//		System.out.println(fileV.isEmpty());
		if (fileV.isEmpty() == true)
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/";
		
		String vetOriName = fileV.getOriginalFilename();
		vetFile.setVetOriName(vetOriName);
		
		int vetFileSize = (int)fileV.getSize();
		vetFile.setVetFileSize(vetFileSize);
		
		vetFile.setVetFilePath("/vetAuth/" + memberNo);
		
		UUID uid = UUID.randomUUID();
		String vetSysName = uid.toString() + "_" + vetOriName;
		vetFile.setVetSysName(vetSysName);
		
//		System.out.println(memberNo);
		vetFile.setMemberNo(memberNo);
		
		service.uploadVetAuth(vetFile);
		
//		fileV.transferTo(new File(context.getRealPath("/upload/vetAuth"), vetSysName));
		File fileN = new File(context.getRealPath("/upload/vetAuth/" + memberNo), vetSysName);
		if (fileN.exists() == false) {
			fileN.mkdirs();
		}
		fileV.transferTo(fileN);
		
//		System.out.println(!(member.getMemberGrade().equals("U")));
//		if (!(member.getMemberGrade().equals("U"))){
//			return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "vetAuthForm.do";
//		}
		
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/";
	}
	
	@RequestMapping("/idCheck.do")
	@ResponseBody
	public Map<Object, Object> idCheck(@RequestBody String memberEmail) {
//		System.out.println(memberEmail);
		Map<Object, Object> map = new HashMap<>();
		int count = service.idCheck(memberEmail);
		map.put("count", count);
		return map;
	}
	
	@RequestMapping("/login.do")
	public String login(Member member, HttpSession session) {
		Member loginMember = service.login(member);
				
		if (loginMember != null) {
			session.setAttribute("user", loginMember);
			
//			System.out.println(service.login(member).getMemberGrade());
//			System.out.println(service.login(member).getMemberGrade().equals("U"));
			
//			if (service.login(member).getMemberGrade().equals('s')) {
//				
//			}
			
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/";
		}
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "loginForm.do";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/";
	}
	
	@RequestMapping("/findEmail.do")
	public void findEmail(Member member, Model model) {
		model.addAttribute("member", service.findEmail(member));
	}
	
	@RequestMapping("/myPage.do")
	public void myPage(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("user");
		int memberNo = member.getMemberNo();
		model.addAttribute("member", service.myPage(memberNo));
//		System.out.println(pService.myPet(memberNo));
		model.addAttribute("pet", pService.myPet(memberNo));
	}
	
//	@RequestMapping("/nickChange.do")
//	@ResponseBody
//	public void nickChange(@RequestBody int myNo) {
//		Member member = mapper.selectMemberByNo(myNo);
//		service.nickChange(member);
//	}
}
