package kr.co.codin.hos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.FavHos;
import kr.co.codin.repository.domain.FileInfo;
import kr.co.codin.repository.domain.HosBlock;
import kr.co.codin.repository.domain.HosBoard;
import kr.co.codin.repository.domain.HosBoardCategoryList;
import kr.co.codin.repository.domain.HosBooking;
import kr.co.codin.repository.domain.HosChart;
import kr.co.codin.repository.domain.HosFacility;
import kr.co.codin.repository.domain.HosFacilitylist;
import kr.co.codin.repository.domain.HosHours;
import kr.co.codin.repository.domain.HosPage;
import kr.co.codin.repository.domain.HosStaff;
import kr.co.codin.repository.domain.Hospital;
import kr.co.codin.repository.domain.Pet;
import kr.co.codin.repository.mapper.HosMapper;

@Service
public class HosServiceImpl implements HosService{

	@Autowired
	HosMapper mapper;

	@Override
	public void insertHospital(Hospital hospital) {
		mapper.insertHospital(hospital);
	}

	@Override
	public List<HosFacilitylist> selectFacility() {
		return mapper.selectFacility();
	}

	@Override
	public List<Hospital> searchHos(HosPage page) {
		return mapper.searchHos(page);
	}

	@Override
	public void insertFacility(HosFacility facility) {
		mapper.insertFacility(facility);
	}

	@Override
	public void insertDayoff(HosHours hours) {
		mapper.insertDayoff(hours);
	}

	@Override
	public void registerUpdate(Hospital hospital) {
		mapper.registerUpdate(hospital);
	}

	@Override
	public int hosCount(String keyWord) {
		return mapper.hosCount(keyWord);
	}

	@Override
	public void insertFileInfo(FileInfo fileInfo) {
		mapper.insertFileInfo(fileInfo);
	}

	@Override
	public List<Pet> searchPet(HosPage page) {
		return mapper.searchPet(page);
	}

	@Override
	public int petCount(String keyWord) {
		return mapper.petCount(keyWord);
	}

	@Override
	public List<Hospital> searchReg(HosPage page) {
		return mapper.searchReg(page);
	}

	@Override
	public int regCount(HosPage page) {
		return mapper.regCount(page);
	}

	@Override
	public List<Hospital> searchNor(HosPage page) {
		return mapper.searchNor(page);
	}

	@Override
	public int norCount(HosPage page) {
		return mapper.norCount(page);
	}

	@Override
	public Hospital selectHospitalByNo(int hosCode) {
		return mapper.selectHospitalByNo(hosCode);
	}

	@Override
	public FileInfo selectFileInfo(int fileId) {
		return mapper.selectFileInfo(fileId);
	}

	@Override
	public int nextBlockNo(int hosCode) {
		return mapper.nextBlockNo(hosCode);
	}
	
	@Override
	public void createBlock(HosBlock block) {
		mapper.createBlock(block);
	}
	
	@Override
	public int isCreateBlock(HosBlock block) {
		return mapper.isCreateBlock(block);
	}

	@Override
	public List<HosBlock> selectBlockList(HosBlock block) {
		return mapper.selectBlockList(block);
	}

	@Override
	public HosBlock selectBlock(int blockCode) {
		return mapper.selectBlock(blockCode);
	}

	@Override
	public void deleteBlock(int blockCode) {
		mapper.deleteBlock(blockCode);
	}

	@Override
	public void updateBlock(HosBlock block) {
		mapper.updateBlock(block);
	}

	@Override
	public List<Pet> selectPetList(int memberNo) {
		return mapper.selectPetList(memberNo);
	}
	@Override
	public void insertBooking(HosBooking booking) {
		mapper.insertBooking(booking);
	}

	@Override
	public List<HosBooking> selectBookingByHosCode(int hosCode) {
		return mapper.selectBookingByHosCode(hosCode);
	}

	@Override
	public void confirmBooking(int bookingNo) {
		mapper.confirmBooking(bookingNo);
	}

	@Override
	public void banBooking(int bookingNo) {
		mapper.banBooking(bookingNo);
	}

	@Override
	public List<HosBooking> selectBookingByDate(HosBooking booking) {
		return mapper.selectBookingByDate(booking);
	}

	@Override
	public HosBooking selectBooking(int bookingNo) {
		return mapper.selectBooking(bookingNo);
	}
	
	@Override
	public int insertChart(HosChart chart) {
		return mapper.insertChart(chart);
	}
	
	@Override
	public void insertFileInfoAtChart(FileInfo fileInfo) {
		mapper.insertFileInfoAtChart(fileInfo);
	};
	
	@Override
	public List<HosChart> chartListByPetNo(int petNo) {
		return mapper.chartListByPetNo(petNo);
	};
	
	@Override
	public List<FileInfo> selectChartImgs(int chartNo) {
		return mapper.selectChartImgs(chartNo);
	}
	
	@Override
	public void finishBooking(int bookingNo) {
		mapper.finishBooking(bookingNo);
	}

	@Override
	public List<HosBoardCategoryList> selectCategory() {
		return mapper.selectCategory();
	}
	
	@Override
	public void insertBoard(HosBoard board) {
		mapper.insertBoard(board);
	}
	
	@Override
	public int lastBoardNo(int hosCode) {
		return mapper.lastBoardNo(hosCode);
	}

	@Override
	public void updateFileBoardNo(FileInfo fileInfo) {
		mapper.updateFileBoardNo(fileInfo);
	}

	@Override
	public void boardFileInfo(FileInfo fileInfo) {
		mapper.boardFileInfo(fileInfo);
	}

	@Override
	public List<HosBoard> selectHosBoard(HosPage hosPage) {
		return mapper.selectHosBoard(hosPage);
	}
	
	@Override
	public 	HosBoard selectHosBoardByNo(int hosBoardId) {
		return mapper.selectHosBoardByNo(hosBoardId);
	}
	
	@Override
	public void updateBoard(HosBoard board) {
		mapper.updateBoard(board);
	}
	
	@Override
	public int hosBoardCount(HosPage page) {
		return mapper.hosBoardCount(page);
	}

	@Override
	public List<HosStaff> selectStaffConfirm(int hosCode) {
		return mapper.selectStaffConfirm(hosCode);
	}

	@Override
	public List<HosStaff> selectStaffUnConfirm(int hosCode) {
		return mapper.selectStaffUnConfirm(hosCode);
	}
	
	@Override
	public 	void insertStaff (HosStaff staff) {

		if (mapper.isRegStaff(staff) > 0) {
			return;
		}
		
		mapper.insertStaff(staff);
	}
	
	@Override
	public 	void addStaff(HosStaff staff) {
		mapper.addStaff(staff);
	}
	
	@Override
	public 	void editStaff(HosStaff staff) {
		mapper.editStaff(staff);
	}
	
	@Override
	public void deleteStaff(HosStaff staff) {
		mapper.deleteStaff(staff);
		mapper.memberHosNull(staff.getStaffMemberNo());
	}

	@Override
	public 	int maxBookingAtMedical(HosBlock block) {
		return mapper.maxBookingAtMedical(block);
	}
	
	@Override
	public 	List<Integer> blockCodeAtMedical(HosBlock block) {
		return mapper.blockCodeAtMedical(block);
	}
	
	@Override
	public 	int maxBookingAtBeauty(HosBlock block) {
		return mapper.maxBookingAtBeauty(block);
	}
	
	@Override
	public 	List<Integer> blockCodeAtBeauty(HosBlock block) {
		return mapper.blockCodeAtBeauty(block);
	}
	
	@Override
	public int bookingCount(int blockCode) {
		return mapper.bookingCount(blockCode);
	}
	
	@Override
	public void memberHosAdd(HosStaff staff) {
		mapper.memberHosAdd(staff);
	}
	
	@Override
	public void insertFavHos(FavHos favHos) {
		mapper.insertFavHos(favHos);
	}

	@Override
	public int selectFavHosbyMember(FavHos favHos) {
		return mapper.selectFavHosbyMember(favHos);
	}
	
	@Override
	public void deleteFavHos (int favHosNo) {
		mapper.deleteFavHos(favHosNo);
	}

	@Override
	public 	int followCnt(int hosCode) {
		return mapper.followCnt(hosCode);
	}
	
	@Override
	public List<HosFacility> selectFacilitybyHosCode (int hosCode) {
		return mapper.selectFacilitybyHosCode(hosCode);
	}

	@Override
	public 	List<FavHos> indexFavHos(int memberNo) {
		return mapper.indexFavHos(memberNo);
	}
	
	@Override
	public void insertReception(HosBooking booking) {
		mapper.insertReception(booking);
	}
	
	@Override
	public List<HosBooking> selectReceptionByDate(HosBooking booking) {
		return mapper.selectReceptionByDate(booking);
	}

}
