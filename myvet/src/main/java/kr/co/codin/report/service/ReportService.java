package kr.co.codin.report.service;

import kr.co.codin.repository.domain.Report;

public interface ReportService {
	Report detailReport(Report report);
	void insertReport(Report report);
	
}
