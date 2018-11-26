package kr.co.codin.repository.mapper;

import java.util.List;

import kr.co.codin.repository.domain.HosFacility;
import kr.co.codin.repository.domain.HosFacilitylist;
import kr.co.codin.repository.domain.HosHours;
import kr.co.codin.repository.domain.Hospital;

public interface HosMapper {
	void insertHospital(Hospital hospital);
	List<HosFacilitylist> selectFacility();
	List<Hospital> searchHos (String hosName);
	void insertFacility (HosFacility facility);
	void insertDayoff(HosHours hours);
	void registerUpdate(Hospital hospital);
}
