package kr.co.codin.repository.mapper;

import java.util.List;

import kr.co.codin.repository.domain.HosFacilitylist;
import kr.co.codin.repository.domain.Hospital;

public interface HosMapper {
	void insertHospital(Hospital hospital);
	List<HosFacilitylist> selectFacility();
}
