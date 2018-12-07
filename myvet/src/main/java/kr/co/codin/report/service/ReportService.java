package kr.co.codin.report.service;

import kr.co.codin.repository.domain.Report;
import kr.co.codin.repository.domain.Tip;

public interface ReportService {
	Tip detailReportTip(int tipNo);
	void insertReportTip(Report report);
	
}
