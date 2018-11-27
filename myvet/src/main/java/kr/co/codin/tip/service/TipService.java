package kr.co.codin.tip.service;

import java.util.List;

import kr.co.codin.repository.domain.Tip;
import kr.co.codin.repository.domain.TipComment;
import kr.co.codin.repository.domain.TipRecommend;


public interface TipService {
	
	List<Tip> tipList();
	
	Tip detailTip(int tipNo);
	
	void insertTip(Tip tip);
	
	Tip updateForm(int tipNo);

	void updateTip(Tip tip);
	
	void deleteTip(int tipNo);
	
	void updateViewCnt(int tipNo);
	
	int countTip();
	
	//댓글
	void insertComment(TipComment tipComment);
	
	List<TipComment> commentList(int tipNo);
	
	void deleteComment(TipComment tipComment);
	
	void updateComment(TipComment tipComment);
	
	int countComment(int tipNo);
	
	void insertRecommend(TipRecommend tipRecommend);
}
