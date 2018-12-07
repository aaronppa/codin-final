package kr.co.codin.report.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Report;
import kr.co.codin.repository.domain.Tip;
import kr.co.codin.repository.mapper.ReportMapper;

@Service
public class ReportServiceImpl implements ReportService{
	@Autowired
	private ReportMapper mapper;

	
	@Override
	public Tip detailReportTip(int tipNo) {
		return mapper.selectByReportTip(tipNo);
	}





	@Override
	public void insertReportTip(Report report) {
		mapper.insertReportTip(report);
	}
	
}
