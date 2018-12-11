package kr.co.codin.member.controller;

import java.io.File;
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
	
	/**
	 * 회원가입
	 * @param member
	 * @param fileV
	 * @param vetFile
	 * @return redirect
	 * @throws Exception
	 */
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
	
	/**
	 * 이메일 중복 확인
	 * @param memberEmail
	 * @return map 데이터베이스의 이메일 갯수
	 */
	@RequestMapping("/idCheck.do")
	@ResponseBody
	public Map<Object, Object> idCheck(@RequestBody String memberEmail) {
//		System.out.println(memberEmail);
		Map<Object, Object> map = new HashMap<>();
		int count = service.idCheck(memberEmail);
		map.put("count", count);
		return map;
	}
	
	/**
	 * 로그인
	 * @param member
	 * @param session
	 * @return redirect 메인페이지
	 */
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
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/";
	}

	@RequestMapping("/loginAjax.do")
	@ResponseBody
	public String loginAjax(Member member, HttpSession session) {
		System.out.println(11111);
		Member loginMember = service.login(member);
		if (loginMember != null) {
			session.setAttribute("user", loginMember);
		}
		return loginMember == null ? "fail" : "success";
	}
	
	/**
	 * 로그아웃
	 * @param session
	 * @return redirect 메인페이지
	 */
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/";
	}
	
	/**
	 * 이메일 찾기
	 * @param member
	 * @param model
	 */
	@RequestMapping("/findEmail.do")
	public void findEmail(Member member, Model model) {
		model.addAttribute("member", service.findEmail(member));
	}
	
	/**
	 * 본인 페이지 확인
	 * @param session
	 * @param model
	 */
	@RequestMapping("/myPage.do")
	public void myPage(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("user");
		int memberNo = member.getMemberNo();
		model.addAttribute("member", service.myPage(memberNo));
//		System.out.println(pService.myPet(memberNo));
		model.addAttribute("pet", pService.myPet(memberNo));
	}
	
	/**
	 * 회원 정보 수정
	 * @param session
	 * @param model
	 */
	@RequestMapping("/updatemember.do")
	@ResponseBody
	public Member updateMemberInfo(Member member, MultipartFile file, HttpSession session) throws Exception {
		
		Member loginMember = (Member)session.getAttribute("user");  
		int memberNo = loginMember.getMemberNo();
		member.setMemberNo(memberNo);
		
		File uploadFile = new File(context.getRealPath("/upload/profile"));
		if (uploadFile.exists() == false) uploadFile.mkdirs();
		
		// 파일 정보 설정 및 서버 저장	
		if (file.isEmpty() == false) {
			String oriName = file.getOriginalFilename();
			member.setMemberOriName(file.getOriginalFilename());
			member.setMemberFileSize((int)file.getSize());
			member.setMemberFilePath("/profile");
			
			String memberSysName = UUID.randomUUID().toString() + "_" + oriName;
			member.setMemberSysName(memberSysName);
			
			file.transferTo(new File(uploadFile, memberSysName));
		}
		
		return service.updateMemberInfo(member);
	}
	
	@RequestMapping("/updatepassword.do")
	@ResponseBody
	public int updatePassword(Member member, HttpSession session) throws Exception {
		System.out.println(member);
		Member loginMember = (Member)session.getAttribute("user");  
		int memberNo = loginMember.getMemberNo();
		member.setMemberNo(memberNo);
		
		return service.updatePassword(member);
	}
}






