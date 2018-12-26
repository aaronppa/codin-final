package kr.co.codin.hos.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.codin.hos.service.HosService;
import kr.co.codin.hos.service.HosServiceImpl;
import kr.co.codin.msg.service.MsgService;
import kr.co.codin.repository.domain.FavHos;
import kr.co.codin.repository.domain.FileInfo;
import kr.co.codin.repository.domain.HosBlock;
import kr.co.codin.repository.domain.HosBoard;
import kr.co.codin.repository.domain.HosBooking;
import kr.co.codin.repository.domain.HosChart;
import kr.co.codin.repository.domain.HosFacility;
import kr.co.codin.repository.domain.HosHours;
import kr.co.codin.repository.domain.HosPage;
import kr.co.codin.repository.domain.HosStaff;
import kr.co.codin.repository.domain.Hospital;
import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.Message;
import kr.co.codin.repository.domain.PageResult;
import kr.co.codin.repository.domain.Pet;
import kr.co.codin.repository.domain.RecipientGroup;
import kr.co.codin.repository.domain.TempBooking;
import kr.co.codin.repository.domain.Tip;

@Controller
@RequestMapping("hos")
public class HosController {

	@Autowired
	private HosService service;
	
	@Autowired
	private MsgService mService;
	
	@Autowired 
	private ServletContext servletContext;
	
	@RequestMapping("hospital.do")
	public void hospital(Model model, HttpSession session, int hosCode) {
		
		System.out.println(servletContext.getRealPath("/"));
		
		HosPage page = new HosPage(1, 5);
		FavHos favHos = new FavHos();
		Member member = (Member) session.getAttribute("user");
		page.setHosCode(hosCode);
		
		System.out.println(service.selectHospitalByNo(hosCode));
		
		model.addAttribute("hospital", service.selectHospitalByNo(hosCode));
		model.addAttribute("boardList", service.selectHosBoard(page));
		
		favHos.setMemberNo(member.getMemberNo());
		favHos.setHosCode(hosCode);
		
		try {
			model.addAttribute("followCnt", service.followCnt(hosCode));
		}catch(BindingException e) {
			model.addAttribute("followCnt", 0);
		}
		
		try {
			model.addAttribute("favHos", service.selectFavHosbyMember(favHos));
		} catch(BindingException e) {
			model.addAttribute("favHos", 0);
		}
		
		try {
			model.addAttribute("facilityList", service.selectFacilitybyHosCode(hosCode));
		} catch(BindingException e) {
			model.addAttribute("facilityList", new ArrayList<HosFacility>());
		}
		
		try {
			model.addAttribute("staffs", service.selectStaffConfirm(hosCode));
		} catch(BindingException e) {
			model.addAttribute("staffs", new ArrayList<HosStaff>());
		}
	}
	
	@RequestMapping("edit.do")
	public void edit(Model model, int hosCode) {
		System.out.println(service.selectHosImg(hosCode));
		
		model.addAttribute("hospital", service.selectHospitalByNo(hosCode));
		model.addAttribute("facilityList", service.selectFacility());
		model.addAttribute("hosFacilityList", service.selectFacilitybyHosCode(hosCode));
		model.addAttribute("hosImgList", service.selectHosImg(hosCode));
	}
	
	@RequestMapping("booking.do")
	public void booking(
				Model model, 
				HttpSession session, 
				int hosCode, 
				@RequestParam(value="date", defaultValue="null") String date,
				@RequestParam(value="facilityNo", defaultValue="1") int facilityNo) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		HosBlock block = new HosBlock();
		Member member = (Member) session.getAttribute("user");
		
		if (date.equals("null")) {
			date = sdf.format(new Date());
		}
		
		block.setBlockDay(date);
		block.setHosCode(hosCode);
		block.setFacilityNo(facilityNo);
		
		System.out.println(block);
		System.out.println(service.selectBlockList(block));
		
		model.addAttribute("petList", service.selectPetList(member.getMemberNo()));
		model.addAttribute("hospital", service.selectHospitalByNo(hosCode));
		model.addAttribute("blockList", service.selectBlockList(block));
		model.addAttribute("date", date);
		model.addAttribute("facilityNo", facilityNo);
	}
	
	@RequestMapping("bookingList.do")
	@ResponseBody
	public List<HosBooking> bookingList(Model model, int hosCode) {
	
		return service.selectBookingByHosCode(hosCode);
	}
	
	@RequestMapping("bookingListByDay.do")
	@ResponseBody
	public List<HosBooking> bookingList(Model model, 
										int hosCode, 
										@RequestParam(value="date", defaultValue="null")String date) {
		
		if (date.equals("null")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			date = sdf.format(new Date());
		}
		
		HosBooking booking = new HosBooking();
		HosBlock block = new HosBlock();
		
		block.setBlockDay(date);
		booking.setHosCode(hosCode);
		booking.setHosBlock(block);
		
		return service.selectBookingByDate(booking);
	}
	
	@RequestMapping("receptionListByDay.do")
	@ResponseBody
	public List<HosBooking> receptionList(Model model, 
			int hosCode, 
			@RequestParam(value="date", defaultValue="null")String date) {
		
		if (date.equals("null")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			date = sdf.format(new Date());
		}
		
		HosBooking booking = new HosBooking();
		HosBlock block = new HosBlock();
		
		block.setBlockDay(date);
		booking.setHosCode(hosCode);
		booking.setHosBlock(block);
		
		return service.selectReceptionByDate(booking);
	}
	
	@RequestMapping("bookingSubmit.do")
	@ResponseBody
	public int bookingSubmit(HosBooking booking) {
		System.out.println(booking.toString());
		
		if (service.overlapBooking(booking) > 0) {
			return 1;
		}
		
		service.insertBooking(booking);
		return 0;
	}
	
	@RequestMapping("selectBlock.do")
	@ResponseBody
	public List<HosBlock> selectBlock(HosBlock block) {
		
		System.out.println(block);
		System.out.println(service.selectBlockList(block));
		
		return service.selectBlockList(block);
	}
	
	@RequestMapping("bookingManager.do")
	public void bookingManager(Model model, int hosCode) {
		model.addAttribute("hospital", service.selectHospitalByNo(hosCode));
	}
	
	@RequestMapping("confirmBooking.do")
	@ResponseBody
	public void confirmBooking(int bookingNo) {
		service.confirmBooking(bookingNo);
		HosBooking booking = service.selectBooking(bookingNo);

		sendBookingResult(booking, 3, booking.getMember());
	}
	
	@RequestMapping("banBooking.do")
	@ResponseBody
	public void banBooking(int bookingNo) {
		service.banBooking(bookingNo);
		HosBooking booking = service.selectBooking(bookingNo);
		
		sendBookingResult(booking, 4, booking.getMember());
	}

	
	@RequestMapping("blockEdit.do")
	public void blockEdit(Model model,
						   int hosCode,
						   @RequestParam(value="date", defaultValue="null") 
						   String date
						   ) {
		System.out.println(hosCode);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		HosBlock block = new HosBlock();
		
		if (date.equals("null")) {
			date = sdf.format(new Date());
		}
		
		block.setHosCode(hosCode);
		block.setBlockDay(date);
		
		System.out.println(block);
		System.out.println(service.selectAllBlockList(block));
		
		model.addAttribute("date", date);
		model.addAttribute("hospital", service.selectHospitalByNo(hosCode));
		model.addAttribute("blockList", service.selectAllBlockList(block));
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

		if (booking.getMaxBook() == 0) {
			return;
		}
		
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
	
	@RequestMapping("checkBooking.do")
	@ResponseBody
	public Map<String, Object> checkBooking(HosBlock block) {
		Map<String, Object> result = new HashMap<>();
		
		System.out.println(block);
		int medicalMax = 0;
		List<Integer> medicalCodeList = null;
		
		try {
			medicalMax = service.maxBookingAtMedical(block);
			medicalCodeList = service.blockCodeAtMedical(block);
		} catch(BindingException e) {
			;;
		}
		
		int medicalSum = 0;
		try {
			for (int medicalCode : medicalCodeList) {
				medicalSum = service.bookingCount(medicalCode) + medicalSum;
			}
		} catch(NullPointerException e) {
			;;
		}
		
		String medical = "휴무";
		try {
			double medicalNow = medicalSum / medicalMax;
			medical = "혼잡";
			
			if (medicalNow > 0.95) {
				medical = "꽉참";
			}
			
			if (medicalNow < 0.8) {
				medical = "보통";
			}
			
			if (medicalNow < 0.5) {
				medical = "여유";
			}

		} catch(Exception e) {
			;;
		}
		
		result.put("medical", medical);
		
		int beautyMax = 0;
		List<Integer> beautyCodeList = null;
		
		try {
			beautyMax = service.maxBookingAtBeauty(block);
			beautyCodeList = service.blockCodeAtBeauty(block);
		} catch(BindingException e) {
			;;
		}
		
		int beautySum = 0;
		try {
			for (int beautyCode : beautyCodeList) {
				beautySum = service.bookingCount(beautyCode) + beautySum;
			}
		} catch(NullPointerException e) {
			;;
		}
		
		String beauty = "휴무";
		try {
			double beautyNow = beautySum / beautyMax;
			beauty = "혼잡";
			
			if (beautyNow > 0.95) {
				beauty = "꽉참";
			}
			
			if (beautyNow < 0.8) {
				beauty = "보통";
			}
			
			if (beautyNow < 0.5) {
				beauty = "여유";
			}

		} catch(Exception e) {
			;;
		}
		
		result.put("beauty", beauty);

		return result;
	}
	
	@RequestMapping("reception.do")
	public void reception(Model model, int hosCode) {
		model.addAttribute("hosCode", hosCode);
	}
	
	@RequestMapping("receptionPet.do")
	@ResponseBody
	public void receptionPet(HosBooking booking) {
		booking.setConfirm('R');
		service.insertReception(booking);
	}
	

	@RequestMapping("chartHos.do")
	public void chartHos(Model model, int hosCode, @RequestParam(value="date", defaultValue="null")String date) {
		if(date.equals("null")) {
			date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		}
		
		model.addAttribute("date", date);
		model.addAttribute("hospital", service.selectHospitalByNo(hosCode));
	}
	
	@RequestMapping("writeChart.do")
	public void writeChart(Model model, int bookingNo) {
	 	model.addAttribute("booking", service.selectBooking(bookingNo));
	}
	
	@RequestMapping("insertChart.do")
	public void insertChart(HosChart chart, List<MultipartFile> chartImg) throws IllegalStateException, IOException {
		
		System.out.println("chart : " + chart);
		
		service.insertChart(chart);

		if (chartImg.isEmpty()) return;
		
		for (MultipartFile img : chartImg) {
			
			if(img.isEmpty()) continue;
			
			boolean run = true;
			int no = 0;
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String filePath = servletContext.getRealPath("/")+"/upload/hospital/chart/" + sdf.format(date);
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
			fileInfo.setBoardNo(chart.getChartNo());
			fileInfo.setFilePath("/hospital/chart/"+ sdf.format(date));
			fileInfo.setOriName(img.getOriginalFilename());
			fileInfo.setSysName(sysName);
			fileInfo.setFileSize(img.getSize());
			
			service.insertFileInfoAtChart(fileInfo);
		}
		
		service.finishBooking(chart.getBookingNo());
		
	}
	
	@RequestMapping("chartListByPetNo")
	@ResponseBody
	public List<HosChart> chartListByPetNo (int bookingNo) {
		return service.chartListByPetNo(service.selectBooking(bookingNo).getBookingPet());
	}
	
	@RequestMapping("chartImg.do")
	public void chartImg(Model model, int chartNo) {
		model.addAttribute("chartImgs", service.selectChartImgs(chartNo));
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
		
		System.out.println("keyWord = " + keyWord + "pageNo = " + pageNo + ", searchType = " + searchType);
		
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
					HttpSession session
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

		
		if (hosImg.isEmpty()) return;
		
		int count = 0;
		
		for (MultipartFile img : hosImg) {
			
			if(img.isEmpty()) continue;
			
			boolean run = true;
			int no = 0;
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String filePath = servletContext.getRealPath("/")+"/upload/hospital/basic/" + sdf.format(date);
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
			fileInfo.setFilePath("/hospital/basic/"+ sdf.format(date));
			fileInfo.setOriName(img.getOriginalFilename());
			fileInfo.setSysName(sysName);
			fileInfo.setFileSize(img.getSize());
			
			service.insertFileInfo(fileInfo);
			
			if (count == 0) {
				hospital.setThumbImg(fileInfo.getFileId());
			}
		}
		
		service.registerUpdate(hospital);
		
		Member member = (Member) session.getAttribute("user");
		HosStaff staff = new HosStaff();
		
		staff.setHosCode(hosCode);
		staff.setStaffMemberNo(member.getMemberNo());
		staff.setStaffTitle("수의사");
		staff.setHosAdmin('Y');
		
		service.memberHosAdd(staff);
		service.insertStaff(staff);
		service.addStaff(staff);
		service.editStaff(staff);
		
		member.setHosCode(hosCode);
		session.setAttribute("user", member);
	}
	
	@RequestMapping("editHos.do")
	@ResponseBody
	public void editHos(
			int hosCode, 
			@RequestParam(value="thumbImg", defaultValue="0") int thumbImg,
			int[] hosFacility, 
			int[] dayoff,
			String hosHomePage,
			String hosComment,
			List<MultipartFile> hosImg,
			HttpSession session
			) throws IllegalStateException, IOException {
		
		
		if (hosFacility != null) {
			
			List<HosFacility> orgFacilityList = service.selectFacilitybyHosCode(hosCode);
			
			for (int facility : hosFacility) {
				int count = 0;
				
				for (HosFacility orgFacility : orgFacilityList) {
					if (facility == orgFacility.getFacilityCode()) {
						count++;
						break;
					}
				}
				
				if (count == 0) {
					HosFacility newFacility = new HosFacility();
					newFacility.setHosCode(hosCode);
					newFacility.setFacilityCode(facility);
					
					service.insertFacility(newFacility);
				}
			}
			
			for (HosFacility orgFacility : orgFacilityList) {
				int count = 0;
				
				for (int facility : hosFacility) {
					if (facility == orgFacility.getFacilityCode()) {
						count++;
						break;
					}
				}

				if (count == 0) {
					
					service.deleteFacility(orgFacility.getFacilityNo());
				}

			}

		}
		
//		if (dayoff != null) {
//			for (int i = 0; i < dayoff.length; i++) {
//				HosHours hours = new HosHours();
//				hours.setHosCode(hosCode);
//				hours.setOpenDay(dayoff[i]);
//				service.insertDayoff(hours);
//			}
//		}
		
		Hospital hospital = new Hospital();
		hospital.setHosCode(hosCode);
		hospital.setThumbImg(thumbImg);
		hospital.setHosComment(hosComment);
		
		
		if (hosImg.isEmpty()) return;
		
		int count = 0;
		
		for (MultipartFile img : hosImg) {
			
			if(img.isEmpty()) continue;
			
			boolean run = true;
			int no = 0;
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String filePath = servletContext.getRealPath("/")+"/upload/hospital/basic/" + sdf.format(date);
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
			fileInfo.setFilePath("/hospital/basic/"+ sdf.format(date));
			fileInfo.setOriName(img.getOriginalFilename());
			fileInfo.setSysName(sysName);
			fileInfo.setFileSize(img.getSize());
			
			service.insertFileInfo(fileInfo);
			
			if (count == 0) {
				hospital.setThumbImg(fileInfo.getFileId());
			}
		}
		
		service.registerUpdate(hospital);
		
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
	
	@RequestMapping("petListPage.do")
	public void petListPage(Model model, @RequestParam(value="pageNo", defaultValue="1") int pageNo, int ListCount) {
		model.addAttribute("pageResult", new PageResult(pageNo, ListCount, 5, 5));
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
	
	@RequestMapping("hosBoard.do")
	public void hosBoard(Model model, 
							int hosCode,
							@RequestParam(value="keyWord", defaultValue="") String keyWord,
							@RequestParam(value="pageNo", defaultValue="1") int pageNo,
							@RequestParam(value="searchType", defaultValue="0") int searchType							
						) {
		HosPage hosPage = new HosPage(pageNo, 10);
		hosPage.setHosCode(hosCode);
		hosPage.setPageNo(pageNo);
		hosPage.setKeyWord(keyWord);
		hosPage.setSearchType(searchType);
		
		model.addAttribute("hospital", service.selectHospitalByNo(hosCode));
		model.addAttribute("boardList", service.selectHosBoard(hosPage));
		model.addAttribute("listCount", service.hosBoardCount(hosPage));
		model.addAttribute("categoryList", service.selectCategory());
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("keyWord", keyWord);
		model.addAttribute("searchType", searchType);
	}
	
	@RequestMapping("hosBoardPage.do")
	public void hosBoardPage(Model model, @RequestParam(value="pageNo", defaultValue="1") int pageNo, int listCount, int hosCode) {
		model.addAttribute("pageResult", new PageResult(pageNo, listCount, 10, 5));
		model.addAttribute("hosCode", hosCode);
	}

	@RequestMapping("writeBoard.do")
	public void writeBoard(Model model, int hosCode) {
		model.addAttribute("hospital", service.selectHospitalByNo(hosCode));
		model.addAttribute("categoryList", service.selectCategory());
	}
	
	@RequestMapping("insertBoard.do")
	public String insertBoard(@RequestParam("fileId")int[] fileIdList,  
 							HosBoard board, 
							@RequestParam(value="files", defaultValue="null")String files
							) {
		int hosBoardNo = 0;
		try {
			hosBoardNo = service.lastBoardNo(board.getHosCode());
		} catch (BindingException e) {
			;;
		}
		board.setHosBoardNo(++hosBoardNo);
		
		service.insertBoard(board);
		System.out.println(board);
		
		System.out.println(Arrays.toString(fileIdList));
		for (int fileid : fileIdList) {
			if(fileid == 0) break;
			
			FileInfo fileInfo = new FileInfo();
			fileInfo.setBoardNo(board.getHosBoardId());
			fileInfo.setFileId(fileid);
			System.out.println(fileInfo);
			service.updateFileBoardNo(fileInfo);
		}
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/hos/hosBoard.do?hosCode=" + board.getHosCode();
	}
	
	@RequestMapping("detailBoard.do")
	public void detailBoard (Model model, int hosBoardId) {
		service.increaseViewCnt(hosBoardId);
		model.addAttribute("board", service.selectHosBoardByNo(hosBoardId));
	}
	
	@RequestMapping("editBoard.do")
	public void editBoard (Model model, int hosBoardId) {
		model.addAttribute("board", service.selectHosBoardByNo(hosBoardId));
		model.addAttribute("categoryList", service.selectCategory());
	}
	
	@RequestMapping("updateBoard.do")
	public String updateBoard(@RequestParam("fileId")int[] fileIdList,  
 							HosBoard board, 
							@RequestParam(value="files", defaultValue="null")String files
							) {
		
		System.out.println(board);
		service.updateBoard(board);
		
		System.out.println(Arrays.toString(fileIdList));
		for (int fileid : fileIdList) {
			if(fileid == 0) break;
			
			FileInfo fileInfo = new FileInfo();
			fileInfo.setBoardNo(board.getHosBoardId());
			fileInfo.setFileId(fileid);
			System.out.println(fileInfo);
			service.updateFileBoardNo(fileInfo);
		}

		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/hos/detailBoard.do?hosBoardId=" + board.getHosBoardId();
	}

	
	@RequestMapping("insertBoardImg.do")
	@ResponseBody
	public FileInfo uploadFile(@RequestParam("file") List<MultipartFile> mFileList) throws IllegalStateException,Exception{

		FileInfo fileInfo = new FileInfo();
		
		for (MultipartFile img : mFileList) {
			
			if(img.isEmpty()) continue;
			
			boolean run = true;
			int no = 0;
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String filePath = servletContext.getRealPath("/")+"/upload/hospital/board/" + sdf.format(date);
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
			
			fileInfo.setBoardCode(32);
			fileInfo.setFilePath("/hospital/board/"+ sdf.format(date));
			fileInfo.setOriName(img.getOriginalFilename());
			fileInfo.setSysName(sysName);
			fileInfo.setFileSize(img.getSize());
			service.boardFileInfo(fileInfo);
		}
		System.out.println(fileInfo);
		return fileInfo;
	}
	
	@RequestMapping("hosStaff.do")
	public void hosStaff(Model model, int hosCode) {
		
		model.addAttribute("staff", service.selectStaffConfirm(hosCode));
		model.addAttribute("staffWait", service.selectStaffUnConfirm(hosCode));
	}
	
	@RequestMapping("addStaff.do")
	@ResponseBody
	public void addStaff(HosStaff staff) {
		service.addStaff(staff);
	}
	
	@RequestMapping("editStaff.do")
	@ResponseBody
	public void editStaff(HosStaff staff) {
		System.out.println(staff);
		service.editStaff(staff);
	}
	
	@RequestMapping("deleteStaff.do")
	@ResponseBody
	public void deleteStaff(HosStaff staff) {
		System.out.println(staff);
		service.deleteStaff(staff);
	}
	
	@RequestMapping("insertFavHos.do")
	@ResponseBody
	public void insertFavHos(FavHos favHos) {
		service.insertFavHos(favHos);
	}
	
	@RequestMapping("deleteFavHos.do")
	@ResponseBody
	public void deleteFavHos(int favHosNo) {
		service.deleteFavHos(favHosNo);;
	}
	
	@RequestMapping("indexFavHos.do")
	@ResponseBody
	public Map<String, Object> indexFavHos(int memberNo) {
		
		Map<String, Object> map = new HashMap<>();
		
		try {
			map.put("favHos", service.indexFavHos(memberNo));
		} catch(BindingException e) {
			map.put("favHos", new ArrayList<FavHos>());
		}
		
		try {
			map.put("myPet", service.selectPetList(memberNo));
		} catch(BindingException e) {
			map.put("myPet", new ArrayList<Pet>());
		}
		
		return map;
	}
	
	@RequestMapping("chartPet.do")
	public void chartPet(Model model, int bookingNo) {
		model.addAttribute("chart", service.selectChart(bookingNo));
	}
	
	@RequestMapping("indexTip.do")
	@ResponseBody
	public List<Tip> indexTip(HttpSession session) {
		
		if(session.getAttribute("user") == null) {
			return service.indexTip(10);
		}
		System.out.println("Login : " + service.indexTip(5));
		return service.indexTip(5);

	}
	
	public Date setTimeToCal(Calendar cal, StringTokenizer st) {
		cal.set(Calendar.HOUR_OF_DAY, Integer.parseInt(st.nextToken()));
		cal.set(Calendar.MINUTE, Integer.parseInt(st.nextToken()));

		return cal.getTime();
	}

	public Time calToTime(Calendar cal) {
		return new Time(cal.getTime().getTime());
	}
	
	public void sendBookingResult(HosBooking booking, int bookingType, Member member) {
		Hospital hospital = service.selectHospitalByNo(booking.getHosCode());
		HosBlock block = booking.getHosBlock();
		RecipientGroup self = new RecipientGroup();
		RecipientGroup rg = new RecipientGroup();
		String[] bookingTimeArray = block.getBlockStart().toString().split(":");		
		String bookingTime = bookingTimeArray[0] + ":" + bookingTimeArray[1];
		
		System.out.println(hospital);
		
		String bookingFacility = "진료";
		if (block.getFacilityNo() == 2) {
			bookingFacility = "미용";
		}
		
		String msgBody = 
							"<span style='font-weight: bold;'>" + 
							member.getMemberName() + "</span>님의 " + 
							"<span style='font-weight: bold;'>" +
							hospital.getTitle() + "</span>에 " +
							block.getBlockDay() + " " + 
							bookingTime + " " +
							"<span style='font-weight: bold;'>" + 
							booking.getPet().getPetName() + "</span>의 " +
							"<span style='font-weight: bold;'>" + 
							bookingFacility + "</span>";
		
		Message message = new Message();
		
		// 이미 한번 메세지가 가서 Recipient_Group 에 등록되어 있는 반려동물 주인이 있는 경우(수신자가 삭제하지 않은 메일이 있다면)
		
		message.setSenderNo(hospital.getHosCode());
		message.setMsgType(bookingType);
		message.setRecipientNo(member.getMemberNo());
		
		Message chatRoomCheck = mService.checkChatExist(message);
		
		System.out.println("chatRoomCheck: "+chatRoomCheck);
		
		self.setRecipientNo(message.getSenderNo());
		self.setRecipientType(1);
		
		
		if(chatRoomCheck==null) {
			mService.insertChatId(message);
			int chatId = message.getChatId();
			rg.setRecipientNo(member.getMemberNo());
			rg.setRecipientType(0);
			rg.setRecipientGroupId(chatId);
			self.setRecipientGroupId(chatId);
			
			mService.insertRecipientGroup(self);
			mService.insertRecipientGroup(rg);
			mService.resetDateRead(message.getChatId());
		} else {
			int chatId =chatRoomCheck.getChatId();
			message.setChatId(chatId);
			self.setRecipientGroupId(chatId);
			mService.resetDateRead(chatId);
		}
		
		if (bookingType == 3) {
			message.setMsgBody(msgBody + "예약이 <span style='font-weight: bold;'>확정</span> 되었습니다.");
		}
		
		if (bookingType == 4) {
			message.setMsgBody(msgBody + "예약이 <span style='font-weight: bold;'>병원 사정 상 취소</span> 되었습니다.");
		}

		System.out.println(message);
		
		mService.insertMsg(message);
		mService.selfRead(self);
	}
}