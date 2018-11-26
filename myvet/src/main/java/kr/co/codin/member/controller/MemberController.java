package kr.co.codin.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.codin.member.service.MemberService;
import kr.co.codin.repository.domain.Member;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("/signup.do")
	public String signup(Member member) {
//		System.out.println("controller");
		service.signup(member);
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
		if (service.login(member) != null) {
			session.setAttribute("user", service.login(member));
			
			System.out.println(service.login(member).getMemberGrade());
			System.out.println(service.login(member).getMemberGrade().equals("U"));
			
//			if (service.login(member).getMemberGrade().equals('s')) {
//				
//			}
			
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "myPage.do";
		}
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "loginForm.do";
	}
	
	
}
