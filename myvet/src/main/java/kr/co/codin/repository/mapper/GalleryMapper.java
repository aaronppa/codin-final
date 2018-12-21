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
	List<Gallery> selectTopGallery();
	Gallery selectGalleryByNo(Gallery gallery);
	void insertGallery(Gallery gallery);
	void updateGallery(Gallery gallery);
	void deleteGallery(int galleryNo);
	void updateViewCnt(int galleryNo);
	int countGallery(SearchGallery searchGallery);
	
	
//	//댓글
	void insertComment(GalleryComment galleryComment);
	List<GalleryComment> selectComment(Gallery gallery);
	void deleteComment(GalleryComment galleryComment);
	void updateComment(GalleryComment galleryComment);
	int countComment(int galleryNo);
//	//추천
	Integer selectRecommend(GalleryRecommend galleryRecommend);
	int insertRecommend(GalleryRecommend galleryRecommend);
	void deleteRecommend(GalleryRecommend galleryRecommend);
	Integer sumRecommend(int galleryNo);
	
	//댓글추천
	Integer selectCommentRecommend(GalleryCommentRecommend galleryCommentRecommend);
	int insertCommentRecommend(GalleryCommentRecommend galleryCommentRecommend);
	void deleteCommentRecommend(GalleryCommentRecommend galleryCommentRecommend);
	
	
	//파일
	List<FileInfo> selectFile(int boardNo);
	void uploadFile(FileInfo fileInfo);
//	void deleteFile(FileInfo fileInfo);
	void updateFileid(FileInfo fileInfo);
	void updateFileDb(FileInfo fileinfo);
	int forModelAttributeFIleInfo(int boardNo);
}
