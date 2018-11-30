package kr.co.codin.repository.mapper;

import java.util.List;

import kr.co.codin.repository.domain.FileInfo;
import kr.co.codin.repository.domain.HosFacility;
import kr.co.codin.repository.domain.HosFacilitylist;
import kr.co.codin.repository.domain.HosHours;
import kr.co.codin.repository.domain.Hospital;
import kr.co.codin.repository.domain.Page;
import kr.co.codin.repository.domain.Pet;
import kr.co.codin.repository.domain.HosPage;

public interface HosMapper {
	void insertHospital(Hospital hospital);
	List<HosFacilitylist> selectFacility();
	List<Hospital> searchHos (Page page);
	void insertFacility (HosFacility facility);
	void insertDayoff(HosHours hours);
	void registerUpdate(Hospital hospital);
	int hosCount(String keyWord);
	void insertFileInfo(FileInfo fileInfo);
	List<Pet> searchPet(HosPage page);
	int petCount(String keyWord);
	List<Hospital> searchReg(HosPage page);
	int regCount(String keyWord);
	List<Hospital> searchNor(HosPage page);
	int norCount(String keyWord);
}
