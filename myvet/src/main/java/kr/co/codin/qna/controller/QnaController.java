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
import kr.co.codin.repository.domain.PageResult;
import kr.co.codin.repository.domain.Qna;
import kr.co.codin.repository.domain.QnaComment;
import kr.co.codin.repository.domain.QnaRecommend;
import kr.co.codin.repository.domain.SearchQnA;



@Controller
@RequestMapping("qna")
public class QnaController {
	
	
	@Autowired
	private ServletContext context;
	
	@Autowired
	private QnaService service;
	

	@RequestMapping("list.do")
	public void list(Model model
			, @RequestParam(value="pageNo", defaultValue="0") int pageNo
			,Member member
			,@RequestParam(value="order",defaultValue="0") int order
			,@RequestParam(value="answered",defaultValue="0") int answered
			,@RequestParam(value="categoryCode",defaultValue="0") int categoryCode
			,@RequestParam(value="sort",defaultValue="0") String sort
			,@RequestParam(value="keyword",defaultValue="0") String keyword
		
			) throws Exception{

		SearchQnA searChQuery= new SearchQnA(pageNo);
		searChQuery.setAnswered(answered);
		searChQuery.setKeyword(keyword);
		searChQuery.setOrder(order);
		searChQuery.setCategoryCode(categoryCode);	
		searChQuery.setSort(sort);
	
		searChQuery.setPageNo(pageNo);
		if(pageNo == 0) {
			searChQuery.setPresentPage(pageNo*10);
		}else {
			searChQuery.setPresentPage((pageNo-1)*10);
		}
		
		if(service.countTotalContent(searChQuery)%10 == 0 ) {
		
			model.addAttribute("endPage",service.countTotalContent(searChQuery)/10);
		}else {
			
			model.addAttribute("endPage",service.countTotalContent(searChQuery)/10+1);
		}
		
		if(service.countTotalContent(searChQuery)%10 == 0 ) {
		
			model.addAttribute("lastpage",service.countTotalContent(searChQuery)/10-1);
		}else {
		
			model.addAttribute("lastpage",service.countTotalContent(searChQuery)/10);
		}
		
		
		if(pageNo <= 10) {
			model.addAttribute("prev", 1);
		}else if(pageNo%10 == 0 && pageNo > 10) {
	
			model.addAttribute("prev", (pageNo-10));
		}else {
			model.addAttribute("prev", (pageNo/10)*10);
		}
		
		
		if(pageNo <= 10) {
			model.addAttribute("next",11);
		}else if(pageNo > 10 && pageNo%10 == 0 ) {
			model.addAttribute("next",pageNo + 1);
		}else {
			model.addAttribute("next",(pageNo/10)*10 + 11);
		}
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("category",service.cateList());
		model.addAttribute("qna", service.SelectList(searChQuery));
		model.addAttribute("totalCnt",service.countTotalContent(searChQuery));
	
			model.addAttribute("pageResult", new PageResult(pageNo, service.countTotalContent(searChQuery)));
		
		model.addAttribute("searchQuery", searChQuery);
		
	}
	
	
	@RequestMapping("listPaging.do")
	@ResponseBody
	public void QnaListPaging(Model model, int pageNo,int totalCnt ){
		if(pageNo == 0) {pageNo=1;}
		model.addAttribute("pageResult", new PageResult(pageNo, totalCnt));
	}
	
	@RequestMapping("writeForm.do")
	public void writeForm(Model model,String memberNickname ) {
	
		model.addAttribute("category",service.cateList());
	
	}
	
	@RequestMapping("write.do")
	public String write(Model model,Qna qna) {
		service.InsertQna(qna);
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	}
	
	@RequestMapping("detail.do")
	public void detail(Model model, int qnaNo,QnaRecommend recom,HttpSession session) {
		//
		Member member = (Member) session.getAttribute("user");
		System.out.println(member.getMemberNo());
		recom.setMemberNo(member.getMemberNo());
		recom.setQnaNo(qnaNo);
		try {
			model.addAttribute("recom",service.selectRecommend(recom));
		} catch (Exception e) {
			model.addAttribute("recom",0);
		}
		
		try {		
			model.addAttribute("recommend",service.sumrecommend(qnaNo));
		}catch(Exception e) {
			model.addAttribute("recommend",0);
		}
	
		model.addAttribute("qna",service.selectQnaByNo(qnaNo));
	}
	
	@RequestMapping("updateForm.do")
	public void updateForm(Model model, int qnaNo) {
		model.addAttribute("qna",service.selectQnaByNo(qnaNo));
		
		model.addAttribute("category",service.cateList());
	}
	
	@RequestMapping("update.do")
	public String update(Model model,Qna qna,int writerNo) {
		service.updateDetail(qna);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(Model model, Qna qna, int qnaNo) {

		service.deleteDetail(qna);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
		
	}
	
	@RequestMapping("writeComment.do")
	@ResponseBody
	public List<QnaComment> writeComment(Model model,int qnaNo,QnaComment qnaComment,Qna qna) throws Exception{
		service.writeComment(qnaComment);

		return service.selectCombyNo(qnaNo);
		
	}
	
	@RequestMapping("commentList.do")
	@ResponseBody
	public List<QnaComment> CommentList(int qnaNo,Model model, Qna qna){
		
	
		return service.selectCombyNo(qnaNo);
	}
	
	@RequestMapping("insertRecommend.do")
	@ResponseBody
	public int insertRecommend(Model model,int qnaNo, int recommend, int memberNo,QnaRecommend QnaRecom) throws Exception{
	
		QnaRecom.setMemberNo(memberNo);
		QnaRecom.setRecommend(recommend);
		QnaRecom.setQnaNo(qnaNo);

		
		try {		
			if( service.selectRecommend(QnaRecom)==0) {
				service.insertRecommend(QnaRecom);
			}else {
				service.deleteRecommend(QnaRecom);
			}
		}catch(Exception e) {
			
		}
			
		try {	
			return service.sumrecommend(qnaNo);
		}catch(Exception e) {
		
			return 0;
		}
			
	
	}
	
	@RequestMapping("deleteComment.do")
	@ResponseBody
	public void deleteComment(QnaComment comment,int qnaNo) throws Exception{
		
		service.deleteComment(comment);

	}
	
	
	@RequestMapping("updateComment.do")
	@ResponseBody
	public void updateComment(QnaComment comment,int commentNo, int commenterNo, String content) throws Exception{
	//	System.out.println("여기옴");
	
		comment.setContent(content);
		comment.setCommenterNo(commenterNo);
		comment.setCommentNo(commentNo);
		
		service.updateQnaComment(comment);
	}
	
	
	@RequestMapping("selectAnswer.do")
	@ResponseBody
	public QnaComment selectAnswer(Model model,QnaComment comment,Qna qna) throws Exception{
	
		service.updateAnswerAndPick(qna, comment);
		model.addAttribute("qnaChingg",service.selectQnaByNo(qna.getQnaNo()));
		return service.selectPickCom(comment);
	}
	

	
	
	
	
	
}
