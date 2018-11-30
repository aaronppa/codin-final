package kr.co.codin.hos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.FileInfo;
import kr.co.codin.repository.domain.HosFacility;
import kr.co.codin.repository.domain.HosFacilitylist;
import kr.co.codin.repository.domain.HosHours;
import kr.co.codin.repository.domain.Hospital;
import kr.co.codin.repository.domain.Pet;
import kr.co.codin.repository.domain.HosPage;
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
	public int regCount(String keyWord) {
		return mapper.regCount(keyWord);
	}

	@Override
	public List<Hospital> searchNor(HosPage page) {
		return mapper.searchNor(page);
	}

	@Override
	public int norCount(String keyWord) {
		return mapper.norCount(keyWord);
	}
}
