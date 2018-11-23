package kr.co.codin.hos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.HosFacilitylist;
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
		// TODO Auto-generated method stub
		return mapper.selectFacility();
	}
}
