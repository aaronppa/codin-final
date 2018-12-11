package kr.co.codin.hos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.FileInfo;
import kr.co.codin.repository.domain.HosBlock;
import kr.co.codin.repository.domain.HosBooking;
import kr.co.codin.repository.domain.HosChart;
import kr.co.codin.repository.domain.HosFacility;
import kr.co.codin.repository.domain.HosFacilitylist;
import kr.co.codin.repository.domain.HosHours;
import kr.co.codin.repository.domain.HosPage;
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
	
	public void finishBooking(int bookingNo) {
		mapper.finishBooking(bookingNo);
	}
}
