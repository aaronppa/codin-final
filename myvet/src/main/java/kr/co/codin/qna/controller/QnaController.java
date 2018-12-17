package kr.co.codin.qna.controller;

import java.util.List;

import javax.servlet.ServletContext;

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
		//System.out.println("--------------------------");
		//System.out.println("pageNo:"+pageNo);
		SearchQnA searChQuery= new SearchQnA(pageNo);
		searChQuery.setAnswered(answered);
		//System.out.println("answered :"+ answered);
		searChQuery.setKeyword(keyword);
		
		//System.out.println(keyword);
		
		searChQuery.setOrder(order);
		//System.out.println("order:"+order);
		searChQuery.setCategoryCode(categoryCode);
		//System.out.println("카테고리 코드 :"+categoryCode);
		searChQuery.setSort(sort);
		//System.out.println("sort:"+sort);
		searChQuery.setPageNo(pageNo);
		if(pageNo == 0) {
			searChQuery.setPresentPage(pageNo*10);
		}else {
			searChQuery.setPresentPage((pageNo-1)*10);
		}
		//System.out.println("dlsjdlfjsldfjsldjflsjdflsj::::::"+searChQuery.getPresentPage());
		if(service.countTotalContent(searChQuery)%10 == 0 ) {
			//System.out.println("11");
			model.addAttribute("endPage",service.countTotalContent(searChQuery)/10);
		}else {
			//System.out.println("22");
			model.addAttribute("endPage",service.countTotalContent(searChQuery)/10+1);
		}
		
		if(service.countTotalContent(searChQuery)%10 == 0 ) {
		//	System.out.println("11");
			model.addAttribute("lastpage",service.countTotalContent(searChQuery)/10-1);
		}else {
		//	System.out.println("22");
			model.addAttribute("lastpage",service.countTotalContent(searChQuery)/10);
		}
		
		
		if(pageNo <= 10) {
			model.addAttribute("prev", 1);
		}else if(pageNo%10 == 0 && pageNo > 10) {
		//	System.out.println(pageNo);
		//	System.out.println("여기 걸려야 하는데");
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
		/*System.out.println("dlsdjfsljdf:"+pageNo);	
		System.out.println("-----------------------------------------");*/
		model.addAttribute("category",service.cateList());
		model.addAttribute("qna", service.SelectList(searChQuery));
		model.addAttribute("totalCnt",service.countTotalContent(searChQuery));
	
			model.addAttribute("pageResult", new PageResult(pageNo, service.countTotalContent(searChQuery)));
		
		model.addAttribute("searchQuery", searChQuery);
		
	}
	
	
	@RequestMapping("listPaging.do")
	@ResponseBody
	public void QnaListPaging(Model model, int pageNo,int totalCnt ){
		/*System.out.println("listPaging.do");
		System.out.println(pageNo);
		System.out.println(totalCnt);*/
		if(pageNo == 0) {pageNo=1;}
		model.addAttribute("pageResult", new PageResult(pageNo, totalCnt));
	}
	
	@RequestMapping("writeForm.do")
	public void writeForm(Model model,String memberNickname ) {
		//System.out.println("라이트폼");
		model.addAttribute("category",service.cateList());
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
		
		model.addAttribute("category",service.cateList());
	}
	
	@RequestMapping("update.do")
	public String update(Model model,Qna qna,int writerNo) {
		service.updateDetail(qna);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(Model model, Qna qna, int qnaNo) {
		/*System.out.println("dd");
		System.out.println("ddd:::;;;"+qnaNo);*/
		service.deleteDetail(qna);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
		
	}
	
	@RequestMapping("writeComment.do")
	@ResponseBody
	public List<QnaComment> writeComment(Model model,int qnaNo,QnaComment qnaComment,Qna qna) throws Exception{
		service.writeComment(qnaComment);
		/*System.out.println("dddd");
		System.out.println(qnaNo);
		System.out.println(qnaComment.getContent());
		System.out.println(qnaComment.getQnaNo());
		System.out.println(qnaComment.getCommenterNo());
		System.out.println(UrlBasedViewResolver.REDIRECT_URL_PREFIX+"/myvet/qna/detail.do?qnaNo="+qnaNo);*/
		
		return service.selectCombyNo(qnaNo);
		
	}
	
	@RequestMapping("commentList.do")
	@ResponseBody
	public List<QnaComment> CommentList(int qnaNo,Model model, Qna qna){
		
	
		return service.selectCombyNo(qnaNo);
	}
	
	@RequestMapping("insertRecommend.do")
	@ResponseBody
	public String insertRecommend(int qnaNo, int recommend, int memberNo,QnaRecommend QnaRecom) throws Exception{
		/*System.out.println("insertRecom");
		System.out.println(qnaNo);
		System.out.println(recommend);
		System.out.println(memberNo);*/
		QnaRecom.setMemberNo(memberNo);
		QnaRecom.setRecommend(recommend);
		QnaRecom.setQnaNo(qnaNo);
		service.insertRecommend(QnaRecom);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"detail.do?qnaNo="+qnaNo;
	}
	
	@RequestMapping("deleteComment.do")
	@ResponseBody
	public void deleteComment(QnaComment comment,int qnaNo) throws Exception{
		
		service.deleteComment(comment);
		
		//return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"/myvet/qna/detail.do?qnaNo="+qnaNo;
		
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
	
	
/*	@RequestMapping("page.do")
	@ResponseBody
	public void paging(Qna qna) {
		
	}*/
	@RequestMapping("selectAnswer.do")
	@ResponseBody
	public QnaComment selectAnswer(Model model,QnaComment comment,Qna qna) throws Exception{
	
		service.updateAnswerAndPick(qna, comment);
		model.addAttribute("qnaChingg",service.selectQnaByNo(qna.getQnaNo()));
		return service.selectPickCom(comment);
	}
	

	
	
	
	
	
}
