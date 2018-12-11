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
		/*
		 * 검색된 병원의 결과가 디비에 없을 경우에만
		 * 디비에 저장
		 */
		
			if(mapper.selectMap(list)==null) {
				//System.out.println("ddd");
				//System.out.println(list.address);
				mapper.insertMap(list);
			}else {
				mapper.updateSearchCnt(list);
			}					
	
	}

	@Override
	public char HosCheck(HosBasic list) {
		
		/*
		 * 디비에 저장된 병원의 register값을 조회
		 */
		return mapper.selectRegiMap(list).charAt(0);//mapper.selectRegiMap의 타입이 Stringd이기 때문에 char로 타입 형변환
	}

	@Override
	public int selectHosCode(HosBasic list) {
		// TODO Auto-generated method stub
		return mapper.selectHosCode(list);
	}

	
	
}
