package kr.co.codin.repository.mapper;

import java.util.List;

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
import kr.co.codin.repository.domain.Hospital;
import kr.co.codin.repository.domain.Page;
import kr.co.codin.repository.domain.Pet;

public interface HosMapper {
	void insertHospital(Hospital hospital);
	List<HosFacilitylist> selectFacility();
	List<Hospital> searchHos (Page page);
	void insertFacility (HosFacility facility);
	void insertDayoff(HosHours hours);
	void registerUpdate(Hospital hospital);
	int hosCount(String keyWord);
	void insertFileInfo(FileInfo fileInfo);
	void boardFileInfo(FileInfo fileInfo);
	List<Pet> searchPet(HosPage page);
	int petCount(String keyWord);
	List<Hospital> searchReg(HosPage page);
	int regCount(HosPage page);
	List<Hospital> searchNor(HosPage page);
	int norCount(HosPage page);
	Hospital selectHospitalByNo (int hosCode);
	FileInfo selectFileInfo (int fileId);
	int nextBlockNo(int hosCode);
	int lastBoardNo(int hosCode);
	void createBlock(HosBlock block);
	int isCreateBlock (HosBlock block);
	List<HosBlock> selectBlockList(HosBlock block);
	HosBlock selectBlock(int blockCode);
	void deleteBlock(int blockCode);
	void updateBlock(HosBlock block);
	List<Pet> selectPetList(int memberNo);
	void insertBooking(HosBooking booking);
	List<HosBooking> selectBookingByHosCode(int hosCode);
	void confirmBooking(int bookingNo);
	void banBooking(int bookingNo);
	List<HosBooking> selectBookingByDate(HosBooking booking);
	HosBooking selectBooking(int bookingNo);
	int insertChart(HosChart chart);
	void insertFileInfoAtChart(FileInfo fileInfo);
	List<HosChart> chartListByPetNo(int petNo);
	List<FileInfo> selectChartImgs(int chartNo);
	void finishBooking(int bookingNo);
	List<HosBoardCategoryList> selectCategory();
	void insertBoard(HosBoard board);
	void updateFileBoardNo(FileInfo fileInfo);
	List<HosBoard> selectHosBoard(int hosCode);

}
