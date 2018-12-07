package kr.co.codin.repository.mapper;

import kr.co.codin.repository.domain.Report;
import kr.co.codin.repository.domain.Tip;

public interface ReportMapper {
	Tip selectByReportTip(int tipNo);
	void insertReportTip(Report report);
}
