package kr.co.codin.gallery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.FileInfo;
import kr.co.codin.repository.domain.Gallery;
import kr.co.codin.repository.domain.GalleryComment;
import kr.co.codin.repository.domain.GalleryCommentRecommend;
import kr.co.codin.repository.domain.GalleryRecommend;
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

//	@Override
//	public void uploadFile(FileInfo fileInfo) {
//		mapper.uploadFile(fileInfo);
//	}

	@Override
	public int countComment(int galleryNo) {
		return mapper.countComment(galleryNo);
	}

	
	@Override
	public void updateComment(GalleryComment galleryComment) {
		mapper.updateComment(galleryComment);
	}

	@Override
	public void deleteComment(GalleryComment galleryComment) {
		mapper.deleteComment(galleryComment);
	}

	//추천
	
	@Override
	public Integer selectRecommend(GalleryRecommend galleryRecommend) {
		return mapper.selectRecommend(galleryRecommend);
	}

	@Override
	public void insertRecommend(GalleryRecommend galleryRecommend) {
		mapper.deleteRecommend(galleryRecommend);
		int recommend = galleryRecommend.getRecommend();
		if(recommend == 1 || recommend == -1) {
			mapper.insertRecommend(galleryRecommend);
		}
		 
	}

	@Override
	public void deleteRecommend(GalleryRecommend galleryRecommend) {
		mapper.deleteRecommend(galleryRecommend);
	}

	@Override
	public Integer sumRecommend(int galleryNo) {
		return mapper.sumRecommend(galleryNo);
	}

	//댓글 추천
	
	@Override
	public Integer selectCommentRecommend(GalleryCommentRecommend galleryCommentRecommend) {
		return mapper.selectCommentRecommend(galleryCommentRecommend);
	}

	@Override
	public void insertCommentRecommend(GalleryCommentRecommend galleryCommentRecommend) {
		mapper.deleteCommentRecommend(galleryCommentRecommend);
		int recommend = galleryCommentRecommend.getRecommend();
		if(recommend == 1 || recommend == -1) {
			mapper.insertCommentRecommend(galleryCommentRecommend);
		}
	}

	
	
	
	@Override
	public void uploadFile(FileInfo fileInfo) {
		mapper.uploadFile(fileInfo);
	}

	@Override
	public void deleteCommentRecommend(GalleryCommentRecommend galleryCommentRecommend) {
		mapper.deleteCommentRecommend(galleryCommentRecommend);
	}
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	

}
