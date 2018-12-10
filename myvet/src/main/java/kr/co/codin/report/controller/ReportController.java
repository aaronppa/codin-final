package kr.co.codin.report.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.codin.member.service.MemberService;
import kr.co.codin.report.service.ReportService;
import kr.co.codin.repository.domain.Gallery;
import kr.co.codin.repository.domain.GalleryComment;
import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.Qna;
import kr.co.codin.repository.domain.QnaComment;
import kr.co.codin.repository.domain.Report;
import kr.co.codin.repository.domain.Tip;
import kr.co.codin.repository.domain.TipComment;

@Controller
@RequestMapping("report")
public class ReportController {
	@Autowired
	private ServletContext context;
	
	@Autowired
	private ReportService service; 
	
	@Autowired
	private MemberService memberService;
//	@Autowired
//	private Member memberService;
	
	
	@RequestMapping("reportTipForm.do")
	public void reportTipForm(int tipNo,HttpSession session,Model model) throws Exception{
		Member member = (Member)session.getAttribute("user");
		model.addAttribute("nickname",member.getMemberNickname());
		System.out.println("tipReport!");
		System.out.println(tipNo);
		model.addAttribute("reportTip",service.detailReportTip(tipNo));
		
	}
	
	@RequestMapping("reportGalleryForm.do")
	public void reportGalleryForm(int galleryNo,HttpSession session,Model model) throws Exception{
//		Member member = (Member)session.getAttribute("user");
//		model.addAttribute("nickname",member.getMemberNickname());
		System.out.println("gallReport!");
		System.out.println("galleryNo : "+galleryNo);
		model.addAttribute("reportGallery",service.detailReportGallery(galleryNo));

	}
	
	@RequestMapping("reportQnaForm.do")
	public void reportQnaForm(int qnaNo,HttpSession session,Model model) throws Exception{
		Member member = (Member)session.getAttribute("user");
		model.addAttribute("nickname",member.getMemberNickname());
		System.out.println("qnaReport!");
		model.addAttribute("reportQna",service.detailReportQna(qnaNo));
	}
	
	@RequestMapping("reportCommentForm.do")
	public void reportCommentForm(int commentNo,HttpSession session,Model model) throws Exception{
		System.out.println("reportComment!");
		
	}
	
	@RequestMapping("insertReport.do")
	public String insertReport(Report report) throws Exception{
		System.out.println("신고 컨트롤러");
		System.out.println("insertReport!");
		service.insertReport(report);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	}
}
	
