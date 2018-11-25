package kr.co.codin.repository.mapper;

import java.util.List;

import kr.co.codin.repository.domain.Tip;
import kr.co.codin.repository.domain.TipComment;

public interface TipMapper {

	List<Tip>selectTip();
	Tip selectTipByNo(int tipNo);
	void insertTip(Tip tip);
	void updateTip(Tip tip);
	void deleteTip(int tipNo);
	void updateViewCnt(int tipNo);
	int countTip();
	
	//댓글
	void insertComment(TipComment tipComment);
}
