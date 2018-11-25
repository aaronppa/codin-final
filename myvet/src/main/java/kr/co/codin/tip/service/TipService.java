package kr.co.codin.tip.service;

import java.util.List;

import kr.co.codin.repository.domain.Tip;
import kr.co.codin.repository.domain.TipComment;


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
}
