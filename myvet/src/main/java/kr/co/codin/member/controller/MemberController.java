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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.codin.member.service.MemberService;
import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.VetAuth;
import kr.co.codin.repository.mapper.MemberMapper;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private ServletContext context;
	
	@Autowired
	private MemberMapper mapper;
	
	@RequestMapping("/signup.do")
	public String signup(Member member) {
//		System.out.println("controller");
		service.signup(member);
		
//		System.out.println(!(member.getMemberGrade().equals("U")));
		if (!(member.getMemberGrade().equals("U"))){
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "vetAuthForm.do";
		}
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "loginForm.do";
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
			
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "myPage.do";
		}
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "loginForm.do";
	}
	
	@RequestMapping("/vetAuth.do")
	public String vetAuth(MultipartFile fileV, VetAuth vetFile, String memberEmail) throws Exception {
		System.out.println(fileV.isEmpty());
		if (fileV.isEmpty() == true)
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "vetAuthForm.do";
		
		String vetOriName = fileV.getOriginalFilename();
		vetFile.setVetOriName(vetOriName);
		
		int vetFileSize = (int)fileV.getSize();
		vetFile.setVetFileSize(vetFileSize);
		
		vetFile.setVetFilePath(context.getRealPath("/vetAuth"));
		
		UUID uid = UUID.randomUUID();
		String vetSysName = uid.toString() + "_" + vetOriName;
		vetFile.setVetSysName(vetSysName);
		
		// selectPasswordById 메서드가 memberEmail로 member 테이블을 조회하여 Member 객체를 리턴
		int memberNo = mapper.selectPasswordById(memberEmail).getMemberNo();
		vetFile.setMemberNo(memberNo);
		
		service.uploadVetAuth(vetFile);
		
		fileV.transferTo(new File(context.getRealPath("/vetAuth"), vetSysName + ".jpg"));
				
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "loginForm.do";
	}
}
