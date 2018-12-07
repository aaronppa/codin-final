package kr.co.codin.qna.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.codin.qna.service.QnaService;
import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.Qna;
import kr.co.codin.repository.domain.QnaComment;



@Controller
@RequestMapping("qna")
public class QnaController {
	
	
	@Autowired
	private ServletContext context;
	
	@Autowired
	private QnaService service;
	
	

	
	
	@RequestMapping("list.do")
	public void list(Model model, @RequestParam(value="pageNo", defaultValue="1") int pageNo,Member member) throws Exception{
	
		model.addAttribute("qna", service.SelectList());
		
		//System.out.println(memberNickname);
//		model.addAttribute("pageResult", new PageResult(pageNo, service.countTip()));
	}
	
	
	
	@RequestMapping("writeForm.do")
	public void writeForm(Model model,String memberNickname ) {
		System.out.println("라이트폼");
		
		//System.out.println(memberNickname);
		//System.out.println("dd:"+session.toString());
	}
	
	@RequestMapping("write.do")
	public String write(Model model,Qna qna) {
		service.InsertQna(qna);
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	}
	
	@RequestMapping("detail.do")
	public void detail(Model model, int qnaNo) {
		
		model.addAttribute("qna",service.selectQnaByNo(qnaNo));
	}
	
	@RequestMapping("updateForm.do")
	public void updateForm(Model model, int qnaNo) {
		model.addAttribute("qna",service.selectQnaByNo(qnaNo));
		
		
	}
	
	@RequestMapping("update.do")
	public String update(Model model,Qna qna) {
		service.updateDetail(qna);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(Model model, Qna qna, int qnaNo) {
		System.out.println("ddd:::;;;"+qnaNo);
		service.deleteDetail(qna);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
		
	}
	
	@RequestMapping("writeComment.do")
	@ResponseBody
	public List<QnaComment> writeComment(Model model,int qnaNo,QnaComment qna) {
		service.writeComment(qna);
		System.out.println("dddd");
		System.out.println(qnaNo);
		System.out.println(qna.getContent());
		System.out.println(qna.getQnaNo());
		System.out.println(qna.getCommenterNo());
		System.out.println(UrlBasedViewResolver.REDIRECT_URL_PREFIX+"/myvet/qna/detail.do?qnaNo="+qnaNo);
		return service.selectCombyNo(qnaNo);
		
	}
	
	@RequestMapping("commentList.do")
	@ResponseBody
	public List<QnaComment> CommentList(int qnaNo){
		
		return service.selectCombyNo(qnaNo);
	}
	
	@RequestMapping("insertRecommend.do")
	@ResponseBody
	public void insertRecommend(int qnaNo, int recommend, int commenterNo) {
		System.out.println("insertRecommend 왔음");
		System.out.println(qnaNo);
		System.out.println(recommend);
		System.out.println(commenterNo);
		
	}
	
	
}
