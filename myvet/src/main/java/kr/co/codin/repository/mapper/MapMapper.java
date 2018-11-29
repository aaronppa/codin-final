package kr.co.codin.repository.mapper;

import java.util.List;

import kr.co.codin.repository.domain.HosBasic;

public interface MapMapper {
	void insertMap(HosBasic basic);
	HosBasic selectMap(HosBasic basic);
	String selectRegiMap(HosBasic basic);
	void updateSearchCnt(HosBasic basic);
}
