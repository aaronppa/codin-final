package kr.co.codin.repository.mapper;

import java.util.List;

import kr.co.codin.repository.domain.FileInfo;
import kr.co.codin.repository.domain.Gallery;
import kr.co.codin.repository.domain.GalleryComment;
import kr.co.codin.repository.domain.GalleryCommentRecommend;
import kr.co.codin.repository.domain.GalleryRecommend;
import kr.co.codin.repository.domain.Page;
import kr.co.codin.repository.domain.SearchGallery;


public interface GalleryMapper {
	List<Gallery> selectGallery(SearchGallery searchGallery);
	Gallery selectGalleryByNo(int galleryNo);
	void insertGallery(Gallery gallery);
	void updateGallery(Gallery gallery);
	void deleteGallery(int galleryNo);
	void updateViewCnt(int galleryNo);
	int countGallery();
	
	
//	//댓글
	void insertComment(GalleryComment galleryComment);
	List<GalleryComment> selectComment(int galleryNo);
	void deleteComment(GalleryComment galleryComment);
	void updateComment(GalleryComment galleryComment);
	int countComment(int galleryNo);
//	//추천
	Integer selectRecommend(GalleryRecommend galleryRecommend);
	int insertRecommend(GalleryRecommend galleryRecommend);
	void deleteRecommend(GalleryRecommend galleryRecommend);
	Integer sumRecommend(int galleryNo);
	
	//댓글 추천
	Integer selectCommentRecommend(GalleryCommentRecommend galleryCommentRecommend);
	int insertCommentRecommend(GalleryCommentRecommend galleryCommentRecommend);
	void deleteCommentRecommend(GalleryCommentRecommend galleryCommentRecommend);
	
	
	//파일
	void selectFile(List<FileInfo> selectFile);
	void uploadFile(FileInfo fileInfo);
//	void deleteFile(FileInfo fileInfo);
	void updateFile(FileInfo fileInfo);
}
