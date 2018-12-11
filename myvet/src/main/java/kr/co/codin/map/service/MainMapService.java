package kr.co.codin.map.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.HosBasic;

@Service
public interface MainMapService {
	void insertMap(HosBasic list);
	char HosCheck(HosBasic list);
	int selectHosCode(HosBasic list);
}
