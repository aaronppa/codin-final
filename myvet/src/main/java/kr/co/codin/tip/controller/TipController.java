package kr.co.codin.tip.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.codin.repository.domain.FileInfo;
import kr.co.codin.repository.domain.Page;
import kr.co.codin.repository.domain.PageResult;
import kr.co.codin.repository.domain.Tip;
import kr.co.codin.repository.domain.TipComment;
import kr.co.codin.repository.domain.TipCommentRecommend;
import kr.co.codin.repository.domain.TipRecommend;
import kr.co.codin.tip.service.TipService;

@Controller
@RequestMapping("tip")
public class TipController {
	@Autowired
	private ServletContext context;
	
	private List<FileInfo> fileList = new ArrayList<>();
	
	@Autowired
	private TipService service; 
	
	@RequestMapping("list.do")
	public void list(Model model, @RequestParam(value="pageNo", defaultValue="1") int pageNo) throws Exception{
		Page page = new Page(pageNo);
		
		System.out.println("list");
		model.addAttribute("tip", service.tipList(page));
		model.addAttribute("count",service.countTip());
		model.addAttribute("pageResult", new PageResult(pageNo,service.countTip()));
//		model.addAttribute("pageResult", new PageResult(pageNo, service.countTip()));
	}
	
	@RequestMapping("detail.do")
	public void detail(Model model,int tipNo, HttpSession session, TipRecommend tipRecommend,TipCommentRecommend tipCommentRecommend) throws Exception{
		
//		Member member = (Member)session.getAttribute("user");
//		int memberNo = member.getMemberNo();
//		tipRecommend.setMemberNo(memberNo);
		
		tipRecommend.setMemberNo(7);
		
		System.out.println("detail");
		System.out.println(tipNo);
		model.addAttribute("countComment",service.countComment(tipNo));
		service.updateViewCnt(tipNo);
		model.addAttribute("tip", service.detailTip(tipNo));
		model.addAttribute("recom",service.selectRecommend(tipRecommend));
		model.addAttribute("comRecom",service.selectCommentRecommend(tipCommentRecommend));
		model.addAttribute("countRecomment", service.countRecommend(tipNo));
		
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
	public List<TipComment> commentList(Tip tip) throws Exception{
		System.out.println("commentList");
//		Member member = (Member)session.getAttribute("user");
//		int memberNo = member.getMemberNo();
//		tipCommentRecommend.setMemberNo(memberNo);
		
		tip.setMemberNo(7);
		return service.commentList(tip);
		
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
	
//	@RequestMapping("countComment.do")
//	@ResponseBody
//	public String countComment(int tipNo) throws Exception{
//		System.out.println("countComment");
//		service.countComment(tipNo);
//		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do?tipNo="+tipNo;
//	}
	
	
	@RequestMapping("uploadFile.do")
	@ResponseBody
	//filePath로 리턴
	public FileInfo uploadFile(@RequestParam("file") List<MultipartFile> mFileList) throws IllegalStateException,Exception{
		System.out.println("mFileList : "+mFileList);
		String uploadPath = "/tip";
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyyMMdd");
		String datePath = sdf.format(new Date());
		FileInfo fileInfo = new FileInfo();
		
		int boardCode = 1;
		int boardNo = 0;
		
		String newName = UUID.randomUUID().toString();
		newName = newName.replace("-", "");
		
		String fileExtension = "";
		String sysName = "";
		
		String realPath = context.getRealPath("/upload/tip");
		System.out.println("realPath : " + realPath);
		
		for(MultipartFile mFile : mFileList) {
			System.out.println("for입장");
			if(mFile.isEmpty()==true) continue;
			fileExtension = getExtension(mFile.getOriginalFilename());
			sysName = newName + "." + fileExtension;
			
			System.out.println("boardCode : "+boardCode);
			System.out.println("boardNo : "+boardNo);
			System.out.println("file.getOriName() : "+mFile.getOriginalFilename());
			System.out.println("sysName : "+sysName);
			System.out.println("filePath : "+uploadPath+datePath);
			System.out.println("getSize"+(int)mFile.getSize());
			
			fileInfo.setBoardCode(boardCode);
			fileInfo.setBoardNo(boardNo);
			fileInfo.setOriName(mFile.getOriginalFilename());
			fileInfo.setSysName(sysName);
			fileInfo.setFilePath(uploadPath+datePath);
			fileInfo.setFileSize((int)mFile.getSize());
			File img = new File(realPath + datePath, sysName);
			System.out.println(img);
			if(img.exists() == false) {
				img.mkdirs();
			}
			System.out.println("for나옴");
			System.out.println("realPath : "+ realPath);
			mFile.transferTo(img);
//			fileInfo.getUrl();
//			System.out.println("getUrl:"+fileInfo.getUrl());
//			fileInfo.setUrl("/myvet/upload"+uploadPath+datePath+"/"+sysName);
//			System.out.println(realPath+datePath+"/"+sysName);
			fileList.add(fileInfo);
			service.uploadFile(fileInfo);
		}
		
		return fileInfo;
	}

	 private static String getExtension(String fileName) {
	        int dotPosition = fileName.lastIndexOf('.');
	        
	        if (dotPosition != -1 && fileName.length() - 1 > dotPosition) {
	            return fileName.substring(dotPosition + 1);
	        } else {
	            return "";
	        }
	 }
	 
	@RequestMapping("insertRecommend.do")
	@ResponseBody
	public void insertRecommend(TipRecommend tipRecommend, HttpSession session) throws Exception{
		System.out.println("insertRecommend");
//		Member member = (Member)session.getAttribute("user");
		tipRecommend.setMemberNo(7);
		service.insertRecommend(tipRecommend);
	}
	
	@RequestMapping("insertCommentRecommend.do")
	@ResponseBody
	public void insertCommentRecommend(TipCommentRecommend tipCommentRecommend, HttpSession session) throws Exception{
		System.out.println("insertCommentRecommend!");
//		Member member = (Member)session.getAttribute("user");
		tipCommentRecommend.setMemberNo(7);
		service.insertCommentRecommend(tipCommentRecommend);
		
	}
	
//	@RequestMapping("test.do")
//	public void test (Model model) {
//		model.addAttribute("img", service.)
//	}
	
//
//	@RequestMapping("deleteRecommend.do")
//	@ResponseBody
//	public void deleteRecommend(TipRecommend tipRecommend) throws Exception{
//		System.out.println("deleteRecommend");
////		recommend = -1;
////		tipRecommend.setRecommend(recommend);
//		service.deleteRecommend(tipRecommend);
//	}
	
	
	
	
}
