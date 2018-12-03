package kr.co.codin.repository.mapper;

import java.util.List;

import kr.co.codin.repository.domain.Gallery;
import kr.co.codin.repository.domain.GalleryComment;
import kr.co.codin.repository.domain.Page;


public interface GalleryMapper {
	List<Gallery> selectGallery(Page page);
	Gallery selectGalleryByNo(int galleryNo);
	void insertGallery(Gallery gallery);
	void updateGallery(Gallery gallery);
	void deleteGallery(int galleryNo);
	void updateViewCnt(int galleryNo);
	int countGallery();
	
//	//댓글
	void insertComment(GalleryComment galleryComment);
	List<GalleryComment> selectComment(int galleryNo);
//	void deleteComment(galleryComment galleryComment);
//	void updateComment(galleryComment galleryComment);
//	int countComment(int galleryNo);
//	//추천
//	galleryRecommend selectRecommend(int galleryNo);
//	int insertRecommend(galleryRecommend galleryRecommend);
//	void deleteRecommend(galleryRecommend galleryRecommend);
	
	//파일
//	void uploadFile(FileInfo fileInfo);
//	void deleteFile(FileInfo fileInfo);
}
