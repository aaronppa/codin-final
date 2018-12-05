package kr.co.codin.pet.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	@RequestMapping("/petAdd.do")
	public String addPet(Pet pet, MultipartFile fileP) throws Exception {
		if (fileP.isEmpty() == true)
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "petAdd.do";
		
		String petOriName = fileP.getOriginalFilename();
		pet.setPetOriName(petOriName);
		
		int petFileSize = (int) fileP.getSize();
		pet.setPetFileSize(petFileSize);
		
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyyMMdd");
		String datePath = sdf.format(new Date());
		
		pet.setPetFilePath("/petFile" + datePath);
		
		UUID uid = UUID.randomUUID();
		String petSysName = uid.toString() + "_" + petOriName;
		pet.setPetSysName(petSysName);
		
		service.addPet(pet);
		
		File fileN = new File(context.getRealPath("/upload/vetAuth/" + datePath), petSysName);
		if (fileN.exists() == false) {
			fileN.mkdirs();
		}
		fileP.transferTo(fileN);
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/member/myPage.do";
	}
}
