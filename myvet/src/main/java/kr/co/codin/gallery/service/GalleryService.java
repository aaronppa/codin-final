package kr.co.codin.gallery.service;

import java.util.List;

import kr.co.codin.repository.domain.FileInfo;
import kr.co.codin.repository.domain.Gallery;
import kr.co.codin.repository.domain.GalleryComment;
import kr.co.codin.repository.domain.GalleryCommentRecommend;
import kr.co.codin.repository.domain.GalleryRecommend;
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
	void deleteComment(GalleryComment galleryComment);
//	
	void updateComment(GalleryComment galleryComment);
//	
	int countComment(int galleryNo);
//	
//	//추천
	Integer selectRecommend(GalleryRecommend galleryRecommend);
	void insertRecommend(GalleryRecommend galleryRecommend);
	void deleteRecommend(GalleryRecommend galleryRecommend);
	Integer sumRecommend(int galleryNo);
	
	//댓글 추천
	Integer selectCommentRecommend(GalleryCommentRecommend galleryCommentRecommend);
	void insertCommentRecommend(GalleryCommentRecommend galleryCommentRecommend);
	void deleteCommentRecommend(GalleryCommentRecommend galleryCommentRecommend);
	
	
	
//	//파일
//	
	void selectFile(List<Gallery> fileInfoList);
	void uploadFile(FileInfo fileInfo);
//	
//	void deleteFile(FileInfo fileInfo);
}
