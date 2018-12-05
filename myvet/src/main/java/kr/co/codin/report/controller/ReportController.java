package kr.co.codin.report.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.codin.report.service.ReportService;
import kr.co.codin.repository.domain.Report;

@Controller
@RequestMapping("report")
public class ReportController {
	@Autowired
	private ServletContext context;
	
	@Autowired
	private ReportService service; 
	
	@RequestMapping("reportForm.do")
	public void report(Report report,Model model,int boardCode,@RequestParam(value="commentNo", defaultValue="") int commentNo,int contentNo,int reportMemberNo, int targetMemberNo) throws Exception{
		System.out.println("reportForm!");
		report.setBoardCode(boardCode);
		report.setContentNo(contentNo);
		report.setReportMemberNo(reportMemberNo);
		report.setReportMemberNo(reportMemberNo);
		report.setTargetMemberNo(targetMemberNo);
		
		model.addAttribute("report",service.detailReport(report));
	}
	
	@RequestMapping("writeReport.do")
	public void writeReport(Report report) throws Exception{
		
	}
}
	
