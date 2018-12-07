package kr.co.codin.gallery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.FileInfo;
import kr.co.codin.repository.domain.Gallery;
import kr.co.codin.repository.domain.GalleryComment;
import kr.co.codin.repository.domain.Page;
import kr.co.codin.repository.domain.SearchGallery;
import kr.co.codin.repository.domain.SearchTip;
import kr.co.codin.repository.mapper.GalleryMapper;


@Service
public class GalleryServiceImpl implements GalleryService{
	@Autowired 
	private GalleryMapper mapper;

	

	
	@Override
	public List<Gallery> galleryList(SearchGallery searchGallery) {
		return mapper.selectGallery(searchGallery);
	}

	@Override
	public Gallery detailGallery(int galleryNo) {
		// TODO Auto-generated method stub
		return mapper.selectGalleryByNo(galleryNo);
	}

	@Override
	public void insertGallery(Gallery gallery) {
		mapper.insertGallery(gallery);
		
	}

	@Override
	public Gallery updateForm(int galleryNo) {
		return mapper.selectGalleryByNo(galleryNo);
	}

	@Override
	public void updateGallery(Gallery gallery) {
		mapper.updateGallery(gallery);
	}

	@Override
	public void deleteGallery(int galleryNo) {
		mapper.deleteGallery(galleryNo);
	}

	@Override
	public void updateViewCnt(int galleryNo) {
		mapper.updateViewCnt(galleryNo);
	}

	@Override
	public int countGallery() {
		return mapper.countGallery();
	}

	//댓글

	@Override
	public void insertComment(GalleryComment galleryComment) {
		mapper.insertComment(galleryComment);
	}

	@Override
	public List<GalleryComment> commentList(int galleryNo) {
		return mapper.selectComment(galleryNo);
	}

	@Override
	public void uploadFile(FileInfo fileInfo) {
		mapper.uploadFile(fileInfo);
	}
	
	

	
	
	
	
	

}
