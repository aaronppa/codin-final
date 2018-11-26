package kr.co.codin.hos.service;

import java.util.List;

import kr.co.codin.repository.domain.HosFacility;
import kr.co.codin.repository.domain.HosFacilitylist;
import kr.co.codin.repository.domain.HosHours;
import kr.co.codin.repository.domain.Hospital;

public interface HosService {
	void insertHospital(Hospital hospital);
	List<HosFacilitylist> selectFacility();
	List<Hospital> searchHos (String hosName);
	void insertFacility (HosFacility facility);
	void insertDayoff(HosHours hours);
	void registerUpdate(Hospital hospital);

}
