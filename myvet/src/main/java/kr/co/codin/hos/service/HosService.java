package kr.co.codin.hos.service;

import java.util.List;

import kr.co.codin.repository.domain.HosFacilitylist;
import kr.co.codin.repository.domain.Hospital;

public interface HosService {
	void insertHospital(Hospital hospital);
	List<HosFacilitylist> selectFacility();

}
