package kr.co.codin.tip.service;

import java.util.List;

import kr.co.codin.repository.domain.FileInfo;
import kr.co.codin.repository.domain.SearchTip;
import kr.co.codin.repository.domain.Tip;
import kr.co.codin.repository.domain.TipComment;
import kr.co.codin.repository.domain.TipCommentRecommend;
import kr.co.codin.repository.domain.TipRecommend;


public interface TipService {
	
	List<Tip> tipTopList();
	
	List<Tip> tipList(SearchTip searchTip);
	
	Tip detailTip(Tip tip);
	
	void insertTip(Tip tip);
	
	Tip updateForm(Tip tip);

	void updateTip(Tip tip);
	
	void deleteTip(int tipNo);
	
	void updateViewCnt(int tipNo);
	
	int countTip(SearchTip searchTip);
	
	//댓글
	void insertComment(TipComment tipComment);
	
	List<TipComment> commentList(Tip tip);
	
	void deleteComment(TipComment tipComment);
	
	void updateComment(TipComment tipComment);
	
	int countComment(int tipNo);
	
	//추천
	Integer selectRecommend(TipRecommend tipRecommend);
	void insertRecommend(TipRecommend tipRecommend);
	void deleteRecommend(TipRecommend tipRecommend);
	Integer sumRecommend(int tipNo);
	
	//댓글 추천
	Integer selectCommentRecommend(TipCommentRecommend tipCommentRecommend);
	void insertCommentRecommend(TipCommentRecommend tipCommentRecommend);
	void deleteCommentRecommend(TipCommentRecommend tipCommentRecommend);
	//파일
	
	void uploadFile(FileInfo fileInfo);
	
	void deleteFile(FileInfo fileInfo);
	
	void intsertBoardNo(int tipNo);
	
}
