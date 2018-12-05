package kr.co.codin.pet.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.codin.member.service.MemberService;
import kr.co.codin.pet.service.PetService;
import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.Pet;
import kr.co.codin.repository.mapper.PetMapper;

@Controller
@RequestMapping("/pet")
public class PetController {
	
	@Autowired
	private PetService service;
	
	@RequestMapping("/petAdd.do")
	public String addPet(Pet pet) {
//		System.out.println(petName);
//		System.out.println(memberNo);
//		System.out.println(pet.toString());
		service.addPet(pet);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/member/myPage.do";
	}
}
