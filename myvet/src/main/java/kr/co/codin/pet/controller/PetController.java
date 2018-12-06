package kr.co.codin.pet.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.codin.pet.service.PetService;
import kr.co.codin.repository.domain.Pet;

@Controller
@RequestMapping("/pet")
public class PetController {
	
	@Autowired
	private PetService service;
	
	@Autowired
	private ServletContext context;
	
	@RequestMapping("/petDetail.do")
	public void detailPet(int petNo, Model model) throws Exception {
		model.addAttribute("result", service.detailPet(petNo));
	}
	
	@RequestMapping("/petadd.do")
	public String addPet(Pet pet, MultipartFile attach) throws Exception {
		if (attach.isEmpty() == true)
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "petAdd.do";
		
		String petOriName = attach.getOriginalFilename();
		pet.setPetOriName(petOriName);
		
		int petFileSize = (int) attach.getSize();
		pet.setPetFileSize(petFileSize);
		
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyyMMdd");
		String datePath = sdf.format(new Date());
		
		pet.setPetFilePath("/upload/pet" + datePath);
		
		UUID uid = UUID.randomUUID();
		String petSysName = uid.toString() + "_" + petOriName;
		pet.setPetSysName(petSysName);
		
		service.addPet(pet);
		
		File fileN = new File(context.getRealPath("/upload/pet/" + datePath), petSysName);
		if (fileN.exists() == false) {
			fileN.mkdirs();
		}
		attach.transferTo(fileN);
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/member/myPage.do";
	}
}
