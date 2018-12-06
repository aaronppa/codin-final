package kr.co.codin.report.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Report;
import kr.co.codin.repository.mapper.ReportMapper;

@Service
public class ReportServiceImpl implements ReportService{
	@Autowired
	private ReportMapper mapper;

	
	@Override
	public Report detailReport(Report report) {
		return mapper.selectByReport(report);
	}


	@Override
	public void insertReport(Report report) {
		mapper.insertReport(report);
	}

	
	
	
	
}