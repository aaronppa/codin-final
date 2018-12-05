package kr.co.codin.repository.mapper;

import kr.co.codin.repository.domain.Report;

public interface ReportMapper {
	Report selectByReport(Report report);
	void insertReport(Report report);
}
