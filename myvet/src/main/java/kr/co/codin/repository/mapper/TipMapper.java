package kr.co.codin.repository.mapper;

import java.util.List;

import kr.co.codin.repository.domain.Tip;
import kr.co.codin.repository.domain.TipComment;
import kr.co.codin.repository.domain.TipRecommend;

public interface TipMapper {

	List<Tip> selectTip();
	Tip selectTipByNo(int tipNo);
	void insertTip(Tip tip);
	void updateTip(Tip tip);
	void deleteTip(int tipNo);
	void updateViewCnt(int tipNo);
	int countTip();
	
	//댓글
	void insertComment(TipComment tipComment);
	List<TipComment> selectComment(int tipNo);
	void deleteComment(TipComment tipComment);
	void updateComment(TipComment tipComment);
	int countComment(int tipNo);
	//추천
	void insertRecommend(TipRecommend tipRecommend);
	
}
