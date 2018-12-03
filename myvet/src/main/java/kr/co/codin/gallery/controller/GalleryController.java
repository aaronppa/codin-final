package kr.co.codin.gallery.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.codin.gallery.service.GalleryService;
import kr.co.codin.repository.domain.FileInfo;
import kr.co.codin.repository.domain.Gallery;
import kr.co.codin.repository.domain.GalleryComment;

@Controller
@RequestMapping("gallery")
public class GalleryController{
	@Autowired
	private ServletContext context;
	
	private List<FileInfo> fileList = new ArrayList<>();
	
	@Autowired
	private GalleryService service;
	
	@RequestMapping("list.do")
	public void list(Model model) throws Exception{
		System.out.println("list");
		model.addAttribute("gallery", service.galleryList());
		model.addAttribute("count",service.countGallery());
//		model.addAttribute("pageResult", new PageResult(pageNo, service.countgallery()));
	}
	
	@RequestMapping("writeForm.do")
	public void writeForm(Model model) throws Exception{
		System.out.println("writeForm");
	}
	
	@RequestMapping("write.do")
	public String write(Gallery gallery) throws Exception{
		System.out.println("write");
		service.insertGallery(gallery);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	}
	
	@RequestMapping("detail.do")
	public void detail(int galleryNo,Model model) throws Exception{
		System.out.println("detail");
		service.updateViewCnt(galleryNo);
		model.addAttribute("gallery",service.detailGallery(galleryNo));
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
	
//	@RequestMapping("writeComment")
//	@ResponseBody
//	public String writeComment(GalleryComment galleryComment,int galleryNo) throws Exception{
//		System.out.println("writeComment");
//		service.insertComment(galleryComment);
//		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"detail.do?tipNo="+galleryNo;
//	}
	
	
}




