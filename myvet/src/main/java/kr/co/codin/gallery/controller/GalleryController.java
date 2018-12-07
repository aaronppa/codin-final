package kr.co.codin.gallery.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

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
import kr.co.codin.repository.domain.PageResult;
import kr.co.codin.repository.domain.SearchGallery;
import kr.co.codin.repository.domain.SearchTip;

@Controller
@RequestMapping("gallery")
public class GalleryController{
	@Autowired
	private ServletContext context;
	
	private List<FileInfo> fileList = new ArrayList<>();
	
	@Autowired
	private GalleryService service;
	
	@RequestMapping("list.do")
	public void list(Model model, @RequestParam(value="pageNo",defaultValue="1") int pageNo,@RequestParam(value="keyword", defaultValue="")String keyword,@RequestParam(value="sort", defaultValue="0") int sort) throws Exception{
		SearchGallery searchGallery = new SearchGallery(pageNo);
		searchGallery.setSort(sort);
		searchGallery.setKeyword(keyword);
		model.addAttribute("sort",sort);
		model.addAttribute("keyword",keyword);
		
		System.out.println("list");
		model.addAttribute("gallery", service.galleryList(searchGallery));
		model.addAttribute("count",service.countGallery());
		model.addAttribute("pageResult", new PageResult(pageNo, service.countGallery()));
//		model.addAttribute("pageResult", new PageResult(pageNo, service.countgallery()));
	}
	
	@RequestMapping("writeForm.do")
	public void writeForm(Model model) throws Exception{
		System.out.println("writeForm");
	}
	
	@RequestMapping("write.do")
	public String write(Gallery gallery, FileInfo fileInfo, @RequestParam("file") List<MultipartFile> mFileList) throws Exception{
		System.out.println("write");
		service.insertGallery(gallery);
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyyMMdd");
		String datePath = sdf.format(new Date());
		String oriName = fileInfo.getOriName();
		int fileSize = (int)fileInfo.getFileSize();
		
		String newName = UUID.randomUUID().toString();
		newName = newName.replaceAll("-", "");
		
		String fileExtention = "";
		String sysName = "";
		
		String realPath = context.getRealPath("/upload/gallery");
		System.out.println("realPath : "+realPath);
		
		for(MultipartFile mFile : mFileList) {
			if(mFile.isEmpty()==true) continue;
		}
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	}
	
	@RequestMapping("detail.do")
	public void detail(int galleryNo,Model model) throws Exception{
		System.out.println("detail");
		service.updateViewCnt(galleryNo);
		model.addAttribute("gallery",service.detailGallery(galleryNo));
//		model.addAttribute("gallery", service.commentList(galleryNo));
//		System.out.println("댓글조회");
	}
	
	@RequestMapping("updateForm.do")
	public void updateForm(int galleryNo, Model model) throws Exception{
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
	public List<GalleryComment> commentList(int galleryNo) throws Exception{
		System.out.println("댓글조회 Controller");
		
		return service.commentList(galleryNo);
	}
	
//	@RequestMapping("uploadFile.do")
//	@ResponseBody
//	//filePath로 리턴
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
//			System.out.println("for입장");
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
//			System.out.println("for나옴");
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
	
}




