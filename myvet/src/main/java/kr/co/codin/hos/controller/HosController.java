package kr.co.codin.hos.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.binding.BindingException;
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
import kr.co.codin.repository.domain.HosBlock;
import kr.co.codin.repository.domain.HosBooking;
import kr.co.codin.repository.domain.HosFacility;
import kr.co.codin.repository.domain.HosHours;
import kr.co.codin.repository.domain.HosPage;
import kr.co.codin.repository.domain.Hospital;
import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.PageResult;
import kr.co.codin.repository.domain.TempBooking;

@Controller
@RequestMapping("hos")
public class HosController {

	@Autowired
	HosService service = new HosServiceImpl();
	
	@Autowired 
	private ServletContext servletContext;
	
	@RequestMapping("booking.do")
	public void booking(
				Model model, 
				HttpSession session, 
				int hosCode, 
				@RequestParam(value="date", defaultValue="null") String date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		HosBlock block = new HosBlock();
		Member member = (Member) session.getAttribute("user");
		
		if (date.equals("null")) {
			date = sdf.format(new Date());
		}
		
		block.setBlockDay(date);
		block.setHosCode(hosCode);
		block.setFacilityNo(1);
		
		System.out.println(block);
		System.out.println(service.selectBlockList(block));
		
		model.addAttribute("petList", service.selectPetList(member.getMemberNo()));
		model.addAttribute("hospital", service.selectHospitalByNo(hosCode));
		model.addAttribute("blockList", service.selectBlockList(block));
	}
	
	@RequestMapping("bookingList.do")
	@ResponseBody
	public List<HosBooking> bookingList(Model model, int hosCode) {
		System.out.println(service.selectBooking(hosCode));
	
		return service.selectBooking(hosCode);
	}
	
	@RequestMapping("bookingSubmit.do")
	@ResponseBody
	public void bookingSubmit(HosBooking booking) {
		System.out.println(booking.toString());
		
		service.insertBooking(booking);
	}
	
	@RequestMapping("selectBlock.do")
	@ResponseBody
	public List<HosBlock> selectBlock(HosBlock block) {
		
		System.out.println(block);
		System.out.println(service.selectBlockList(block));
		
		return service.selectBlockList(block);
	}
	
	@RequestMapping("hospital.do")
	public void hospital(Model model, int hosCode) {
		model.addAttribute("hospital", service.selectHospitalByNo(hosCode));
	}
	
	@RequestMapping("bookingManager.do")
	public void bookingManager(Model model, int hosCode) {
		model.addAttribute("hospital", service.selectHospitalByNo(hosCode));
	}
	
	@RequestMapping("confirmBooking.do")
	public void confirmBooking(int bookingNo) {
		System.out.println(bookingNo);
		service.confirmBooking(bookingNo);
	}
	
	@RequestMapping("banBooking.do")
	public void banBooking(int bookingNo) {
		service.banBooking(bookingNo);
	}

	
	@RequestMapping("blockEdit.do")
	public void blockEdit(Model model,
						   int hosCode,
						   @RequestParam(value="date", defaultValue="null") 
						   String date
						   ) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		HosBlock block = new HosBlock();
		
		if (date.equals("null")) {
			date = sdf.format(new Date());
		}
		
		block.setBlockDay(date);
		
		model.addAttribute("hospital", service.selectHospitalByNo(hosCode));
		model.addAttribute("blockList", service.selectBlockList(block));
	}
	
	@RequestMapping("blockEditForm.do")
	public void blockEditForm (Model model, int blockCode) {
		model.addAttribute("block", service.selectBlock(blockCode));
	}
		
	@RequestMapping("blockEditing.do")
	@ResponseBody
	public void blockEditing (HosBlock block) {
		service.updateBlock(block);
	}
	
	@RequestMapping("blockDelete.do")
	@ResponseBody
	public void blockDelete (Model model, int blockCode) {
		service.deleteBlock(blockCode);
	}
	
	@RequestMapping("blockMaking.do")
	public void bookingBlock(
					HttpServletRequest request, 
					@RequestParam(value="date", defaultValue="null") 
					String date,
					@RequestParam(value="hosCode", defaultValue="519")
					int hosCode
					) {
		Calendar cal = Calendar.getInstance();
		
		if(date != "null") {
			try {
				cal.setTime(new SimpleDateFormat("yyyy/MM/dd").parse(date));
			} catch (ParseException e) {
				;;
			}
		}
		
		request.setAttribute("cal", cal);
		request.setAttribute("hospital", service.selectHospitalByNo(hosCode));
	}
	
	@RequestMapping("createBlock.do")
	@ResponseBody
	public void createBlock(TempBooking booking) throws Exception {
		System.out.println(booking.toString());
		
		HosBlock block = new HosBlock();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		Calendar cal = Calendar.getInstance();
		Date date = null;
		block.setHosCode(booking.getHosCode());
		block.setBlockNo(0);
		block.setMaxBooking(booking.getMaxBook());
		try {
			date = sdf.parse(booking.getDate());
		} catch (ParseException e) {
			;;
		}
		cal.setTime(date);
		
		System.out.println(cal.getTime());
		
		block.setBlockDay(sdf.format(date));
		
		Date breakStart = setTimeToCal(cal, new StringTokenizer(booking.getBreakStart(), ":"));
		Date breakEnd = setTimeToCal(cal, new StringTokenizer(booking.getBreakEnd(), ":"));
		Date closeTime = setTimeToCal(cal, new StringTokenizer(booking.getCloseTime(), ":"));
		Date openTime = setTimeToCal(cal, new StringTokenizer(booking.getOpenTime(), ":"));

		int blockNo = 0;
		try {
			blockNo = service.nextBlockNo(booking.getHosCode());
		} catch (BindingException e) {
			;;
		}
		System.out.println("blockNo : " + blockNo);

		if (booking.getMedical()!=null) {
			block.setFacilityNo(1);

			if (service.isCreateBlock(block) > 0) {
				throw new Exception("이미 등록된 날짜입니다." + sdf.format(date));
			}


		}
		
		while (true) {
			if ((cal.getTime().after(breakStart) || (cal.getTime().equals(breakStart))) && 
				(cal.getTime().before(breakEnd))
				){
				cal.add(Calendar.MINUTE, booking.getBookInterval());
				continue;
			}
			
			if (cal.getTime().equals(closeTime)) break;
			if (block.getFacilityNo() != 1) break;
			
			block.setBlockStart(calToTime(cal));
			cal.add(Calendar.MINUTE, booking.getBookInterval());
			block.setBlockEnd(calToTime(cal));
			
			block.setBlockNo(++blockNo);
			System.out.println(block);
			service.createBlock(block);
		}
		
		setTimeToCal(cal, new StringTokenizer(booking.getOpenTime(), ":"));

		if (booking.getBeauty()!=null) {
			block.setFacilityNo(2);
			if (service.isCreateBlock(block) > 0) {
				throw new Exception("이미 등록된 날짜입니다." + sdf.format(date));
			}

		} else {
			return;
		}
		
		while (true) {
			if ((cal.getTime().after(breakStart) || (cal.getTime().equals(breakStart))) && 
				(cal.getTime().before(breakEnd))
				){
				cal.add(Calendar.MINUTE, booking.getBookInterval());
				continue;
			}
			
			if (cal.getTime().equals(closeTime)) break;
			
			block.setBlockStart(calToTime(cal));
			cal.add(Calendar.MINUTE, booking.getBookInterval());
			block.setBlockEnd(calToTime(cal));
			
			block.setBlockNo(++blockNo);
			System.out.println(block);
			service.createBlock(block);
		}
		
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
	
	public Date setTimeToCal(Calendar cal, StringTokenizer st) {
		cal.set(Calendar.HOUR_OF_DAY, Integer.parseInt(st.nextToken()));
		cal.set(Calendar.MINUTE, Integer.parseInt(st.nextToken()));

		return cal.getTime();
	}

	public Time calToTime(Calendar cal) {
		return new Time(cal.getTime().getTime());
	}
}