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
public class ReportTipController {
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
		System.out.println("reportForm!");
		System.out.println(tipNo);
//		Member member = new Member();
//		String nickname = member.getMemberNickname();
//		Member loginMember = service.login(member);
//		session.setAttribute("user", loginMember);
		model.addAttribute("report",service.detailReportTip(tipNo));
//		Gallery gallery = new Gallery();
//		GalleryComment galleryComment = new GalleryComment();
//		Tip tip = new Tip();
//		TipComment tipComment = new TipComment();
//		Qna qna = new Qna();
//		QnaComment qnaComment= new QnaComment();
//		String galleryTitle = gallery.getTitle();
//		galleryComment.getComment();
//		tip.getTitle();
//		tipComment.getComment();
//		qna.getTitle();
//		qna.getContent();
//		System.out.println(service.detailReport(report));
//		model.addAttribute("report",service.detailReport(report));
//		Member member = (Member)session.getAttribute("user");
//		int memberNo = member.getMemberNo();
//		report.setReportMemberNo(memberNo);
		
	}
	
	@RequestMapping("insertReportTip.do")
	public void insertReportTip(Report report) throws Exception{
		
	}
}
	
