package kr.co.codin.map.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.HosBasic;
import kr.co.codin.repository.mapper.MapMapper;

@Service
public class MainMapServiceImpl implements MainMapService{

	@Autowired
	MapMapper mapper;
	
	@Override
	public void insertMap(HosBasic list) {
		if(mapper.selectMap(list)==null) {
			mapper.insertMap(list);
		}		
	
	}

	@Override
	public String unregiCheck(HosBasic list) {
		
		System.out.println("이거 값이 뭐? :"+mapper.unregiCheck(list));
		return mapper.unregiCheck(list);
	}
	
}
