package kr.co.codin.hos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.HosFacility;
import kr.co.codin.repository.domain.HosFacilitylist;
import kr.co.codin.repository.domain.HosHours;
import kr.co.codin.repository.domain.Hospital;
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
	public List<Hospital> searchHos(String hosName) {
		return mapper.searchHos(hosName);
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
}
