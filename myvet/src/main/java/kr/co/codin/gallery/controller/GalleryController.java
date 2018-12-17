package kr.co.codin.gallery.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

import kr.co.codin.gallery.service.GalleryService;
import kr.co.codin.repository.domain.FileInfo;
import kr.co.codin.repository.domain.Gallery;
import kr.co.codin.repository.domain.GalleryComment;
import kr.co.codin.repository.domain.GalleryCommentRecommend;
import kr.co.codin.repository.domain.GalleryRecommend;
import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.PageResult;
import kr.co.codin.repository.domain.Pet;
import kr.co.codin.repository.domain.SearchGallery;

@Controller
@RequestMapping("gallery")
public class GalleryController{
	@Autowired
	private ServletContext context;
	
	private List<FileInfo> fileList = new ArrayList<>();
	
	@Autowired
	private GalleryService service;
	
	
	

	
	
	@RequestMapping("list.do")
	public void list(Model model,Member member,HttpSession session, @RequestParam(value="pageNo",defaultValue="1") int pageNo,@RequestParam(value="keyword", defaultValue="")String keyword,@RequestParam(value="sort", defaultValue="0") int sort) throws Exception{		
		FileInfo fileInfo = new FileInfo();
		Gallery gallery = new Gallery();
		member = (Member)session.getAttribute("user");
		System.out.println("petName : "+gallery.getPetList());
		System.out.println("memberNo : "+member.getMemberNo());
		System.out.println("nickname : "+gallery.getMemberNickname());
		System.out.println("recomCnt : "+gallery.getRecomCnt());
		SearchGallery searchGallery = new SearchGallery(pageNo);
		searchGallery.setSort(sort);
		searchGallery.setKeyword(keyword);
		model.addAttribute("nickname",member.getMemberNickname());
 		model.addAttribute("sort",sort);
		model.addAttribute("keyword",keyword);
		model.addAttribute("topGallery",service.galleryTopList());
		model.addAttribute("gallery", service.galleryList(searchGallery));
		System.out.println("gallery result: "+service.galleryList(searchGallery));
		model.addAttribute("count",service.countGallery());
		model.addAttribute("pageResult", new PageResult(pageNo, service.countGallery())); 
		
//		service.selectFile(fileInfoList);
//		model.addAttribute("pageResult", new PageResult(pageNo, service.countgallery()));
	}
	
	@RequestMapping("writeForm.do")
	public void writeForm(Model model) throws Exception{

		System.out.println("writeForm");
	}
	
	@RequestMapping("write.do")
	public String write(Gallery gallery, HttpSession session, FileInfo fileInfo, @RequestParam("file") List<MultipartFile> mFileList) throws Exception{
		System.out.println("write");
		System.out.println("mFileList : "+mFileList);
		

		service.insertGallery(gallery);
		Date date = new Date();
		System.out.println(date);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
		String filePath = context.getRealPath("/")+"/upload/gallery/"+sdf.format(date);
//		String newName = UUID.randomUUID().toString();
//		newName = newName.replace("-", "");
		String fileExtension = "";
		int fileSize = (int)fileInfo.getFileSize();
		for(MultipartFile mFile : mFileList) {
			int no = 0;
			if(mFile.isEmpty()==true) continue;
			fileExtension = getExtension(mFile.getOriginalFilename());
			boolean run = true;
			int galleryNo = gallery.getGalleryNo();
			String oriName = mFile.getOriginalFilename();
			String sysName = galleryNo+sdf.format(date)+oriName;
			File file = new File(filePath, sysName);
			
			while(run) {
				if(!file.exists()) break;
				sysName = sdf.format(date)+galleryNo+oriName;
				file = new File(filePath, sysName);
			}
			file.mkdirs();
			mFile.transferTo(file);
			
			fileInfo.setFilePath("/gallery/"+sdf.format(date));
			fileInfo.setFileSize(mFile.getSize());
			fileInfo.setOriName(oriName);
			fileInfo.setSysName(sysName); 
			fileInfo.setBoardCode(10);
			fileInfo.setBoardNo(gallery.getGalleryNo());
			service.uploadFile(fileInfo);
			}
		
		
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	}
	
	 private static String getExtension(String fileName) {
	        int dotPosition = fileName.lastIndexOf('.');
	        
	        if (dotPosition != -1 && fileName.length() - 1 > dotPosition) {
	            return fileName.substring(dotPosition + 1);
	        } else {
	            return "";
	        }
	 }
	
	
	@RequestMapping("detail.do")
	public void detail(int galleryNo,Member member,HttpSession session, Gallery gallery,GalleryRecommend galleryRecommend,GalleryCommentRecommend galleryCommentRecommend, Model model) throws Exception{
		member = (Member)session.getAttribute("user");
		
		model.addAttribute("nickname",gallery.getMemberNickname());
		System.out.println("detail");
		int sumRecommend = 0;
		try {
			sumRecommend = service.sumRecommend(galleryNo);
		}catch (Exception e) {
			;;		
		}
		service.updateViewCnt(galleryNo);
		model.addAttribute("gallery",service.detailGallery(galleryNo));
		model.addAttribute("countComment",service.countComment(galleryNo));
		model.addAttribute("recommend",service.selectRecommend(galleryRecommend));
		System.out.println(galleryRecommend);
		model.addAttribute("sumRecommend",sumRecommend);
		model.addAttribute("comRecommend",service.selectRecommend(galleryRecommend));
//		model.addAttribute("gallery", service.commentList(galleryNo));
//		System.out.println("�뙎湲�議고쉶");
	}
	
	@RequestMapping("updateForm.do")
	public void updateForm(int galleryNo, Model model,Member member,HttpSession session) throws Exception{
		member = (Member)session.getAttribute("user");
		model.addAttribute("gallery",service.updateForm(galleryNo));
	}
	
	@RequestMapping("update.do")
	public String update(Gallery gallery) throws Exception{
		System.out.println("update");
		service.updateGallery(gallery);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(int galleryNo) throws Exception{
		service.deleteGallery(galleryNo);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";

	}
	
	@RequestMapping("writeComment.do")
	@ResponseBody
	public String writeComment(GalleryComment galleryComment,int galleryNo) throws Exception{
		System.out.println("writeComment");
		service.insertComment(galleryComment);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"detail.do?tipNo="+galleryNo;
	}
	
	@RequestMapping("commentList.do")
	@ResponseBody
	public List<GalleryComment> commentList(Gallery gallery) throws Exception{
		System.out.println("�뙎湲�議고쉶 Controller");
		gallery.setWriterNo(7);

		return service.commentList(gallery);
	}
	@RequestMapping("updateComment.do")
	@ResponseBody
	public void updateComment(GalleryComment galleryComment) throws Exception{
		System.out.println("updateComment!!");
		service.updateComment(galleryComment);
	}
	
	@RequestMapping("deleteComment.do")
	@ResponseBody
	public void deleteComment(GalleryComment galleryComment) throws Exception{
		System.out.println("deleteComment!!");
		service.deleteComment(galleryComment);
	}
	
	@RequestMapping("insertRecommend.do")
	@ResponseBody
	public void insertRecommend(Model model,GalleryRecommend galleryRecommend) throws Exception{
		System.out.println("insertRecommend!");
		service.insertRecommend(galleryRecommend);
	}
	
	@RequestMapping("insertCommentRecommend.do")
	@ResponseBody
	public void insertCommentRecommend(Model model, GalleryCommentRecommend galleryCommentRecommend) throws Exception{
		System.out.println("insertComRecom~@!");
		service.insertCommentRecommend(galleryCommentRecommend);
	}
	
	
//	@RequestMapping("uploadFile.do")
//	@ResponseBody
	//filePath濡� 由ы꽩
//	public FileInfo uploadFile(@RequestParam("file") List<MultipartFile> mFileList) throws IllegalStateException,Exception{
//		System.out.println("mFileList : "+mFileList);
//		String uploadPath = "/gallery";
//		SimpleDateFormat sdf = new SimpleDateFormat("/yyyyMMdd");
//		String datePath = sdf.format(new Date());
//		FileInfo fileInfo = new FileInfo();
//		
//		int boardCode = 10;
//		int boardNo = 0;
//		
//		String newName = UUID.randomUUID().toString();
//		newName = newName.replace("-", "");
//		
//		String fileExtension = "";
//		String sysName = "";
//		
//		String realPath = context.getRealPath("/upload/gallery");
//		System.out.println("realPath : " + realPath);
//		
//		for(MultipartFile mFile : mFileList) {
//			System.out.println("for�엯�옣");
//			if(mFile.isEmpty()==true) continue;
//			fileExtension = getExtension(mFile.getOriginalFilename());
//			sysName = newName + "." + fileExtension;
//			
//			System.out.println("boardCode : "+boardCode);
//			System.out.println("boardNo : "+boardNo);
//			System.out.println("file.getOriName() : "+mFile.getOriginalFilename());
//			System.out.println("sysName : "+sysName);
//			System.out.println("filePath : "+uploadPath+datePath);
//			System.out.println("getSize"+(int)mFile.getSize());
//			
//			fileInfo.setBoardCode(boardCode);
//			fileInfo.setBoardNo(boardNo);
//			fileInfo.setOriName(mFile.getOriginalFilename());
//			fileInfo.setSysName(sysName);
//			fileInfo.setFilePath(uploadPath+datePath);
//			fileInfo.setFileSize((int)mFile.getSize());
//			File img = new File(realPath + datePath, sysName);
//			System.out.println(img);
//			if(img.exists() == false) {
//				img.mkdirs();
//			}
//			System.out.println("for�굹�샂");
//			System.out.println("realPath : "+ realPath);
//			mFile.transferTo(img);
//			fileList.add(fileInfo);
//			service.uploadFile(fileInfo);
//		}
//		
//		return fileInfo;
//	}
//	 private static String getExtension(String fileName) {
//	        int dotPosition = fileName.lastIndexOf('.');
//	        
//	        if (dotPosition != -1 && fileName.length() - 1 > dotPosition) {
//	            return fileName.substring(dotPosition + 1);
//	        } else {
//	            return "";
//	        }
//	 }
//	}
}




