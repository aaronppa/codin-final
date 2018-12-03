package kr.co.codin.hos.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.codin.hos.service.HosService;
import kr.co.codin.hos.service.HosServiceImpl;
import kr.co.codin.repository.domain.FileInfo;
import kr.co.codin.repository.domain.HosFacility;
import kr.co.codin.repository.domain.HosHours;
import kr.co.codin.repository.domain.HosPage;
import kr.co.codin.repository.domain.Hospital;
import kr.co.codin.repository.domain.PageResult;

@Controller
@RequestMapping("hos")
public class HosController {

	@Autowired
	HosService service = new HosServiceImpl();
	
	@Autowired 
	private ServletContext servletContext;
	
	@RequestMapping("hospital.do")
	public void hospital(Model model, int hosCode) {
		model.addAttribute("hos", service.selectHospitalByNo(hosCode));
	}
	
	@RequestMapping("bookingBlock.do")
	public void bookingBlock(Model model) {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		
		model.addAttribute("monday", cal);
		
	}
	
	@RequestMapping("reception.do")
	public void reception(String petCode) {
		if (petCode == null) return;
	}

	@RequestMapping("chartHos.do")
	public void chartHos() {
		
	}
	
	@RequestMapping("search.do")
	public void search() {
		
	}

	@RequestMapping("searchReg.do")
	@ResponseBody
	public Map<String, Object> regSearch(
				String keyWord, 
				@RequestParam(value="pageNo", defaultValue="1")int pageNo, 
				@RequestParam(value="searchType", defaultValue="1")int searchType
			) {
		
		Map<String, Object> map = new HashMap<String, Object>();

		HosPage page = new HosPage(pageNo, 5);
		page.setKeyWord(keyWord);
		page.setSearchType(searchType);
		
		map.put("list", service.searchReg(page));
		map.put("listCount", service.regCount(page));
		
		return map;
	}
	
	@RequestMapping("searchNor.do")
	@ResponseBody
	public Map<String, Object> norSearch(
				String keyWord, 
				@RequestParam(value="pageNo", defaultValue="1")int pageNo, 
				@RequestParam(value="searchType", defaultValue="1")int searchType
			) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		HosPage page = new HosPage(pageNo, 4);
		page.setKeyWord(keyWord);
		page.setSearchType(searchType);
		
		map.put("list", service.searchNor(page));
		map.put("listCount", service.norCount(page));
		
		return map;
	}
	
	@RequestMapping("register.do")
	public void registerForm(Model model) {
		model.addAttribute("facilityList", service.selectFacility());
	}
	
	@RequestMapping("registerHos.do")
	@ResponseBody
	public void registerHos(
					int hosCode, 
					int[] hosFacility, 
					int[] dayoff,
					String hosHomePage,
					String hosComment,
					List<MultipartFile> hosImg,
					HttpServletRequest request
					) throws IllegalStateException, IOException {
		
		
		if (hosFacility != null) {
			for (int i = 0; i < hosFacility.length; i++) {
				HosFacility facility = new HosFacility();
				facility.setHosCode(hosCode);
				facility.setFacilityCode(hosFacility[i]);
				service.insertFacility(facility);
			}
		}
		
		if (dayoff != null) {
			for (int i = 0; i < dayoff.length; i++) {
				HosHours hours = new HosHours();
				hours.setHosCode(hosCode);
				hours.setOpenDay(dayoff[i]);
				service.insertDayoff(hours);
			}
		}
		
		Hospital hospital = new Hospital();
		hospital.setHosCode(hosCode);
		hospital.setHosComment(hosComment);
		service.registerUpdate(hospital);
		
		if (hosImg.isEmpty()) return;
		
		for (MultipartFile img : hosImg) {
			
			if(img.isEmpty()) continue;
			
			boolean run = true;
			int no = 0;
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String filePath = servletContext.getRealPath("/")+"/upload/hospital/" + sdf.format(date);
			String sysName = img.getOriginalFilename();
			
			File file = new File(filePath, sysName);
			
			while(run) {
				if (!file.exists()) break;
				sysName = sysName + no++;
				file = new File(filePath, sysName);
				continue;
			}
			file.mkdirs();
			img.transferTo(file);
			
			FileInfo fileInfo = new FileInfo();
			fileInfo.setBoardNo(hosCode);
			fileInfo.setFilePath("/hospital/"+ sdf.format(date));
			fileInfo.setOriName(img.getOriginalFilename());
			fileInfo.setSysName(sysName);
			fileInfo.setFileSize(img.getSize());
			
			service.insertFileInfo(fileInfo);
		}
		
	}
	
	@RequestMapping("hosList.do")
	public void hosList() {}
		
	
	@RequestMapping("petSearch.do")
	@ResponseBody
	public Map<String, Object> petSearch(String keyWord, int pageNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		HosPage page = new HosPage(pageNo, 5);
		page.setKeyWord(keyWord);
		
		map.put("list", service.searchPet(page));
		map.put("listCount", service.petCount(keyWord));
		
		return map;
	}
	
	@RequestMapping("hosSearch.do")
	@ResponseBody
	public Map<String, Object> hosSearch(String keyWord, int pageNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();

		HosPage page = new HosPage(pageNo, 5);
		page.setKeyWord(keyWord);
		
		map.put("list", service.searchHos(page));
		map.put("listCount", service.hosCount(keyWord));
		
		return map;
	}
	
	@RequestMapping("hosListPage.do")
	public void hosListPage(Model model, @RequestParam(value="pageNo", defaultValue="1") int pageNo, int ListCount) {
		model.addAttribute("pageResult", new PageResult(pageNo, ListCount, 5, 5));
	}
	
	@RequestMapping("regHosPage.do")
	public void registHosPage(Model model, @RequestParam(value="pageNo", defaultValue="1") int pageNo, int ListCount) {
		model.addAttribute("pageResult", new PageResult(pageNo, ListCount, 5, 5));
	}
	
	@RequestMapping("norHosPage.do")
	public void normalHosPage(Model model, @RequestParam(value="pageNo", defaultValue="1") int pageNo, int ListCount) {
		model.addAttribute("pageResult", new PageResult(pageNo, ListCount, 4, 5));
	}

}