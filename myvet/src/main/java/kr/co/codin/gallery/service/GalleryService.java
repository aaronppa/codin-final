package kr.co.codin.gallery.service;

import java.util.List;

import kr.co.codin.repository.domain.FileInfo;
import kr.co.codin.repository.domain.Gallery;
import kr.co.codin.repository.domain.GalleryComment;
import kr.co.codin.repository.domain.SearchGallery;

public interface GalleryService {
	List<Gallery> galleryList(SearchGallery searchGallery);
	
	Gallery detailGallery(int galleryNo);
	
	void insertGallery(Gallery gallery);
	
	Gallery updateForm(int galleryNo);

	void updateGallery(Gallery gallery);
	
	void deleteGallery(int galleryNo);
	
	void updateViewCnt(int galleryNo);
	
	int countGallery();
	
	//댓글
	void insertComment(GalleryComment galleryComment);
//	
	List<GalleryComment> commentList(int galleryNo);
//	
//	void deleteComment(GalleryComment galleryComment);
//	
//	void updateComment(GalleryComment galleryComment);
//	
//	int countComment(int GalleryNo);
//	
//	//추천
//	GalleryRecommend selectRecommend(int galleryNo);
//	int insertRecommend(GalleryRecommend galleryRecommend);
//	void deleteRecommend(GalleryRecommend galleryRecommend);
//	
//	//파일
//	
	void uploadFile(FileInfo fileInfo);
//	
//	void deleteFile(FileInfo fileInfo);
}
