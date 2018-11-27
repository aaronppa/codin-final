package kr.co.codin.tip.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.codin.repository.domain.PageResult;
import kr.co.codin.repository.domain.Tip;
import kr.co.codin.repository.domain.TipComment;
import kr.co.codin.repository.domain.TipRecommend;
import kr.co.codin.tip.service.TipService;

@Controller
@RequestMapping("tip")
public class TipController {
	
	@Autowired
	private TipService service; 
	
	@RequestMapping("list.do")
	public void list(Model model, @RequestParam(value="pageNo", defaultValue="1") int pageNo) throws Exception{
		System.out.println("list");
		model.addAttribute("tip", service.tipList());
		model.addAttribute("count",service.countTip());
//		model.addAttribute("pageResult", new PageResult(pageNo, service.countTip()));
	}
	
	@RequestMapping("detail.do")
	public void detail(Model model,int tipNo) throws Exception{
		System.out.println("detail");
		System.out.println(tipNo);
		model.addAttribute("countComment",service.countComment(tipNo));
		service.updateViewCnt(tipNo);
		model.addAttribute("tip", service.detailTip(tipNo));
		
	}
	
	@RequestMapping("updateForm.do")
	public void updateForm(Model model,int tipNo) throws Exception{
		System.out.println("updateForm");
		model.addAttribute("tip", service.updateForm(tipNo));
	}
	@RequestMapping("update.do")
	public String update(Model model,Tip tip) throws Exception{
		System.out.println("update");
//		int boardCode = tip.getBoardCode();
//		String title = tip.getTitle();
//		String content = tip.getContent();
//		int categoryCode = tip.getCategoryCode();
		service.updateTip(tip);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	}

	
	@RequestMapping("writeForm.do")
	public void writeForm(Model model) throws Exception{
		System.out.println("writeForm");
//		model.addAttribute("tip",service.insertTip(tip));
	}
	@RequestMapping("write.do")
	public String write(Model model,Tip tip) throws Exception{
		System.out.println("write");
//		int boardCode = tip.getBoardCode();
//		String title = tip.getTitle();
//		String content = tip.getContent();
//		int categoryCode = tip.getCategoryCode();
		service.insertTip(tip);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(int tipNo) throws Exception{
		System.out.println("delete");
		service.deleteTip(tipNo);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	}
	
	//댓글
	
	@RequestMapping("writeComment.do")
	@ResponseBody
	public String writeComment(TipComment tipComment,int tipNo) throws Exception{
		System.out.println("writeComment");
		service.insertComment(tipComment);
		System.out.println(tipNo);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"detail.do?tipNo="+tipNo;
	}
	
	@RequestMapping("commentList.do")
	@ResponseBody
	public List<TipComment> commentList(int tipNo) throws Exception{
		System.out.println("commentList");
		return service.commentList(tipNo);
		
	}
	
	@RequestMapping("deleteComment.do")
	@ResponseBody
	public void deleteComment(TipComment tipComment) throws Exception{
		System.out.println("deleteComment.do");
		service.deleteComment(tipComment);
	}

	@RequestMapping("updateComment.do")
	@ResponseBody
	public void updateComment(TipComment tipComment) throws Exception{
		System.out.println(tipComment.toString());
		System.out.println("updateComment.do");
		service.updateComment(tipComment);
	}
	
	@RequestMapping("insertRecommend.do")
	@ResponseBody
	public void insertRecommend(TipRecommend tipRecommend) throws Exception{
		System.out.println("insertRecommend");
		service.insertRecommend(tipRecommend);
	}
}
